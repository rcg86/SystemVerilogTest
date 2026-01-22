#=============================================================================
# Makefile for Day 1 Labs
# Description: Builds and runs Verilator simulations for all Day 1 designs
# Usage:
#   make adder_4bit      - Build and run 4-bit adder
#   make clean           - Remove all generated files
#=============================================================================

# Compiler and flags
CXX = g++
CXXFLAGS = -std=c++14 -Wall -I/usr/share/verilator/include

# Verilator settings
VERILATOR = verilator
VFLAGS = --cc --exe --build --trace -Wall

# Verilator include files
VROOT = /usr/share/verilator/include
VINC = $(VROOT)/verilated.cpp $(VROOT)/verilated_vcd_c.cpp

# Directories
RTL_DIR = rtl
TB_DIR = tb
SIM_DIR = sim
SYN_DIR = syn

# Create directories if they don't exist
$(shell mkdir -p $(SIM_DIR) $(SYN_DIR))

#=============================================================================
# Lab 1.1: 4-bit Adder
#=============================================================================

adder_4bit: $(SIM_DIR)/adder_4bit.vcd
        @echo "✓ 4-bit Adder simulation complete"
        @echo "  View waveforms: gtkwave $(SIM_DIR)/adder_4bit.vcd"

$(SIM_DIR)/adder_4bit.vcd: $(RTL_DIR)/full_adder.sv $(RTL_DIR)/adder_4bit.sv $(TB_DIR)/tb_adder_4bit.cpp
        @echo "Building 4-bit adder..."
        $(VERILATOR) $(VFLAGS) \
                $(RTL_DIR)/full_adder.sv \
                $(RTL_DIR)/adder_4bit.sv \
                $(TB_DIR)/tb_adder_4bit.cpp
        @echo "Running simulation..."
        ./obj_dir/Vadder_4bit

#=============================================================================
# Clean target
#=============================================================================

clean:
        rm -rf obj_dir
        rm -f $(SIM_DIR)/*.vcd
        rm -f $(SYN_DIR)/*

.PHONY: clean adder_4bit
