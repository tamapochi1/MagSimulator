################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables
C_SRCS += \
../src/MagSimulator.c \
../src/r_usb_pcdc_descriptor.c 

COMPILER_OBJS += \
src/MagSimulator.obj \
src/r_usb_pcdc_descriptor.obj 

C_DEPS += \
src/MagSimulator.d \
src/r_usb_pcdc_descriptor.d 

# Each subdirectory must supply rules for building sources it contributes
src/%.obj: ../src/%.c src/Compiler.sub
	@echo 'Scanning and building file: $<'
	@echo 'Invoking: Scanner and Compiler'
	ccrx -MM -MP -output=dep="$(@:%.obj=%.d)"  -MT="$(@:%.d=%.obj)"  -MT="$(@:%.obj=%.d)" -isa=rxv2 -fpu -include="C:\Program Files (x86)\Renesas\RX\2_7_0\include","F:\Git\MagSimulator\MagSimulator\r_bsp","F:\Git\MagSimulator\MagSimulator\src","F:\Git\MagSimulator\MagSimulator\r_usb_basic","F:\Git\MagSimulator\MagSimulator\r_usb_basic\src\driver\inc","F:\Git\MagSimulator\MagSimulator\r_usb_basic\src\hw\inc","F:\Git\MagSimulator\MagSimulator\r_config","F:\Git\MagSimulator\MagSimulator\r_usb_pcdc","F:\Git\MagSimulator\MagSimulator\r_usb_pcdc\src\inc" -lang=c99 -nomessage -debug -nologo  "$<"
	ccrx -isa=rxv2 -fpu -include="C:\Program Files (x86)\Renesas\RX\2_7_0\include","F:\Git\MagSimulator\MagSimulator\r_bsp","F:\Git\MagSimulator\MagSimulator\src","F:\Git\MagSimulator\MagSimulator\r_usb_basic","F:\Git\MagSimulator\MagSimulator\r_usb_basic\src\driver\inc","F:\Git\MagSimulator\MagSimulator\r_usb_basic\src\hw\inc","F:\Git\MagSimulator\MagSimulator\r_config","F:\Git\MagSimulator\MagSimulator\r_usb_pcdc","F:\Git\MagSimulator\MagSimulator\r_usb_pcdc\src\inc" -lang=c99 -nomessage -output=obj -obj_path="src" -debug -nologo "$<"
	@echo 'Finished Scanning and building: $<'
	@echo.

