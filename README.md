# NEORV32 SRAM implementation

In this thesis project I will use Libero to implement the NEORV32 CPU on to an FPGA by making use of SRAM instead of the flash memory.

## Schedule

| **Week** | **Task**                                   | **Description**                                                                                 |
|----------|--------------------------------------------|-------------------------------------------------------------------------------------------------|
| Week 1   | Requirements and Design Specification      | - Define the project scope and specific objectives.                                             |
|          |                                            | - Read up on the NEORV32 github.                                                                |
|          | Development Environment Setup              | - Set up the development environment: FPGA board, librero.                                      |
| Week 2   | Get to know tools                          | - Configure and test basic FPGA functionalities. Make simple timed counter.                     |
| Week 3   | Initial NEORV32 Implementation on FPGA     | - Implement a basic NEORV32 setup on the FPGA using standard memory: Flash.                     |
|          |                                            | - Verify correct functionality of the basic setup.                                              |
| Week 4   | SRAM Integration Design                    | - Design the SRAM interface for NEORV32 on the FPGA.                                            |
|          |                                            | - Modify the NEORV32 implementation to utilize SRAM instead of Flash memory.                    |
| Week 5   | SRAM Interface Implementation              | - Implement the SRAM interface design on the FPGA.                                              |
|          |                                            | - Connect and integrate SRAM with the NEORV32 core.                                             |
| Week 6   | Integration Testing and Debugging          | - Perform thorough testing of the NEORV32 implementation with SRAM.                             |
|          |                                            | - Debug and resolve issues related to SRAM access and overall CPU functionality.                |
| Week 7   | Performance Optimization                   | - Optimize memory access timings and CPU performance with SRAM.                                 |
|          |                                            | - Ensure the system meets the required performance benchmarks.                                  |
| Week 8   | Final Testing and Validation               | - Conduct final tests to validate the complete implementation.                                  |
|          |                                            | - Verify stability and reliability of the system over multiple test cases.                      |
| Week 9   | Report Writing and Documentation           | - Start documenting the entire process, including design choices, implementation details, and testing.   |
|          |                                            | - Prepare diagrams, charts, and other supporting materials for the report.                      |
| Week 10  | Final Report Writing and Review            | - Review and finalize the thesis report.                                                        |
|          |                                            | - Get feedback from your advisor and make necessary revisions.                                  |

# This is the Flash implementation