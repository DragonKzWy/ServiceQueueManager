```markdown
# Service Queue Simulation

This is a Ruby-based simulation of a service queue, such as those found in banks or supermarkets. The application models customer arrivals, service times, and queue behavior, providing statistical insights into the system's performance.

## Features

- **Queue Simulation**: Simulates a single-server queue system with FIFO (First-In-First-Out) logic.
- **Randomized Events**: Generates random customer arrival intervals and service times to mimic real-world scenarios.
- **Statistical Analysis**: Calculates key performance metrics, including:
  - Average wait time
  - Average time in the system
  - Server occupancy rate

## How It Works

The simulation uses a discrete-event approach, where events (arrivals and departures) are processed in chronological order. Key components include:

1. **Event Queue**: Manages events (arrivals and departures) sorted by time.
2. **Waiting Queue**: Tracks customers waiting for service.
3. **Server Status**: Monitors whether the server is busy or idle.
4. **Statistics Tracking**: Records metrics such as total customers, wait times, and server utilization.

## Usage

1. Clone the repository:
   ```bash
   git clone https://github.com/DragonKzwy/ServiceQueueManager.git
   cd ServiceQueueManager
   ```

2. Run the simulation:
   ```bash
   ruby ServiceQueueManager.rb
   ```

3. View the results:
   The simulation outputs statistics including:
   - Total customers served
   - Average wait time
   - Average time in the system
   - Server occupancy rate

## Customization

You can adjust the simulation parameters in the `simulador_fila.rb` file:
- `simulation_duration`: Total simulation time in minutes (default: 480 minutes for 8 hours).
- `arrival_interval`: Range of customer arrival intervals in minutes (default: 1..5 minutes).
- `service_interval`: Range of service times in minutes (default: 3..8 minutes).

## Example Output

```
--- Final Statistics ---
Customers served: 120
Average wait time: 4.32 minutes
Average time in system: 8.76 minutes
Server occupancy: 85.42%
```

## Contributing

Contributions are welcome! If you'd like to improve the simulation or add new features, feel free to open an issue or submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

Developed with ❤️ by [Your Name]. Happy coding!
``` 

Copy and paste this into a `README.md` file in your GitHub repository. Make sure to replace placeholders like `your-username` and `[Your Name]` with your actual GitHub username and name.
