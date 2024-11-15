// ================================================================================ //
// The NEORV32 RISC-V Processor - https://github.com/stnolting/neorv32              //
// Copyright (c) NEORV32 contributors.                                              //
// Copyright (c) 2020 - 2024 Stephan Nolting. All rights reserved.                  //
// Licensed under the BSD-3-Clause license, see LICENSE for details.                //
// SPDX-License-Identifier: BSD-3-Clause                                            //
// ================================================================================ //


/**********************************************************************//**
 * @file demo_hpm/main.c
 * @author Stephan Nolting
 * @brief Hardware performance monitor (HPM) example program.
 **************************************************************************/
#include <neorv32.h>


#include <string.h>

/**********************************************************************//**
 * @name User configuration
 **************************************************************************/
/**@{*/
/** UART BAUD rate */
#define BAUD_RATE 19200
/**@}*/

#define ITERS 10

void float_to_string(float number, char* buffer, int decimal_places) {
    // Split into integer and decimal parts
    int integer_part = (int)number;
    float decimal_part = number - integer_part;
    
    // Convert decimal to integer based on desired precision
    int decimal_as_int = (int)(decimal_part * (10 * decimal_places));
    if (decimal_as_int < 0) decimal_as_int = -decimal_as_int;
    
    // Convert integer part to string
    int i = 0;
    if (integer_part < 0) {
        buffer[i++] = '-';
        integer_part = -integer_part;
    }
    
    // Handle integer part
    char int_buffer[16];
    int int_len = 0;
    do {
        int_buffer[int_len++] = '0' + (integer_part % 10);
        integer_part /= 10;
    } while (integer_part > 0);
    
    // Reverse the integer digits
    while (int_len > 0) {
        buffer[i++] = int_buffer[--int_len];
    }
    
    // Add decimal point and decimal places
    buffer[i++] = '.';
    
    // Convert decimal part
    for (int j = 0; j < decimal_places; j++) {
        buffer[i++] = '0' + (decimal_as_int % 10);
        decimal_as_int /= 10;
    }
    
    buffer[i] = '\0';
}

void calculate_benchmark_time(uint32_t cycles, uint32_t clock_freq) {
    float time_seconds = (float)cycles / clock_freq;

    char buff[32];
    float_to_string(time_seconds, buff, 3);
    
    neorv32_uart0_printf("\nBenchmark Timing:\n");
    neorv32_uart0_printf("Total time: %s seconds\n", buff);
}

void calculate_ipc(uint32_t instructions, uint32_t cycles) {
    float ipc = (float)instructions / cycles;

    char buff[32];
    float_to_string(ipc, buff, 3);
    neorv32_uart0_printf("Instructions per cycle (IPC): %s\n", buff);
}

void calculate_memory_metrics(uint32_t loads, uint32_t stores, uint32_t wait_cycles, uint32_t total_cycles) {
    uint32_t total_memory_ops = loads + stores;
    float memory_wait_percentage = ((float)wait_cycles / total_cycles) * 100;
    
    char buff[32];
    float_to_string(memory_wait_percentage, buff, 3);
    
    neorv32_uart0_printf("\nMemory Statistics:\n");
    neorv32_uart0_printf("Total memory operations: %u\n", total_memory_ops);
    neorv32_uart0_printf("Memory wait cycles: %u (%s%% of total time)\n", wait_cycles, buff);
    neorv32_uart0_printf("Average cycles per memory operation: %f\n", (float)wait_cycles / total_memory_ops);
}

/**********************************************************************//**
 * Main function
 *
 * @note This program requires the CPU Zihpm extension (with at least 2 regions) and UART0.
 *
 * @return 0 if execution was successful
 **************************************************************************/
