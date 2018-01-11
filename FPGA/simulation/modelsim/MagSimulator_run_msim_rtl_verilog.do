transcript on
if ![file isdirectory MagSimulator_iputf_libs] {
	file mkdir MagSimulator_iputf_libs
}

if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

###### Libraries for IPUTF cores 
vlib MagSimulator_iputf_libs/nios_custom_instr_floating_point_2_multi_0
vmap nios_custom_instr_floating_point_2_multi_0 ./MagSimulator_iputf_libs/nios_custom_instr_floating_point_2_multi_0
###### End libraries for IPUTF cores 
###### MIF file copy and HDL compilation commands for IPUTF cores 

file copy -force F:/Git/MagSimulator/FPGA/FPH/simulation/submodules/FPSqrt/FPSqrt_memoryC0_uid59_sqrtTableGenerator_lutmem.hex ./
file copy -force F:/Git/MagSimulator/FPGA/FPH/simulation/submodules/FPSqrt/FPSqrt_memoryC1_uid60_sqrtTableGenerator_lutmem.hex ./
file copy -force F:/Git/MagSimulator/FPGA/FPH/simulation/submodules/FPSqrt/FPSqrt_memoryC2_uid61_sqrtTableGenerator_lutmem.hex ./
file copy -force F:/Git/MagSimulator/FPGA/DIV_sim/DIV_memoryC0_uid146_invTables_lutmem.hex ./
file copy -force F:/Git/MagSimulator/FPGA/DIV_sim/DIV_memoryC0_uid147_invTables_lutmem.hex ./
file copy -force F:/Git/MagSimulator/FPGA/DIV_sim/DIV_memoryC0_uid148_invTables_lutmem.hex ./
file copy -force F:/Git/MagSimulator/FPGA/DIV_sim/DIV_memoryC0_uid149_invTables_lutmem.hex ./
file copy -force F:/Git/MagSimulator/FPGA/DIV_sim/DIV_memoryC0_uid150_invTables_lutmem.hex ./
file copy -force F:/Git/MagSimulator/FPGA/DIV_sim/DIV_memoryC0_uid151_invTables_lutmem.hex ./
file copy -force F:/Git/MagSimulator/FPGA/DIV_sim/DIV_memoryC0_uid152_invTables_lutmem.hex ./
file copy -force F:/Git/MagSimulator/FPGA/DIV_sim/DIV_memoryC0_uid153_invTables_lutmem.hex ./
file copy -force F:/Git/MagSimulator/FPGA/DIV_sim/DIV_memoryC0_uid154_invTables_lutmem.hex ./
file copy -force F:/Git/MagSimulator/FPGA/DIV_sim/DIV_memoryC0_uid155_invTables_lutmem.hex ./
file copy -force F:/Git/MagSimulator/FPGA/DIV_sim/DIV_memoryC0_uid156_invTables_lutmem.hex ./
file copy -force F:/Git/MagSimulator/FPGA/DIV_sim/DIV_memoryC0_uid157_invTables_lutmem.hex ./
file copy -force F:/Git/MagSimulator/FPGA/DIV_sim/DIV_memoryC0_uid158_invTables_lutmem.hex ./
file copy -force F:/Git/MagSimulator/FPGA/DIV_sim/DIV_memoryC0_uid159_invTables_lutmem.hex ./
file copy -force F:/Git/MagSimulator/FPGA/DIV_sim/DIV_memoryC0_uid160_invTables_lutmem.hex ./
file copy -force F:/Git/MagSimulator/FPGA/DIV_sim/DIV_memoryC1_uid164_invTables_lutmem.hex ./
file copy -force F:/Git/MagSimulator/FPGA/DIV_sim/DIV_memoryC1_uid165_invTables_lutmem.hex ./
file copy -force F:/Git/MagSimulator/FPGA/DIV_sim/DIV_memoryC1_uid166_invTables_lutmem.hex ./
file copy -force F:/Git/MagSimulator/FPGA/DIV_sim/DIV_memoryC1_uid167_invTables_lutmem.hex ./
file copy -force F:/Git/MagSimulator/FPGA/DIV_sim/DIV_memoryC1_uid168_invTables_lutmem.hex ./
file copy -force F:/Git/MagSimulator/FPGA/DIV_sim/DIV_memoryC1_uid169_invTables_lutmem.hex ./
file copy -force F:/Git/MagSimulator/FPGA/DIV_sim/DIV_memoryC1_uid170_invTables_lutmem.hex ./
file copy -force F:/Git/MagSimulator/FPGA/DIV_sim/DIV_memoryC1_uid171_invTables_lutmem.hex ./
file copy -force F:/Git/MagSimulator/FPGA/DIV_sim/DIV_memoryC1_uid172_invTables_lutmem.hex ./
file copy -force F:/Git/MagSimulator/FPGA/DIV_sim/DIV_memoryC1_uid173_invTables_lutmem.hex ./
file copy -force F:/Git/MagSimulator/FPGA/DIV_sim/DIV_memoryC1_uid174_invTables_lutmem.hex ./
file copy -force F:/Git/MagSimulator/FPGA/DIV_sim/DIV_memoryC1_uid175_invTables_lutmem.hex ./
file copy -force F:/Git/MagSimulator/FPGA/DIV_sim/DIV_memoryC2_uid179_invTables_lutmem.hex ./
file copy -force F:/Git/MagSimulator/FPGA/DIV_sim/DIV_memoryC2_uid180_invTables_lutmem.hex ./
file copy -force F:/Git/MagSimulator/FPGA/DIV_sim/DIV_memoryC2_uid181_invTables_lutmem.hex ./
file copy -force F:/Git/MagSimulator/FPGA/DIV_sim/DIV_memoryC2_uid182_invTables_lutmem.hex ./
file copy -force F:/Git/MagSimulator/FPGA/DIV_sim/DIV_memoryC2_uid183_invTables_lutmem.hex ./
file copy -force F:/Git/MagSimulator/FPGA/DIV_sim/DIV_memoryC2_uid184_invTables_lutmem.hex ./
file copy -force F:/Git/MagSimulator/FPGA/DIV_sim/DIV_memoryC2_uid185_invTables_lutmem.hex ./
file copy -force F:/Git/MagSimulator/FPGA/DIV_sim/DIV_memoryC2_uid186_invTables_lutmem.hex ./
file copy -force F:/Git/MagSimulator/FPGA/DIV_sim/DIV_memoryC2_uid187_invTables_lutmem.hex ./
file copy -force F:/Git/MagSimulator/FPGA/DIV_sim/DIV_memoryC2_uid188_invTables_lutmem.hex ./
file copy -force F:/Git/MagSimulator/FPGA/DIV_sim/DIV_memoryC3_uid191_invTables_lutmem.hex ./
file copy -force F:/Git/MagSimulator/FPGA/DIV_sim/DIV_memoryC3_uid192_invTables_lutmem.hex ./
file copy -force F:/Git/MagSimulator/FPGA/DIV_sim/DIV_memoryC3_uid193_invTables_lutmem.hex ./
file copy -force F:/Git/MagSimulator/FPGA/DIV_sim/DIV_memoryC3_uid194_invTables_lutmem.hex ./
file copy -force F:/Git/MagSimulator/FPGA/DIV_sim/DIV_memoryC3_uid195_invTables_lutmem.hex ./
file copy -force F:/Git/MagSimulator/FPGA/DIV_sim/DIV_memoryC3_uid196_invTables_lutmem.hex ./
file copy -force F:/Git/MagSimulator/FPGA/DIV_sim/DIV_memoryC3_uid197_invTables_lutmem.hex ./
file copy -force F:/Git/MagSimulator/FPGA/DIV_sim/DIV_memoryC4_uid200_invTables_lutmem.hex ./
file copy -force F:/Git/MagSimulator/FPGA/DIV_sim/DIV_memoryC4_uid201_invTables_lutmem.hex ./
file copy -force F:/Git/MagSimulator/FPGA/DIV_sim/DIV_memoryC4_uid202_invTables_lutmem.hex ./
file copy -force F:/Git/MagSimulator/FPGA/DIV_sim/DIV_memoryC4_uid203_invTables_lutmem.hex ./

