simulation_duration = 480 # 8 hours in minutes
arrival_interval = 1..5   # Arrival interval between 1-5 minutes
service_interval = 3..8   # Service time between 3-8 minutes

events = [{ time: 0, type: :arrival }] # Event list
waiting_queue = []                     # Waiting queue
server_busy = false                    # Server state

# Statistics
total_customers = 0
total_wait_time = 0
total_system_time = 0
server_busy_time = 0

while !events.empty?
  # Sort events by time
  events.sort_by! { |e| e[:time] }
  current_event = events.shift
  current_time = current_event[:time]

  if current_event[:type] == :arrival
    total_customers += 1

    # Schedule next arrival
    if current_time < simulation_duration
      next_arrival_time = current_time + rand(arrival_interval)
      events << { time: next_arrival_time, type: :arrival } if next_arrival_time <= simulation_duration
    end

    if server_busy
      waiting_queue << current_time # Add to queue
    else
      # Start immediate service
      server_busy = true
      service_time = rand(service_interval)
      end_time = current_time + service_time
      busy_duration = [end_time, simulation_duration].min - current_time
      server_busy_time += busy_duration if busy_duration > 0
      events << { time: end_time, type: :departure, arrival_time: current_time }
    end

  else # Departure event
    arrival_time = current_event[:arrival_time]
    total_system_time += current_time - arrival_time

    if waiting_queue.any?
      # Serve next customer in the queue
      customer_arrival = waiting_queue.shift
      total_wait_time += current_time - customer_arrival
      
      service_time = rand(service_interval)
      end_time = current_time + service_time
      busy_duration = [end_time, simulation_duration].min - current_time
      server_busy_time += busy_duration if busy_duration > 0
      events << { time: end_time, type: :departure, arrival_time: customer_arrival }
    else
      server_busy = false
    end
  end
end

average_wait = total_wait_time.to_f / total_customers
average_system = total_system_time.to_f / total_customers
occupancy_rate = (server_busy_time.to_f / simulation_duration) * 100

puts "\n--- Final Statistics ---"
puts "Customers served: #{total_customers}"
puts "Average wait time: #{average_wait.round(2)} minutes"
puts "Average time in system: #{average_system.round(2)} minutes"
puts "Server occupancy: #{occupancy_rate.round(2)}%"
