-- ================================================================================ --
-- NEORV32 - Minimal setup without a bootloader                                     --
-- -------------------------------------------------------------------------------- --
-- The NEORV32 RISC-V Processor - https://github.com/stnolting/neorv32              --
-- Copyright (c) NEORV32 contributors.                                              --
-- Copyright (c) 2020 - 2024 Stephan Nolting. All rights reserved.                  --
-- Licensed under the BSD-3-Clause license, see LICENSE for details.                --
-- SPDX-License-Identifier: BSD-3-Clause                                            --
-- ================================================================================ --

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library neorv32;

entity neorv32_ProcessorTop_Minimal is
  generic (
    -- General --
    CLOCK_FREQUENCY            : natural := 80e6;   -- clock frequency of clk_i in Hz
    INT_BOOTLOADER_EN          : boolean := false;  -- boot configuration: true = boot explicit bootloader; false = boot from int/ext (I)MEM
    -- Internal Instruction memory --
    MEM_INT_IMEM_EN            : boolean := false;  -- implement processor-internal instruction memory
    -- Internal Data memory --
    MEM_INT_DMEM_EN            : boolean := true;   -- implement processor-internal data memory
    MEM_INT_DMEM_SIZE          : natural := 8*1024; -- size of processor-internal data memory in bytes
    -- Processor peripherals --
    IO_GPIO_NUM                : natural := 8;      -- number of GPIO input/output pairs (0..64)
    IO_UART0_EN                : boolean := true;   -- implement primary universal asynchronous receiver/transmitter (UART0)?
    IO_PWM_NUM_CH              : natural := 0;      -- number of PWM channels to implement (0..12); 0 = disabled
    -- RISC-V CPU Extensions --
    CPU_EXTENSION_RISCV_A      : boolean := false;  -- implement atomic memory operations extension?
    CPU_EXTENSION_RISCV_B      : boolean := false;  -- implement bit-manipulation extension?
    CPU_EXTENSION_RISCV_C      : boolean := false;  -- implement compressed extension?
    CPU_EXTENSION_RISCV_E      : boolean := false;  -- implement embedded RF extension?
    CPU_EXTENSION_RISCV_M      : boolean := false;  -- implement mul/div extension?
    CPU_EXTENSION_RISCV_U      : boolean := false;  -- implement user mode extension?
    CPU_EXTENSION_RISCV_Zfinx  : boolean := false;  -- implement 32-bit floating-point extension (using INT regs!)
    CPU_EXTENSION_RISCV_Zicntr : boolean := true;   -- implement base counters?
    CPU_EXTENSION_RISCV_Zicond : boolean := false;  -- implement integer conditional operations?
    CPU_EXTENSION_RISCV_Zihpm  : boolean := false;  -- implement hardware performance monitors?
    CPU_EXTENSION_RISCV_Zmmul  : boolean := false;  -- implement multiply-only M sub-extension?
    CPU_EXTENSION_RISCV_Zxcfu  : boolean := false;  -- implement custom (instr.) functions unit?
    -- External bus interface (XBUS) --
    XBUS_EN                    : boolean := true;   -- implement external memory bus interface?
    XBUS_TIMEOUT               : natural := 255     -- cycles after a pending bus access auto-terminates (0 = disabled)
  );
  port (
    -- Global control --
    clk_i  : in  std_logic;                              -- global clock, rising edge
    rstn_i : in  std_logic;                              -- global reset, low-active, async
    -- External bus interface (available if XBUS_EN = true) --
    xbus_adr_o     : out std_ulogic_vector(31 downto 0); -- address
    xbus_dat_o     : out std_ulogic_vector(31 downto 0); -- write data
    xbus_tag_o     : out std_ulogic_vector(2 downto 0);  -- access tag
    xbus_we_o      : out std_ulogic;                     -- read/write
    xbus_sel_o     : out std_ulogic_vector(3 downto 0);  -- byte enable
    xbus_stb_o     : out std_ulogic;                     -- strobe
    xbus_cyc_o     : out std_ulogic;                     -- valid cycle
    xbus_dat_i     : in  std_ulogic_vector(31 downto 0); -- read data
    xbus_ack_i     : in  std_ulogic;                     -- transfer acknowledge
    xbus_err_i     : in  std_ulogic;                     -- transfer error
    -- GPIO (available if IO_GPIO_NUM > 0) --
    gpio_o         : out std_ulogic_vector(7 downto 0); -- parallel output
    -- primary UART0 (available if IO_UART0_EN = true) --
    uart0_txd_o    : out std_ulogic;                     -- UART0 send data
    uart0_rxd_i    : in  std_ulogic                      -- UART0 receive data
  );