vcom "F:/Git/MagSimulator/FPGA/FPH/simulation/submodules/fpoint2_multi.vhd"                       -work nios_custom_instr_floating_point_2_multi_0
vcom "F:/Git/MagSimulator/FPGA/FPH/simulation/submodules/fpoint2_multi_datapath.vhd"              -work nios_custom_instr_floating_point_2_multi_0
vcom "F:/Git/MagSimulator/FPGA/FPH/simulation/submodules/fpoint2_multi_dspba_library_package.vhd" -work nios_custom_instr_floating_point_2_multi_0
vcom "F:/Git/MagSimulator/FPGA/FPH/simulation/submodules/fpoint2_multi_dspba_library.vhd"         -work nios_custom_instr_floating_point_2_multi_0
vcom "F:/Git/MagSimulator/FPGA/FPH/simulation/submodules/FPAddSub/FPAddSub.vhd"                   -work nios_custom_instr_floating_point_2_multi_0
vcom "F:/Git/MagSimulator/FPGA/FPH/simulation/submodules/FPDiv/FPDiv.vhd"                         -work nios_custom_instr_floating_point_2_multi_0
vcom "F:/Git/MagSimulator/FPGA/FPH/simulation/submodules/FPMult/FPMult.vhd"                       -work nios_custom_instr_floating_point_2_multi_0
vcom "F:/Git/MagSimulator/FPGA/FPH/simulation/submodules/IntToFloat/IntToFloat.vhd"               -work nios_custom_instr_floating_point_2_multi_0
vcom "F:/Git/MagSimulator/FPGA/FPH/simulation/submodules/FloatToInt/FloatToInt.vhd"               -work nios_custom_instr_floating_point_2_multi_0
vcom "F:/Git/MagSimulator/FPGA/FPH/simulation/submodules/FPSqrt/FPSqrt_safe_path.vhd"             -work nios_custom_instr_floating_point_2_multi_0
vcom "F:/Git/MagSimulator/FPGA/FPH/simulation/submodules/FPSqrt/FPSqrt.vhd"                       -work nios_custom_instr_floating_point_2_multi_0
vlog "F:/Git/MagSimulator/FPGA/FPH/simulation/FPH.v"                                                                                              
vlog "F:/Git/MagSimulator/FPGA/MULT_sim/MULT.vo"                                                                                                  
vlog "F:/Git/MagSimulator/FPGA/ADD_sim/ADD.vo"                                                                                                    
vlog "F:/Git/MagSimulator/FPGA/DIV_sim/DIV.vo"                                                                                                    

vlog -vlog01compat -work work +incdir+F:/Git/MagSimulator/FPGA {F:/Git/MagSimulator/FPGA/MagSimulator.v}
vlog -vlog01compat -work work +incdir+F:/Git/MagSimulator/FPGA {F:/Git/MagSimulator/FPGA/PLL.v}
vlog -vlog01compat -work work +incdir+F:/Git/MagSimulator/FPGA/db {F:/Git/MagSimulator/FPGA/db/pll_altpll.v}

vlog -vlog01compat -work work +incdir+F:/Git/MagSimulator/FPGA/simulation/modelsim {F:/Git/MagSimulator/FPGA/simulation/modelsim/tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm -L fiftyfivenm_ver -L rtl_work -L work -L nios_custom_instr_floating_point_2_multi_0 -voptargs="+acc"  tb

log -r *
add wave *
view structure
view signals
run -all
