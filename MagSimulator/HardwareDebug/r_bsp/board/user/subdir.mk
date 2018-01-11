################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables
C_SRCS += \
../r_bsp/board/user/dbsct.c \
../r_bsp/board/user/hwsetup.c \
../r_bsp/board/user/lowlvl.c \
../r_bsp/board/user/lowsrc.c \
../r_bsp/board/user/resetprg.c \
../r_bsp/board/user/sbrk.c \
../r_bsp/board/user/vecttbl.c 

COMPILER_OBJS += \
r_bsp/board/user/dbsct.obj \
r_bsp/board/user/hwsetup.obj \
r_bsp/board/user/lowlvl.obj \
r_bsp/board/user/lowsrc.obj \
r_bsp/board/user/resetprg.obj \
r_bsp/board/user/sbrk.obj \
r_bsp/board/user/vecttbl.obj 

C_DEPS += \
r_bsp/board/user/dbsct.d \
r_bsp/board/user/hwsetup.d \
r_bsp/board/user/lowlvl.d \
r_bsp/board/user/lowsrc.d \
r_bsp/board/user/resetprg.d \
r_bsp/board/user/sbrk.d \
r_bsp/board/user/vecttbl.d 

# Each subdirectory must supply rules for building sources it contributes
r_bsp/board/user/%.obj: ../r_bsp/board/user/%.c 
	@echo 'Scanning and building file: $<'
	@echo 'Invoking: Scanner and Compiler'
	ccrx -MM -MP -output=dep="$(@:%.obj=%.d)"  -MT="$(@:%.d=%.obj)"  -MT="$(@:%.obj=%.d)" -isa=rxv2 -fpu -include="C:\Program Files (x86)\Renesas\RX\2_7_0\include","F:\Git\MagSimulator\MagSimulator\r_bsp","F:\Git\MagSimulator\MagSimulator\src","F:\Git\MagSimulator\MagSimulator\r_usb_basic","F:\Git\MagSimulator\MagSimulator\r_usb_basic\src\driver\inc","F:\Git\MagSimulator\MagSimulator\r_usb_basic\src\hw\inc","F:\Git\MagSimulator\MagSimulator\r_config","F:\Git\MagSimulator\MagSimulator\r_usb_pcdc","F:\Git\MagSimulator\MagSimulator\r_usb_pcdc\src\inc" -lang=c99 -nomessage -debug -nologo  "$<"
	ccrx -isa=rxv2 -fpu -include="C:\Program Files (x86)\Renesas\RX\2_7_0\include","F:\Git\MagSimulator\MagSimulator\r_bsp","F:\Git\MagSimulator\MagSimulator\src","F:\Git\MagSimulator\MagSimulator\r_usb_basic","F:\Git\MagSimulator\MagSimulator\r_usb_basic\src\driver\inc","F:\Git\MagSimulator\MagSimulator\r_usb_basic\src\hw\inc","F:\Git\MagSimulator\MagSimulator\r_config","F:\Git\MagSimulator\MagSimulator\r_usb_pcdc","F:\Git\MagSimulator\MagSimulator\r_usb_pcdc\src\inc" -lang=c99 -nomessage -output=obj -obj_path="r_bsp/board/user" -debug -nologo "$<"
	@echo 'Finished Scanning and building: $<'
	@echo.

r_bsp/board/user/%.obj: ../r_bsp/board/user/%.c r_bsp/board/user/Compiler.sub
	@echo 'Scanning and building file: $<'
	@echo 'Invoking: Scanner and Compiler'
	ccrx -MM -MP -output=dep="$(@:%.obj=%.d)"  -MT="$(@:%.d=%.obj)"  -MT="$(@:%.obj=%.d)" -isa=rxv2 -fpu -include="C:\Program Files (x86)\Renesas\RX\2_7_0\include","F:\Git\MagSimulator\MagSimulator\r_bsp","F:\Git\MagSimulator\MagSimulator\src","F:\Git\MagSimulator\MagSimulator\r_usb_basic","F:\Git\MagSimulator\MagSimulator\r_usb_basic\src\driver\inc","F:\Git\MagSimulator\MagSimulator\r_usb_basic\src\hw\inc","F:\Git\MagSimulator\MagSimulator\r_config","F:\Git\MagSimulator\MagSimulator\r_usb_pcdc","F:\Git\MagSimulator\MagSimulator\r_usb_pcdc\src\inc" -lang=c99 -nomessage -debug -nologo  "$<"
	ccrx -isa=rxv2 -fpu -include="C:\Program Files (x86)\Renesas\RX\2_7_0\include","F:\Git\MagSimulator\MagSimulator\r_bsp","F:\Git\MagSimulator\MagSimulator\src","F:\Git\MagSimulator\MagSimulator\r_usb_basic","F:\Git\MagSimulator\MagSimulator\r_usb_basic\src\driver\inc","F:\Git\MagSimulator\MagSimulator\r_usb_basic\src\hw\inc","F:\Git\MagSimulator\MagSimulator\r_config","F:\Git\MagSimulator\MagSimulator\r_usb_pcdc","F:\Git\MagSimulator\MagSimulator\r_usb_pcdc\src\inc" -lang=c99 -nomessage -output=obj -obj_path="r_bsp/board/user" -debug -nologo "$<"
	@echo 'Finished Scanning and building: $<'
	@echo.