end entity;

architecture neorv32_ProcessorTop_Minimal_rtl of neorv32_ProcessorTop_Minimal is

  -- internal IO connection --
  signal con_gpio_o  : std_ulogic_vector(63 downto 0);

begin

  -- The core of the problem ----------------------------------------------------------------
  -- -------------------------------------------------------------------------------------------
  neorv32_inst: entity neorv32.neorv32_top
  generic map (
    -- General --
    CLOCK_FREQUENCY            => CLOCK_FREQUENCY,
    INT_BOOTLOADER_EN          => INT_BOOTLOADER_EN,
    -- Internal Instruction memory --
    MEM_INT_IMEM_EN            => MEM_INT_IMEM_EN,
    -- Internal Data memory --
    MEM_INT_DMEM_EN            => MEM_INT_DMEM_EN,
    MEM_INT_DMEM_SIZE          => MEM_INT_DMEM_SIZE,
    -- Processor peripherals --
    IO_GPIO_NUM                => IO_GPIO_NUM,
    IO_UART0_EN                => IO_UART0_EN,
    IO_PWM_NUM_CH              => IO_PWM_NUM_CH,
    -- RISC-V CPU Extensions --
    CPU_EXTENSION_RISCV_A      => CPU_EXTENSION_RISCV_A,
    CPU_EXTENSION_RISCV_B      => CPU_EXTENSION_RISCV_B,
    CPU_EXTENSION_RISCV_C      => CPU_EXTENSION_RISCV_C,
    CPU_EXTENSION_RISCV_E      => CPU_EXTENSION_RISCV_E,
    CPU_EXTENSION_RISCV_M      => CPU_EXTENSION_RISCV_M,
    CPU_EXTENSION_RISCV_U      => CPU_EXTENSION_RISCV_U,
    CPU_EXTENSION_RISCV_Zfinx  => CPU_EXTENSION_RISCV_Zfinx,
    CPU_EXTENSION_RISCV_Zicntr => CPU_EXTENSION_RISCV_Zicntr,
    CPU_EXTENSION_RISCV_Zicond => CPU_EXTENSION_RISCV_Zicond,
    CPU_EXTENSION_RISCV_Zihpm  => CPU_EXTENSION_RISCV_Zihpm,
    CPU_EXTENSION_RISCV_Zmmul  => CPU_EXTENSION_RISCV_Zmmul,
    CPU_EXTENSION_RISCV_Zxcfu  => CPU_EXTENSION_RISCV_Zxcfu,
    -- External bus interface (XBUS) --
    XBUS_EN                    => XBUS_EN,
    XBUS_TIMEOUT               => XBUS_TIMEOUT
  )
  port map (
    -- Global control --
    clk_i => clk_i,
    rstn_i => rstn_i,
    -- External bus interface (available if XBUS_EN = true) --
    xbus_adr_o => xbus_adr_o,
    xbus_dat_o => xbus_dat_o,
    xbus_tag_o => xbus_tag_o,
    xbus_we_o  => xbus_we_o,
    xbus_sel_o => xbus_sel_o,
    xbus_stb_o => xbus_stb_o,
    xbus_cyc_o => xbus_cyc_o,
    xbus_dat_i => xbus_dat_i,
    xbus_ack_i => xbus_ack_i,
    xbus_err_i => xbus_err_i,
    -- GPIO (available if IO_GPIO_NUM > 0) --
    gpio_o     => con_gpio_o,
    -- primary UART0 (available if IO_UART0_EN = true) --
    uart0_txd_o => uart0_txd_o,
    uart0_rxd_i => uart0_rxd_i
  );

  -- PWM --
  gpio_o <= con_gpio_o(IO_GPIO_NUM-1 downto 0);
end architecture;
