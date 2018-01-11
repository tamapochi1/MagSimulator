set_global_assignment -entity "FPH" -library "lib_FPH" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "FPH" -library "lib_FPH" -name IP_TOOL_VERSION "17.0"
set_global_assignment -entity "FPH" -library "lib_FPH" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_FPH" -name SPD_FILE [file join $::quartus(sip_path) "../FPH.spd"]
set_global_assignment -library "lib_FPH" -name MISC_FILE [file join $::quartus(sip_path) "../../FPH.qsys"]

set_global_assignment -library "lib_FPH" -name MISC_FILE [file join $::quartus(sip_path) "FPH.v"]
set_global_assignment -library "lib_FPH" -name MISC_FILE [file join $::quartus(sip_path) "submodules/fpoint2_multi.vhd"]
set_global_assignment -library "lib_FPH" -name MISC_FILE [file join $::quartus(sip_path) "submodules/fpoint2_multi_datapath.vhd"]
set_global_assignment -library "lib_FPH" -name MISC_FILE [file join $::quartus(sip_path) "submodules/fpoint2_multi_dspba_library_package.vhd"]
set_global_assignment -library "lib_FPH" -name MISC_FILE [file join $::quartus(sip_path) "submodules/fpoint2_multi_dspba_library.vhd"]
set_global_assignment -library "lib_FPH" -name MISC_FILE [file join $::quartus(sip_path) "submodules/FPAddSub/FPAddSub.vhd"]
set_global_assignment -library "lib_FPH" -name MISC_FILE [file join $::quartus(sip_path) "submodules/FPDiv/FPDiv.vhd"]
set_global_assignment -library "lib_FPH" -name MISC_FILE [file join $::quartus(sip_path) "submodules/FPMult/FPMult.vhd"]
set_global_assignment -library "lib_FPH" -name MISC_FILE [file join $::quartus(sip_path) "submodules/IntToFloat/IntToFloat.vhd"]
set_global_assignment -library "lib_FPH" -name MISC_FILE [file join $::quartus(sip_path) "submodules/FloatToInt/FloatToInt.vhd"]
set_global_assignment -library "lib_FPH" -name MISC_FILE [file join $::quartus(sip_path) "submodules/FPSqrt/FPSqrt_safe_path.vhd"]
set_global_assignment -library "lib_FPH" -name MISC_FILE [file join $::quartus(sip_path) "submodules/FPSqrt/FPSqrt.vhd"]
set_global_assignment -library "lib_FPH" -name MISC_FILE [file join $::quartus(sip_path) "submodules/FPSqrt/FPSqrt_memoryC0_uid59_sqrtTableGenerator_lutmem.hex"]
set_global_assignment -library "lib_FPH" -name MISC_FILE [file join $::quartus(sip_path) "submodules/FPSqrt/FPSqrt_memoryC1_uid60_sqrtTableGenerator_lutmem.hex"]
set_global_assignment -library "lib_FPH" -name MISC_FILE [file join $::quartus(sip_path) "submodules/FPSqrt/FPSqrt_memoryC2_uid61_sqrtTableGenerator_lutmem.hex"]
