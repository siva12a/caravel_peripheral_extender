<!---
# SPDX-FileCopyrightText: 2020 Efabless Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# SPDX-License-Identifier: Apache-2.0
-->

# Simulation Environment Setup

There are two options for setting up the simulation environment: 

* Pulling a pre-built docker image 
* Installing the dependecies locally

## 1. Docker

There is an available docker setup with the needed tools at [efabless/dockerized-verification-setup](https://github.com/efabless/dockerized-verification-setup) 

Run the following to pull the image: 

```
docker pull efabless/dv_setup:latest
```

## 2. Local Installion (Linux)

You will need to fullfil these dependecies: 

* Icarus Verilog (10.2+)
* RV32I Toolchain

Using apt, you can install Icarus Verilog:

```bash
sudo apt-get install iverilog
```

Next, you will need to build the RV32I toolchain. Firstly, export the installation path for the RV32I toolchain, 

```bash
export GCC_PATH=<gcc-installation-path>
```

Then, run the following: 

```bash
# packages needed:
sudo apt-get install autoconf automake autotools-dev curl libmpc-dev \
    libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo \
    gperf libtool patchutils bc zlib1g-dev git libexpat1-dev

sudo mkdir $GCC_PATH
sudo chown $USER $GCC_PATH

git clone https://github.com/riscv/riscv-gnu-toolchain riscv-gnu-toolchain-rv32i
cd riscv-gnu-toolchain-rv32i
git checkout 411d134
git submodule update --init --recursive

mkdir build; cd build
../configure --with-arch=rv32i --prefix=$GCC_PATH
make -j$(nproc)
```

# Running Simulation

## Docker

First, you will need to export a number of environment variables: 

```bash
export PDK_PATH=<pdk-location/sky130A>
export CARAVEL_ROOT=<caravel_root>
export UPRJ_ROOT=<user_project_root>
```

Then, run the following command to start the docker container :

```
docker run -it -v $CARAVEL_ROOT:$CARAVEL_ROOT -v $PDK_PATH:$PDK_PATH -v $UPRJ_ROOT:$UPRJ_ROOT -e CARAVEL_ROOT=$CARAVEL_ROOT -e PDK_PATH=$PDK_PATH -e UPRJ_ROOT=$UPRJ_ROOT -u $(id -u $USER):$(id -g $USER) efabless/dv_setup:latest
```

Then, navigate to the directory where the DV tests reside : 

```bash
cd $UPRJ_ROOT/verilog/dv/
```

Then, follow the instructions at [Both](#both) to run RTL/GL simulation.

## Local

You will need to export these environment variables: 

```bash
export GCC_PATH=<gcc-installation-path>
export PDK_PATH=<pdk-location/sky130A>
```

Then, follow the instruction at [Both](#both) to run RTL/GL simulation.

## Both

To run RTL simulation for one of the DV tests, 

```bash
cd <dv-test>
make
```

To run gate level simulation for one of the DV tests, 

```bash
cd <dv-test>
SIM=GL make
```

# User Project Example DV

The directory includes two tests for the user-project example: 

### Output test

* This test is meant to verify that we can configure the pads as output for the user project area. The firmware configures the 0 to 28 IO pads in the user space as outputs:

	```c
	reg_mprj_io_0 =  GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_14 =  GPIO_MODE_USER_STD_OUTPUT;
	.....
	reg_mprj_io_23 =  GPIO_MODE_USER_STD_OUTPUT;
	```

* Then, the firmware applies the pad configuration by enabling the serial transfer on the shift register responsible for configuring the pads and waits until the transfer is done. The firmware then writes to the gpio a value of 0xaabbcc. Since the gpio is at user address space at 3000_0000 address the firmware writes the value 0xaabbcc to that address.
	```c
	reg_mprj_xfer = 1;
	while (reg_mprj_xfer == 1);
	int *gpio = (char*) 0x30000000;
        *gpio = 0xffabcdef;
	```

* The testbench success criteria is that we can observe the gpio value on the 0 to 23 I/O pads. This criteria is checked by the testbench through observing the values on the I/O pads as follows: 

	```verilog
	wait(mprj_io_0[23:0] == 24'habcdef);
	
	```

* If the testbench fails, it will print a timeout message to the terminal. 
### Input test

* This test is meant to verify that we can configure the pads as input for the user project area. The firmware configures the 29 to 32 IO pads in the user space as inputs:

	```c
	reg_mprj_io_29 =  GPIO_MODE_USER_STD_INPUT;
	reg_mprj_io_30 =  GPIO_MODE_USER_STD_INPUT;
	.....
	reg_mprj_io_32 =  GPIO_MODE_USER_STD_INPUT;
	```

* Then, the firmware applies the pad configuration by enabling the serial transfer on the shift register responsible for configuring the pads and waits until the transfer is done. The firmware then writes to the gpio a value of 16'hffaa. Since the gpio input is at user address space at 0x3000_0004 address. The code reads from the input and writes it to the output pins. By this way wishbone interface is also verified.
	```c
	reg_mprj_xfer = 1;
	while (reg_mprj_xfer == 1);
	int *gpo_addr = (char*) 0x30000000;
        int *gpi_addr = (char*) 0x30000004;
        *gpo_addr = *gpi_addr;
	```

* The testbench success criteria is that we can observe value on the 13 to 28 I/O pads. This criteria is checked by the testbench through observing the values on the I/O pads as follows: 

	```verilog
	
	wait(mprj_io_0 == 16'000a);
	
	```

* If the testbench fails, it will print a timeout message to the terminal. 
* Please see the expect result file for the expected result.