int main() {

  // initialize NEORV32 run-time environment
  neorv32_rte_setup();

  // setup UART at default baud rate, no interrupts
  neorv32_uart0_setup(BAUD_RATE, 0);

  // check if UART0 is implemented
  if (neorv32_uart0_available() == 0) {
    return 1; // UART0 not available, exit
  }

  // check if Zihpm is implemented at all
  if ((neorv32_cpu_csr_read(CSR_MXISA) & (1 << CSR_MXISA_ZIHPM)) == 0) {
    neorv32_uart0_printf("ERROR! Zihpm CPU extension not implemented!\n");
    return 1;
  }

  // check if at least one HPM counter is implemented
  if (neorv32_cpu_hpm_get_num_counters() == 0) {
    neorv32_uart0_printf("ERROR! No HPM counters implemented!\n");
    return 1;
  }


  // intro
  neorv32_uart0_printf("\n<<< NEORV32 Hardware Performance Monitors (HPMs) Example Program >>>\n\n");
  neorv32_uart0_printf("[NOTE] Clockspeed: %d Hz\n", (uint32_t)neorv32_sysinfo_get_clk());
  neorv32_uart0_printf("[NOTE] This program will use up to 9 HPM counters (if available).\n\n");


  // show HPM hardware configuration
  uint32_t hpm_num = neorv32_cpu_hpm_get_num_counters();
  uint32_t hpm_width = neorv32_cpu_hpm_get_size();
  neorv32_uart0_printf("%u HPM counters detected, each %u bits wide\n", hpm_num, hpm_width);


  // stop all CPU counters including HPMs
  neorv32_cpu_csr_write(CSR_MCOUNTINHIBIT, -1);


  // clear HPM counters (low and high word);
  // there will be NO exception if we access a HPM counter register that has not been implemented
  // as long as Zihpm is implemented
  if (hpm_num > 0) { neorv32_cpu_csr_write(CSR_MHPMCOUNTER3,  0); neorv32_cpu_csr_write(CSR_MHPMCOUNTER3H,  0); }
  if (hpm_num > 1) { neorv32_cpu_csr_write(CSR_MHPMCOUNTER4,  0); neorv32_cpu_csr_write(CSR_MHPMCOUNTER4H,  0); }
  if (hpm_num > 2) { neorv32_cpu_csr_write(CSR_MHPMCOUNTER5,  0); neorv32_cpu_csr_write(CSR_MHPMCOUNTER5H,  0); }
  if (hpm_num > 3) { neorv32_cpu_csr_write(CSR_MHPMCOUNTER6,  0); neorv32_cpu_csr_write(CSR_MHPMCOUNTER6H,  0); }
  if (hpm_num > 4) { neorv32_cpu_csr_write(CSR_MHPMCOUNTER7,  0); neorv32_cpu_csr_write(CSR_MHPMCOUNTER7H,  0); }
  if (hpm_num > 5) { neorv32_cpu_csr_write(CSR_MHPMCOUNTER8,  0); neorv32_cpu_csr_write(CSR_MHPMCOUNTER8H,  0); }
  if (hpm_num > 6) { neorv32_cpu_csr_write(CSR_MHPMCOUNTER9,  0); neorv32_cpu_csr_write(CSR_MHPMCOUNTER9H,  0); }
  if (hpm_num > 7) { neorv32_cpu_csr_write(CSR_MHPMCOUNTER10, 0); neorv32_cpu_csr_write(CSR_MHPMCOUNTER10H, 0); }
  if (hpm_num > 8) { neorv32_cpu_csr_write(CSR_MHPMCOUNTER11, 0); neorv32_cpu_csr_write(CSR_MHPMCOUNTER11H, 0); }

  // NOTE regarding HPMs 0..2, which are not "actual" HPMs
  // - HPM 0 is the machine cycle counter
  // - HPM 1 is the machine system timer
  // - HPM 2 is the machine instret counter
  // these counters have fixed event configurations; however, these according events can also be used for any other "real" HPM

  // setup base counters if available
  if ((neorv32_cpu_csr_read(CSR_MXISA) & (1 << CSR_MXISA_ZICNTR))) {
    neorv32_cpu_csr_write(CSR_MCYCLE,   0); neorv32_cpu_csr_write(CSR_MCYCLEH,   0);
    neorv32_cpu_csr_write(CSR_MINSTRET, 0); neorv32_cpu_csr_write(CSR_MINSTRETH, 0);
  }

  // configure events - one event per counter;
  // we can also configure more than one event; the HPM will increment if _any_ event triggers (logical OR);
  // there will be NO exception if we access a HPM event register that has not been implemented
  // as long as Zihpm is implemented
  if (hpm_num > 0) { neorv32_cpu_csr_write(CSR_MHPMEVENT3,  1 << HPMCNT_EVENT_COMPR);    } // executed compressed instruction
  if (hpm_num > 1) { neorv32_cpu_csr_write(CSR_MHPMEVENT4,  1 << HPMCNT_EVENT_WAIT_DIS); } // instruction dispatch wait cycle
  if (hpm_num > 2) { neorv32_cpu_csr_write(CSR_MHPMEVENT5,  1 << HPMCNT_EVENT_WAIT_ALU); } // multi-cycle ALU co-processor wait cycle
  if (hpm_num > 3) { neorv32_cpu_csr_write(CSR_MHPMEVENT6,  1 << HPMCNT_EVENT_BRANCH);   } // executed branch instruction
  if (hpm_num > 4) { neorv32_cpu_csr_write(CSR_MHPMEVENT7,  1 << HPMCNT_EVENT_BRANCHED); } // control flow transfer
  if (hpm_num > 5) { neorv32_cpu_csr_write(CSR_MHPMEVENT8,  1 << HPMCNT_EVENT_LOAD);     } // executed load operation
  if (hpm_num > 6) { neorv32_cpu_csr_write(CSR_MHPMEVENT9,  1 << HPMCNT_EVENT_STORE);    } // executed store operation
  if (hpm_num > 7) { neorv32_cpu_csr_write(CSR_MHPMEVENT10, 1 << HPMCNT_EVENT_WAIT_LSU); } // load-store unit memory wait cycle
  if (hpm_num > 8) { neorv32_cpu_csr_write(CSR_MHPMEVENT11, 1 << HPMCNT_EVENT_TRAP);     } // entered trap


  // enable all CPU counters including HPMs
  neorv32_cpu_csr_write(CSR_MCOUNTINHIBIT, 0);

  // Benchmark here
  neorv32_uart0_printf("\n > Starting benchmark. \n");
  for (int i = 0; i < ITERS; i++)   {    
    // Instruction stressing
    int intstr_size = 100; 
    volatile int a[intstr_size], b[intstr_size], c[intstr_size];

    for (int i = 0; i < intstr_size; i++) {
      b[i] = i;
      c[i] = i + 1;
    }

    for (int i = 0; i < intstr_size; i += 4) {
      int tmp1 = b[i] + c[i];
      int tmp2 = b[i + 1] ^ c[i + 1];
      a[i] = tmp1 * tmp2;
      a[i + 1] = tmp2 >> 2;
      a[i + 2] = (tmp1 | c[i + 2]) & 0xFF;
      a[i + 3] = b[i + 3] + (c[i + 3] << 1);
    }
    neorv32_uart0_printf(" \t> Output: %d\n", a[c[40] & b[intstr_size - 82]]);

    // Data stressing
    int data_size = 1024;
    volatile int data[data_size];
    for (int i = 0; i < data_size; i++) {
      data[i] = i;
    }

    // Random access
    int sum = 0;
    srand(12345);
    for (int i = 0; i < 10000; i++) {
      sum += data[(rand() ^ i) % data_size];
    }

    neorv32_uart0_printf(" \t> Output: %d\n", sum);

    // Memcpy stress
    int cpy_size = 812;
    volatile char src[cpy_size], dest[cpy_size];
    for (int i = 0; i < 100; i++) {
      memcpy((void*)dest, (void*)src, cpy_size);
    }
  }

  neorv32_uart0_printf("> Benchmark Complete.\n");
  
  // stop all CPU counters including HPMs
  neorv32_cpu_csr_write(CSR_MCOUNTINHIBIT, -1);


  // print HPM counter values (low word only)
  neorv32_uart0_printf("\nHPM results (low-words only):\n");
  if ((neorv32_cpu_csr_read(CSR_MXISA) & (1 << CSR_MXISA_ZICNTR))) {
    neorv32_uart0_printf(" cycle (active clock cycles)         : %u\n", (uint32_t)neorv32_cpu_csr_read(CSR_MCYCLE));
    neorv32_uart0_printf(" instret (retired instructions)      : %u\n", (uint32_t)neorv32_cpu_csr_read(CSR_MINSTRET));
  }
  if (hpm_num > 0) { neorv32_uart0_printf(" HPM03 (compressed instructions)     : %u\n", (uint32_t)neorv32_cpu_csr_read(CSR_MHPMCOUNTER3));  }
  if (hpm_num > 1) { neorv32_uart0_printf(" HPM04 (instr. dispatch wait cycles) : %u\n", (uint32_t)neorv32_cpu_csr_read(CSR_MHPMCOUNTER4));  }
  if (hpm_num > 2) { neorv32_uart0_printf(" HPM05 (ALU wait cycles)             : %u\n", (uint32_t)neorv32_cpu_csr_read(CSR_MHPMCOUNTER5));  }
  if (hpm_num > 3) { neorv32_uart0_printf(" HPM06 (branch instructions)         : %u\n", (uint32_t)neorv32_cpu_csr_read(CSR_MHPMCOUNTER6));  }
  if (hpm_num > 4) { neorv32_uart0_printf(" HPM07 (control flow transfers)      : %u\n", (uint32_t)neorv32_cpu_csr_read(CSR_MHPMCOUNTER7));  }
  if (hpm_num > 5) { neorv32_uart0_printf(" HPM08 (load instructions)           : %u\n", (uint32_t)neorv32_cpu_csr_read(CSR_MHPMCOUNTER8));  }
  if (hpm_num > 6) { neorv32_uart0_printf(" HPM09 (store instructions)          : %u\n", (uint32_t)neorv32_cpu_csr_read(CSR_MHPMCOUNTER9));  }
  if (hpm_num > 7) { neorv32_uart0_printf(" HPM10 (load/store wait cycles)      : %u\n", (uint32_t)neorv32_cpu_csr_read(CSR_MHPMCOUNTER10)); }
  if (hpm_num > 8) { neorv32_uart0_printf(" HPM11 (entered traps)               : %u\n", (uint32_t)neorv32_cpu_csr_read(CSR_MHPMCOUNTER11)); }

  neorv32_uart0_printf("\nProgram completed.\n");

  uint32_t cycles = neorv32_cpu_csr_read(CSR_MCYCLE);
  uint32_t instructions = neorv32_cpu_csr_read(CSR_MINSTRET);
  uint32_t loads = neorv32_cpu_csr_read(CSR_MHPMCOUNTER8);
  uint32_t stores = neorv32_cpu_csr_read(CSR_MHPMCOUNTER9);
  uint32_t memory_wait = neorv32_cpu_csr_read(CSR_MHPMCOUNTER10);
  uint32_t clock_freq = neorv32_sysinfo_get_clk();


  neorv32_uart0_printf("\nBenchmarking scoring:\n\n");

  // Calculate all metrics
  calculate_benchmark_time(cycles, clock_freq);
  calculate_ipc(instructions, cycles);
  calculate_memory_metrics(loads, stores, memory_wait, cycles);

  return 0;
}
