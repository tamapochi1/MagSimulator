-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 17.0 (Release Build #595)
-- Quartus Prime development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2017 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from ADD_0002
-- VHDL created on Wed Dec 27 18:50:54 2017


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity ADD_0002 is
    port (
        a : in std_logic_vector(31 downto 0);  -- float32_m23
        b : in std_logic_vector(31 downto 0);  -- float32_m23
        q : out std_logic_vector(31 downto 0);  -- float32_m23
        clk : in std_logic;
        areset : in std_logic
    );
end ADD_0002;

architecture normal of ADD_0002 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracX_uid6_fpAddTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal expFracY_uid7_fpAddTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal xGTEy_uid8_fpAddTest_a : STD_LOGIC_VECTOR (32 downto 0);
    signal xGTEy_uid8_fpAddTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal xGTEy_uid8_fpAddTest_o : STD_LOGIC_VECTOR (32 downto 0);
    signal xGTEy_uid8_fpAddTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal sigY_uid9_fpAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracY_uid10_fpAddTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expY_uid11_fpAddTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal ypn_uid12_fpAddTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal aSig_uid16_fpAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aSig_uid16_fpAddTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bSig_uid17_fpAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal bSig_uid17_fpAddTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal cstAllOWE_uid18_fpAddTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstZeroWF_uid19_fpAddTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal cstAllZWE_uid20_fpAddTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal exp_aSig_uid21_fpAddTest_in : STD_LOGIC_VECTOR (30 downto 0);
    signal exp_aSig_uid21_fpAddTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_aSig_uid22_fpAddTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal frac_aSig_uid22_fpAddTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excZ_aSig_uid16_uid23_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid24_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid25_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid25_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid26_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_aSig_uid27_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_aSig_uid28_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_aSig_uid28_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid29_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid30_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_aSig_uid31_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exp_bSig_uid35_fpAddTest_in : STD_LOGIC_VECTOR (30 downto 0);
    signal exp_bSig_uid35_fpAddTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_bSig_uid36_fpAddTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal frac_bSig_uid36_fpAddTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excZ_bSig_uid17_uid37_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid38_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid38_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid39_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid39_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid40_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_bSig_uid41_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_bSig_uid42_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_bSig_uid42_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid43_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid44_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_bSig_uid45_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigA_uid50_fpAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal sigB_uid51_fpAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal effSub_uid52_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracBz_uid56_fpAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracBz_uid56_fpAddTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal oFracB_uid59_fpAddTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal expAmExpB_uid60_fpAddTest_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expAmExpB_uid60_fpAddTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expAmExpB_uid60_fpAddTest_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expAmExpB_uid60_fpAddTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal cWFP2_uid61_fpAddTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal shiftedOut_uid63_fpAddTest_a : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftedOut_uid63_fpAddTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftedOut_uid63_fpAddTest_o : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftedOut_uid63_fpAddTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal padConst_uid64_fpAddTest_q : STD_LOGIC_VECTOR (24 downto 0);
    signal rightPaddedIn_uid65_fpAddTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal iShiftedOut_uid67_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal alignFracBPostShiftOut_uid68_fpAddTest_b : STD_LOGIC_VECTOR (48 downto 0);
    signal alignFracBPostShiftOut_uid68_fpAddTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal cmpEQ_stickyBits_cZwF_uid71_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invCmpEQ_stickyBits_cZwF_uid72_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal invCmpEQ_stickyBits_cZwF_uid72_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal effSubInvSticky_uid74_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal effSubInvSticky_uid74_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal zocst_uid76_fpAddTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal fracAAddOp_uid77_fpAddTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal fracBAddOp_uid80_fpAddTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal fracBAddOpPostXor_uid81_fpAddTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal fracBAddOpPostXor_uid81_fpAddTest_qi : STD_LOGIC_VECTOR (26 downto 0);
    signal fracBAddOpPostXor_uid81_fpAddTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal fracAddResult_uid82_fpAddTest_a : STD_LOGIC_VECTOR (27 downto 0);
    signal fracAddResult_uid82_fpAddTest_b : STD_LOGIC_VECTOR (27 downto 0);
    signal fracAddResult_uid82_fpAddTest_o : STD_LOGIC_VECTOR (27 downto 0);
    signal fracAddResult_uid82_fpAddTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal rangeFracAddResultMwfp3Dto0_uid83_fpAddTest_in : STD_LOGIC_VECTOR (26 downto 0);
    signal rangeFracAddResultMwfp3Dto0_uid83_fpAddTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal fracGRS_uid84_fpAddTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal cAmA_uid86_fpAddTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal aMinusA_uid87_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracPostNorm_uid89_fpAddTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal oneCST_uid90_fpAddTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal expInc_uid91_fpAddTest_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expInc_uid91_fpAddTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expInc_uid91_fpAddTest_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expInc_uid91_fpAddTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expPostNorm_uid92_fpAddTest_a : STD_LOGIC_VECTOR (9 downto 0);
    signal expPostNorm_uid92_fpAddTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal expPostNorm_uid92_fpAddTest_o : STD_LOGIC_VECTOR (9 downto 0);
    signal expPostNorm_uid92_fpAddTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal Sticky0_uid93_fpAddTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal Sticky0_uid93_fpAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal Sticky1_uid94_fpAddTest_in : STD_LOGIC_VECTOR (1 downto 0);
    signal Sticky1_uid94_fpAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal Round_uid95_fpAddTest_in : STD_LOGIC_VECTOR (2 downto 0);
    signal Round_uid95_fpAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal Guard_uid96_fpAddTest_in : STD_LOGIC_VECTOR (3 downto 0);
    signal Guard_uid96_fpAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal LSB_uid97_fpAddTest_in : STD_LOGIC_VECTOR (4 downto 0);
    signal LSB_uid97_fpAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rndBitCond_uid98_fpAddTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal cRBit_uid99_fpAddTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal rBi_uid100_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal rBi_uid100_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal roundBit_uid101_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracPostNormRndRange_uid102_fpAddTest_in : STD_LOGIC_VECTOR (25 downto 0);
    signal fracPostNormRndRange_uid102_fpAddTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal expFracR_uid103_fpAddTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal rndExpFrac_uid104_fpAddTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal rndExpFrac_uid104_fpAddTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal rndExpFrac_uid104_fpAddTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal rndExpFrac_uid104_fpAddTest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal wEP2AllOwE_uid105_fpAddTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal rndExp_uid106_fpAddTest_in : STD_LOGIC_VECTOR (33 downto 0);
    signal rndExp_uid106_fpAddTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal rOvfEQMax_uid107_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rndExpFracOvfBits_uid109_fpAddTest_in : STD_LOGIC_VECTOR (33 downto 0);
    signal rndExpFracOvfBits_uid109_fpAddTest_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rOvfExtraBits_uid110_fpAddTest_a : STD_LOGIC_VECTOR (3 downto 0);
    signal rOvfExtraBits_uid110_fpAddTest_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rOvfExtraBits_uid110_fpAddTest_o : STD_LOGIC_VECTOR (3 downto 0);
    signal rOvfExtraBits_uid110_fpAddTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal rOvf_uid111_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal wEP2AllZ_uid112_fpAddTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal rUdfEQMin_uid114_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rUdfExtraBit_uid115_fpAddTest_in : STD_LOGIC_VECTOR (33 downto 0);
    signal rUdfExtraBit_uid115_fpAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rUdf_uid116_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPreExc_uid117_fpAddTest_in : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPreExc_uid117_fpAddTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPreExc_uid118_fpAddTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal expRPreExc_uid118_fpAddTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal regInputs_uid119_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal regInputs_uid119_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZeroVInC_uid120_fpAddTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal excRZero_uid121_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rInfOvf_uid122_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal rInfOvf_uid122_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInfVInC_uid123_fpAddTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal excRInf_uid124_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN2_uid125_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excAIBISub_uid126_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid127_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal concExc_uid128_fpAddTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal excREnc_uid129_fpAddTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal invAMinusA_uid130_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRReg_uid131_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigBBInf_uid132_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigAAInf_uid133_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRInf_uid134_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excAZBZSigASigB_uid135_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excBZARSigA_uid136_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRZero_uid137_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRInfRZRReg_uid138_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signRInfRZRReg_uid138_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcRNaN_uid139_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExc_uid140_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oneFracRPostExc2_uid141_fpAddTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal fracRPostExc_uid144_fpAddTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid144_fpAddTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPostExc_uid148_fpAddTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid148_fpAddTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal R_uid149_fpAddTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal zs_uid151_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal rVStage_uid152_lzCountVal_uid85_fpAddTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid153_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal mO_uid154_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal vStage_uid155_lzCountVal_uid85_fpAddTest_in : STD_LOGIC_VECTOR (11 downto 0);
    signal vStage_uid155_lzCountVal_uid85_fpAddTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal cStage_uid156_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vStagei_uid158_lzCountVal_uid85_fpAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid158_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid161_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid164_lzCountVal_uid85_fpAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid164_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal zs_uid165_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal vCount_uid167_lzCountVal_uid85_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid167_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid170_lzCountVal_uid85_fpAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid170_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal zs_uid171_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal vCount_uid173_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid176_lzCountVal_uid85_fpAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid176_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid178_lzCountVal_uid85_fpAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid179_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid180_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal wIntCst_uid184_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftedOut_uid185_alignmentShifter_uid64_fpAddTest_a : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftedOut_uid185_alignmentShifter_uid64_fpAddTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftedOut_uid185_alignmentShifter_uid64_fpAddTest_o : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftedOut_uid185_alignmentShifter_uid64_fpAddTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0Idx1Rng8_uid186_alignmentShifter_uid64_fpAddTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal rightShiftStage0Idx1_uid188_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0Idx2Rng16_uid189_alignmentShifter_uid64_fpAddTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal rightShiftStage0Idx2_uid191_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0Idx3Rng24_uid192_alignmentShifter_uid64_fpAddTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal rightShiftStage0Idx3Pad24_uid193_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal rightShiftStage0Idx3_uid194_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0Idx4Rng32_uid195_alignmentShifter_uid64_fpAddTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal rightShiftStage0Idx4Pad32_uid196_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage0Idx4_uid197_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0Idx5Rng40_uid198_alignmentShifter_uid64_fpAddTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal rightShiftStage0Idx5Pad40_uid199_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal rightShiftStage0Idx5_uid200_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0Idx6Rng48_uid201_alignmentShifter_uid64_fpAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0Idx6Pad48_uid202_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (47 downto 0);
    signal rightShiftStage0Idx6_uid203_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0Idx7_uid204_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1Idx1Rng1_uid207_alignmentShifter_uid64_fpAddTest_b : STD_LOGIC_VECTOR (47 downto 0);
    signal rightShiftStage1Idx1_uid209_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1Idx2Rng2_uid210_alignmentShifter_uid64_fpAddTest_b : STD_LOGIC_VECTOR (46 downto 0);
    signal rightShiftStage1Idx2_uid212_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1Idx3Rng3_uid213_alignmentShifter_uid64_fpAddTest_b : STD_LOGIC_VECTOR (45 downto 0);
    signal rightShiftStage1Idx3Pad3_uid214_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStage1Idx3_uid215_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1Idx4Rng4_uid216_alignmentShifter_uid64_fpAddTest_b : STD_LOGIC_VECTOR (44 downto 0);
    signal rightShiftStage1Idx4_uid218_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1Idx5Rng5_uid219_alignmentShifter_uid64_fpAddTest_b : STD_LOGIC_VECTOR (43 downto 0);
    signal rightShiftStage1Idx5Pad5_uid220_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal rightShiftStage1Idx5_uid221_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1Idx6Rng6_uid222_alignmentShifter_uid64_fpAddTest_b : STD_LOGIC_VECTOR (42 downto 0);
    signal rightShiftStage1Idx6Pad6_uid223_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal rightShiftStage1Idx6_uid224_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1Idx7Rng7_uid225_alignmentShifter_uid64_fpAddTest_b : STD_LOGIC_VECTOR (41 downto 0);
    signal rightShiftStage1Idx7Pad7_uid226_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (6 downto 0);
    signal rightShiftStage1Idx7_uid227_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal r_uid231_alignmentShifter_uid64_fpAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid231_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal leftShiftStage0Idx1Rng4_uid236_fracPostNormExt_uid88_fpAddTest_in : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage0Idx1Rng4_uid236_fracPostNormExt_uid88_fpAddTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage0Idx1_uid237_fracPostNormExt_uid88_fpAddTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0Idx2Rng8_uid239_fracPostNormExt_uid88_fpAddTest_in : STD_LOGIC_VECTOR (19 downto 0);
    signal leftShiftStage0Idx2Rng8_uid239_fracPostNormExt_uid88_fpAddTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal leftShiftStage0Idx2_uid240_fracPostNormExt_uid88_fpAddTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0Idx3Pad12_uid241_fracPostNormExt_uid88_fpAddTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal leftShiftStage0Idx3Rng12_uid242_fracPostNormExt_uid88_fpAddTest_in : STD_LOGIC_VECTOR (15 downto 0);
    signal leftShiftStage0Idx3Rng12_uid242_fracPostNormExt_uid88_fpAddTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal leftShiftStage0Idx3_uid243_fracPostNormExt_uid88_fpAddTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0Idx4_uid246_fracPostNormExt_uid88_fpAddTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0Idx5Pad20_uid247_fracPostNormExt_uid88_fpAddTest_q : STD_LOGIC_VECTOR (19 downto 0);
    signal leftShiftStage0Idx5Rng20_uid248_fracPostNormExt_uid88_fpAddTest_in : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage0Idx5Rng20_uid248_fracPostNormExt_uid88_fpAddTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage0Idx5_uid249_fracPostNormExt_uid88_fpAddTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0Idx6Rng24_uid251_fracPostNormExt_uid88_fpAddTest_in : STD_LOGIC_VECTOR (3 downto 0);
    signal leftShiftStage0Idx6Rng24_uid251_fracPostNormExt_uid88_fpAddTest_b : STD_LOGIC_VECTOR (3 downto 0);
    signal leftShiftStage0Idx6_uid252_fracPostNormExt_uid88_fpAddTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0Idx7_uid253_fracPostNormExt_uid88_fpAddTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1Idx1Rng1_uid257_fracPostNormExt_uid88_fpAddTest_in : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage1Idx1Rng1_uid257_fracPostNormExt_uid88_fpAddTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal leftShiftStage1Idx1_uid258_fracPostNormExt_uid88_fpAddTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1Idx2Rng2_uid260_fracPostNormExt_uid88_fpAddTest_in : STD_LOGIC_VECTOR (25 downto 0);
    signal leftShiftStage1Idx2Rng2_uid260_fracPostNormExt_uid88_fpAddTest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal leftShiftStage1Idx2_uid261_fracPostNormExt_uid88_fpAddTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1Idx3Rng3_uid263_fracPostNormExt_uid88_fpAddTest_in : STD_LOGIC_VECTOR (24 downto 0);
    signal leftShiftStage1Idx3Rng3_uid263_fracPostNormExt_uid88_fpAddTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal leftShiftStage1Idx3_uid264_fracPostNormExt_uid88_fpAddTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage1_uid266_fracPostNormExt_uid88_fpAddTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage1_uid266_fracPostNormExt_uid88_fpAddTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal rightShiftStage0_uid206_alignmentShifter_uid64_fpAddTest_msplit_0_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid206_alignmentShifter_uid64_fpAddTest_msplit_0_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0_uid206_alignmentShifter_uid64_fpAddTest_msplit_1_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid206_alignmentShifter_uid64_fpAddTest_msplit_1_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage0_uid206_alignmentShifter_uid64_fpAddTest_mfinal_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0_uid206_alignmentShifter_uid64_fpAddTest_mfinal_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1_uid229_alignmentShifter_uid64_fpAddTest_msplit_0_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid229_alignmentShifter_uid64_fpAddTest_msplit_0_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1_uid229_alignmentShifter_uid64_fpAddTest_msplit_1_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid229_alignmentShifter_uid64_fpAddTest_msplit_1_q : STD_LOGIC_VECTOR (48 downto 0);
    signal rightShiftStage1_uid229_alignmentShifter_uid64_fpAddTest_mfinal_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage1_uid229_alignmentShifter_uid64_fpAddTest_mfinal_q : STD_LOGIC_VECTOR (48 downto 0);
    signal leftShiftStage0_uid255_fracPostNormExt_uid88_fpAddTest_msplit_0_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid255_fracPostNormExt_uid88_fpAddTest_msplit_0_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0_uid255_fracPostNormExt_uid88_fpAddTest_msplit_1_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid255_fracPostNormExt_uid88_fpAddTest_msplit_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal leftShiftStage0_uid255_fracPostNormExt_uid88_fpAddTest_mfinal_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid255_fracPostNormExt_uid88_fpAddTest_mfinal_q : STD_LOGIC_VECTOR (27 downto 0);
    signal rightShiftStageSel5Dto3_uid205_alignmentShifter_uid64_fpAddTest_merged_bit_select_in : STD_LOGIC_VECTOR (5 downto 0);
    signal rightShiftStageSel5Dto3_uid205_alignmentShifter_uid64_fpAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStageSel5Dto3_uid205_alignmentShifter_uid64_fpAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal stickyBits_uid69_fpAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (22 downto 0);
    signal stickyBits_uid69_fpAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (25 downto 0);
    signal rVStage_uid160_lzCountVal_uid85_fpAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid160_lzCountVal_uid85_fpAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid166_lzCountVal_uid85_fpAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid166_lzCountVal_uid85_fpAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid172_lzCountVal_uid85_fpAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid172_lzCountVal_uid85_fpAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel4Dto2_uid254_fracPostNormExt_uid88_fpAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStageSel4Dto2_uid254_fracPostNormExt_uid88_fpAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid206_alignmentShifter_uid64_fpAddTest_selLSBs_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid206_alignmentShifter_uid64_fpAddTest_selLSBs_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage1_uid229_alignmentShifter_uid64_fpAddTest_selLSBs_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid229_alignmentShifter_uid64_fpAddTest_selLSBs_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid255_fracPostNormExt_uid88_fpAddTest_selLSBs_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid255_fracPostNormExt_uid88_fpAddTest_selLSBs_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_rVStage_uid166_lzCountVal_uid85_fpAddTest_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist1_rVStage_uid166_lzCountVal_uid85_fpAddTest_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist2_rightShiftStageSel5Dto3_uid205_alignmentShifter_uid64_fpAddTest_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist3_vCount_uid161_lzCountVal_uid85_fpAddTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_vStage_uid155_lzCountVal_uid85_fpAddTest_b_1_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist5_vCount_uid153_lzCountVal_uid85_fpAddTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_signRInfRZRReg_uid138_fpAddTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_expRPreExc_uid118_fpAddTest_b_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist8_fracRPreExc_uid117_fpAddTest_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist9_fracPostNormRndRange_uid102_fpAddTest_b_1_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist10_aMinusA_uid87_fpAddTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_fracGRS_uid84_fpAddTest_q_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal redist12_effSub_uid52_fpAddTest_q_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_sigB_uid51_fpAddTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_sigB_uid51_fpAddTest_b_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_sigA_uid50_fpAddTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_sigA_uid50_fpAddTest_b_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_InvExpXIsZero_uid44_fpAddTest_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_excN_bSig_uid42_fpAddTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_excI_bSig_uid41_fpAddTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_fracXIsZero_uid39_fpAddTest_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_expXIsMax_uid38_fpAddTest_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_excZ_bSig_uid17_uid37_fpAddTest_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_excZ_bSig_uid17_uid37_fpAddTest_q_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_excN_aSig_uid28_fpAddTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_excI_aSig_uid27_fpAddTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_excZ_aSig_uid16_uid23_fpAddTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_frac_aSig_uid22_fpAddTest_b_2_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist28_exp_aSig_uid21_fpAddTest_b_3_q : STD_LOGIC_VECTOR (7 downto 0);

begin


    -- cAmA_uid86_fpAddTest(CONSTANT,85)
    cAmA_uid86_fpAddTest_q <= "11100";

    -- zs_uid151_lzCountVal_uid85_fpAddTest(CONSTANT,150)
    zs_uid151_lzCountVal_uid85_fpAddTest_q <= "0000000000000000";

    -- sigY_uid9_fpAddTest(BITSELECT,8)@0
    sigY_uid9_fpAddTest_b <= STD_LOGIC_VECTOR(b(31 downto 31));

    -- expY_uid11_fpAddTest(BITSELECT,10)@0
    expY_uid11_fpAddTest_b <= b(30 downto 23);

    -- fracY_uid10_fpAddTest(BITSELECT,9)@0
    fracY_uid10_fpAddTest_b <= b(22 downto 0);

    -- ypn_uid12_fpAddTest(BITJOIN,11)@0
    ypn_uid12_fpAddTest_q <= sigY_uid9_fpAddTest_b & expY_uid11_fpAddTest_b & fracY_uid10_fpAddTest_b;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- expFracY_uid7_fpAddTest(BITSELECT,6)@0
    expFracY_uid7_fpAddTest_b <= b(30 downto 0);

    -- expFracX_uid6_fpAddTest(BITSELECT,5)@0
    expFracX_uid6_fpAddTest_b <= a(30 downto 0);

    -- xGTEy_uid8_fpAddTest(COMPARE,7)@0
    xGTEy_uid8_fpAddTest_a <= STD_LOGIC_VECTOR("00" & expFracX_uid6_fpAddTest_b);
    xGTEy_uid8_fpAddTest_b <= STD_LOGIC_VECTOR("00" & expFracY_uid7_fpAddTest_b);
    xGTEy_uid8_fpAddTest_o <= STD_LOGIC_VECTOR(UNSIGNED(xGTEy_uid8_fpAddTest_a) - UNSIGNED(xGTEy_uid8_fpAddTest_b));
    xGTEy_uid8_fpAddTest_n(0) <= not (xGTEy_uid8_fpAddTest_o(32));

    -- bSig_uid17_fpAddTest(MUX,16)@0
    bSig_uid17_fpAddTest_s <= xGTEy_uid8_fpAddTest_n;
    bSig_uid17_fpAddTest_combproc: PROCESS (bSig_uid17_fpAddTest_s, a, ypn_uid12_fpAddTest_q)
    BEGIN
        CASE (bSig_uid17_fpAddTest_s) IS
            WHEN "0" => bSig_uid17_fpAddTest_q <= a;
            WHEN "1" => bSig_uid17_fpAddTest_q <= ypn_uid12_fpAddTest_q;
            WHEN OTHERS => bSig_uid17_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- sigB_uid51_fpAddTest(BITSELECT,50)@0
    sigB_uid51_fpAddTest_b <= STD_LOGIC_VECTOR(bSig_uid17_fpAddTest_q(31 downto 31));

    -- redist13_sigB_uid51_fpAddTest_b_1(DELAY,304)
    redist13_sigB_uid51_fpAddTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sigB_uid51_fpAddTest_b, xout => redist13_sigB_uid51_fpAddTest_b_1_q, clk => clk, aclr => areset );

    -- aSig_uid16_fpAddTest(MUX,15)@0
    aSig_uid16_fpAddTest_s <= xGTEy_uid8_fpAddTest_n;
    aSig_uid16_fpAddTest_combproc: PROCESS (aSig_uid16_fpAddTest_s, ypn_uid12_fpAddTest_q, a)
    BEGIN
        CASE (aSig_uid16_fpAddTest_s) IS
            WHEN "0" => aSig_uid16_fpAddTest_q <= ypn_uid12_fpAddTest_q;
            WHEN "1" => aSig_uid16_fpAddTest_q <= a;
            WHEN OTHERS => aSig_uid16_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- sigA_uid50_fpAddTest(BITSELECT,49)@0
    sigA_uid50_fpAddTest_b <= STD_LOGIC_VECTOR(aSig_uid16_fpAddTest_q(31 downto 31));

    -- redist15_sigA_uid50_fpAddTest_b_1(DELAY,306)
    redist15_sigA_uid50_fpAddTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sigA_uid50_fpAddTest_b, xout => redist15_sigA_uid50_fpAddTest_b_1_q, clk => clk, aclr => areset );

    -- effSub_uid52_fpAddTest(LOGICAL,51)@1
    effSub_uid52_fpAddTest_q <= redist15_sigA_uid50_fpAddTest_b_1_q xor redist13_sigB_uid51_fpAddTest_b_1_q;

    -- exp_bSig_uid35_fpAddTest(BITSELECT,34)@0
    exp_bSig_uid35_fpAddTest_in <= bSig_uid17_fpAddTest_q(30 downto 0);
    exp_bSig_uid35_fpAddTest_b <= exp_bSig_uid35_fpAddTest_in(30 downto 23);

    -- exp_aSig_uid21_fpAddTest(BITSELECT,20)@0
    exp_aSig_uid21_fpAddTest_in <= aSig_uid16_fpAddTest_q(30 downto 0);
    exp_aSig_uid21_fpAddTest_b <= exp_aSig_uid21_fpAddTest_in(30 downto 23);

    -- expAmExpB_uid60_fpAddTest(SUB,59)@0
    expAmExpB_uid60_fpAddTest_a <= STD_LOGIC_VECTOR("0" & exp_aSig_uid21_fpAddTest_b);
    expAmExpB_uid60_fpAddTest_b <= STD_LOGIC_VECTOR("0" & exp_bSig_uid35_fpAddTest_b);
    expAmExpB_uid60_fpAddTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expAmExpB_uid60_fpAddTest_a) - UNSIGNED(expAmExpB_uid60_fpAddTest_b));
    expAmExpB_uid60_fpAddTest_q <= expAmExpB_uid60_fpAddTest_o(8 downto 0);

    -- cWFP2_uid61_fpAddTest(CONSTANT,60)
    cWFP2_uid61_fpAddTest_q <= "11001";

    -- shiftedOut_uid63_fpAddTest(COMPARE,62)@0 + 1
    shiftedOut_uid63_fpAddTest_a <= STD_LOGIC_VECTOR("000000" & cWFP2_uid61_fpAddTest_q);
    shiftedOut_uid63_fpAddTest_b <= STD_LOGIC_VECTOR("00" & expAmExpB_uid60_fpAddTest_q);
    shiftedOut_uid63_fpAddTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            shiftedOut_uid63_fpAddTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            shiftedOut_uid63_fpAddTest_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftedOut_uid63_fpAddTest_a) - UNSIGNED(shiftedOut_uid63_fpAddTest_b));
        END IF;
    END PROCESS;
    shiftedOut_uid63_fpAddTest_c(0) <= shiftedOut_uid63_fpAddTest_o(10);

    -- iShiftedOut_uid67_fpAddTest(LOGICAL,66)@1
    iShiftedOut_uid67_fpAddTest_q <= not (shiftedOut_uid63_fpAddTest_c);

    -- rightShiftStage0Idx7_uid204_alignmentShifter_uid64_fpAddTest(CONSTANT,203)
    rightShiftStage0Idx7_uid204_alignmentShifter_uid64_fpAddTest_q <= "0000000000000000000000000000000000000000000000000";

    -- rightShiftStage1Idx7Pad7_uid226_alignmentShifter_uid64_fpAddTest(CONSTANT,225)
    rightShiftStage1Idx7Pad7_uid226_alignmentShifter_uid64_fpAddTest_q <= "0000000";

    -- rightShiftStage0Idx6Pad48_uid202_alignmentShifter_uid64_fpAddTest(CONSTANT,201)
    rightShiftStage0Idx6Pad48_uid202_alignmentShifter_uid64_fpAddTest_q <= "000000000000000000000000000000000000000000000000";

    -- cstAllZWE_uid20_fpAddTest(CONSTANT,19)
    cstAllZWE_uid20_fpAddTest_q <= "00000000";

    -- excZ_bSig_uid17_uid37_fpAddTest(LOGICAL,36)@0
    excZ_bSig_uid17_uid37_fpAddTest_q <= "1" WHEN exp_bSig_uid35_fpAddTest_b = cstAllZWE_uid20_fpAddTest_q ELSE "0";

    -- InvExpXIsZero_uid44_fpAddTest(LOGICAL,43)@0
    InvExpXIsZero_uid44_fpAddTest_q <= not (excZ_bSig_uid17_uid37_fpAddTest_q);

    -- cstZeroWF_uid19_fpAddTest(CONSTANT,18)
    cstZeroWF_uid19_fpAddTest_q <= "00000000000000000000000";

    -- frac_bSig_uid36_fpAddTest(BITSELECT,35)@0
    frac_bSig_uid36_fpAddTest_in <= bSig_uid17_fpAddTest_q(22 downto 0);
    frac_bSig_uid36_fpAddTest_b <= frac_bSig_uid36_fpAddTest_in(22 downto 0);

    -- fracBz_uid56_fpAddTest(MUX,55)@0
    fracBz_uid56_fpAddTest_s <= excZ_bSig_uid17_uid37_fpAddTest_q;
    fracBz_uid56_fpAddTest_combproc: PROCESS (fracBz_uid56_fpAddTest_s, frac_bSig_uid36_fpAddTest_b, cstZeroWF_uid19_fpAddTest_q)
    BEGIN
        CASE (fracBz_uid56_fpAddTest_s) IS
            WHEN "0" => fracBz_uid56_fpAddTest_q <= frac_bSig_uid36_fpAddTest_b;
            WHEN "1" => fracBz_uid56_fpAddTest_q <= cstZeroWF_uid19_fpAddTest_q;
            WHEN OTHERS => fracBz_uid56_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oFracB_uid59_fpAddTest(BITJOIN,58)@0
    oFracB_uid59_fpAddTest_q <= InvExpXIsZero_uid44_fpAddTest_q & fracBz_uid56_fpAddTest_q;

    -- padConst_uid64_fpAddTest(CONSTANT,63)
    padConst_uid64_fpAddTest_q <= "0000000000000000000000000";

    -- rightPaddedIn_uid65_fpAddTest(BITJOIN,64)@0
    rightPaddedIn_uid65_fpAddTest_q <= oFracB_uid59_fpAddTest_q & padConst_uid64_fpAddTest_q;

    -- rightShiftStage0Idx6Rng48_uid201_alignmentShifter_uid64_fpAddTest(BITSELECT,200)@0
    rightShiftStage0Idx6Rng48_uid201_alignmentShifter_uid64_fpAddTest_b <= rightPaddedIn_uid65_fpAddTest_q(48 downto 48);

    -- rightShiftStage0Idx6_uid203_alignmentShifter_uid64_fpAddTest(BITJOIN,202)@0
    rightShiftStage0Idx6_uid203_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage0Idx6Pad48_uid202_alignmentShifter_uid64_fpAddTest_q & rightShiftStage0Idx6Rng48_uid201_alignmentShifter_uid64_fpAddTest_b;

    -- rightShiftStage0Idx5Pad40_uid199_alignmentShifter_uid64_fpAddTest(CONSTANT,198)
    rightShiftStage0Idx5Pad40_uid199_alignmentShifter_uid64_fpAddTest_q <= "0000000000000000000000000000000000000000";

    -- rightShiftStage0Idx5Rng40_uid198_alignmentShifter_uid64_fpAddTest(BITSELECT,197)@0
    rightShiftStage0Idx5Rng40_uid198_alignmentShifter_uid64_fpAddTest_b <= rightPaddedIn_uid65_fpAddTest_q(48 downto 40);

    -- rightShiftStage0Idx5_uid200_alignmentShifter_uid64_fpAddTest(BITJOIN,199)@0
    rightShiftStage0Idx5_uid200_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage0Idx5Pad40_uid199_alignmentShifter_uid64_fpAddTest_q & rightShiftStage0Idx5Rng40_uid198_alignmentShifter_uid64_fpAddTest_b;

    -- rightShiftStage0Idx4Pad32_uid196_alignmentShifter_uid64_fpAddTest(CONSTANT,195)
    rightShiftStage0Idx4Pad32_uid196_alignmentShifter_uid64_fpAddTest_q <= "00000000000000000000000000000000";

    -- rightShiftStage0Idx4Rng32_uid195_alignmentShifter_uid64_fpAddTest(BITSELECT,194)@0
    rightShiftStage0Idx4Rng32_uid195_alignmentShifter_uid64_fpAddTest_b <= rightPaddedIn_uid65_fpAddTest_q(48 downto 32);

    -- rightShiftStage0Idx4_uid197_alignmentShifter_uid64_fpAddTest(BITJOIN,196)@0
    rightShiftStage0Idx4_uid197_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage0Idx4Pad32_uid196_alignmentShifter_uid64_fpAddTest_q & rightShiftStage0Idx4Rng32_uid195_alignmentShifter_uid64_fpAddTest_b;

    -- rightShiftStage0_uid206_alignmentShifter_uid64_fpAddTest_msplit_1(MUX,270)@0
    rightShiftStage0_uid206_alignmentShifter_uid64_fpAddTest_msplit_1_s <= rightShiftStage0_uid206_alignmentShifter_uid64_fpAddTest_selLSBs_merged_bit_select_b;
    rightShiftStage0_uid206_alignmentShifter_uid64_fpAddTest_msplit_1_combproc: PROCESS (rightShiftStage0_uid206_alignmentShifter_uid64_fpAddTest_msplit_1_s, rightShiftStage0Idx4_uid197_alignmentShifter_uid64_fpAddTest_q, rightShiftStage0Idx5_uid200_alignmentShifter_uid64_fpAddTest_q, rightShiftStage0Idx6_uid203_alignmentShifter_uid64_fpAddTest_q, rightShiftStage0Idx7_uid204_alignmentShifter_uid64_fpAddTest_q)
    BEGIN
        CASE (rightShiftStage0_uid206_alignmentShifter_uid64_fpAddTest_msplit_1_s) IS
            WHEN "00" => rightShiftStage0_uid206_alignmentShifter_uid64_fpAddTest_msplit_1_q <= rightShiftStage0Idx4_uid197_alignmentShifter_uid64_fpAddTest_q;
            WHEN "01" => rightShiftStage0_uid206_alignmentShifter_uid64_fpAddTest_msplit_1_q <= rightShiftStage0Idx5_uid200_alignmentShifter_uid64_fpAddTest_q;
            WHEN "10" => rightShiftStage0_uid206_alignmentShifter_uid64_fpAddTest_msplit_1_q <= rightShiftStage0Idx6_uid203_alignmentShifter_uid64_fpAddTest_q;
            WHEN "11" => rightShiftStage0_uid206_alignmentShifter_uid64_fpAddTest_msplit_1_q <= rightShiftStage0Idx7_uid204_alignmentShifter_uid64_fpAddTest_q;
            WHEN OTHERS => rightShiftStage0_uid206_alignmentShifter_uid64_fpAddTest_msplit_1_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage0Idx3Pad24_uid193_alignmentShifter_uid64_fpAddTest(CONSTANT,192)
    rightShiftStage0Idx3Pad24_uid193_alignmentShifter_uid64_fpAddTest_q <= "000000000000000000000000";

    -- rightShiftStage0Idx3Rng24_uid192_alignmentShifter_uid64_fpAddTest(BITSELECT,191)@0
    rightShiftStage0Idx3Rng24_uid192_alignmentShifter_uid64_fpAddTest_b <= rightPaddedIn_uid65_fpAddTest_q(48 downto 24);

    -- rightShiftStage0Idx3_uid194_alignmentShifter_uid64_fpAddTest(BITJOIN,193)@0
    rightShiftStage0Idx3_uid194_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage0Idx3Pad24_uid193_alignmentShifter_uid64_fpAddTest_q & rightShiftStage0Idx3Rng24_uid192_alignmentShifter_uid64_fpAddTest_b;

    -- rightShiftStage0Idx2Rng16_uid189_alignmentShifter_uid64_fpAddTest(BITSELECT,188)@0
    rightShiftStage0Idx2Rng16_uid189_alignmentShifter_uid64_fpAddTest_b <= rightPaddedIn_uid65_fpAddTest_q(48 downto 16);

    -- rightShiftStage0Idx2_uid191_alignmentShifter_uid64_fpAddTest(BITJOIN,190)@0
    rightShiftStage0Idx2_uid191_alignmentShifter_uid64_fpAddTest_q <= zs_uid151_lzCountVal_uid85_fpAddTest_q & rightShiftStage0Idx2Rng16_uid189_alignmentShifter_uid64_fpAddTest_b;

    -- rightShiftStage0Idx1Rng8_uid186_alignmentShifter_uid64_fpAddTest(BITSELECT,185)@0
    rightShiftStage0Idx1Rng8_uid186_alignmentShifter_uid64_fpAddTest_b <= rightPaddedIn_uid65_fpAddTest_q(48 downto 8);

    -- rightShiftStage0Idx1_uid188_alignmentShifter_uid64_fpAddTest(BITJOIN,187)@0
    rightShiftStage0Idx1_uid188_alignmentShifter_uid64_fpAddTest_q <= cstAllZWE_uid20_fpAddTest_q & rightShiftStage0Idx1Rng8_uid186_alignmentShifter_uid64_fpAddTest_b;

    -- rightShiftStage0_uid206_alignmentShifter_uid64_fpAddTest_msplit_0(MUX,269)@0
    rightShiftStage0_uid206_alignmentShifter_uid64_fpAddTest_msplit_0_s <= rightShiftStage0_uid206_alignmentShifter_uid64_fpAddTest_selLSBs_merged_bit_select_b;
    rightShiftStage0_uid206_alignmentShifter_uid64_fpAddTest_msplit_0_combproc: PROCESS (rightShiftStage0_uid206_alignmentShifter_uid64_fpAddTest_msplit_0_s, rightPaddedIn_uid65_fpAddTest_q, rightShiftStage0Idx1_uid188_alignmentShifter_uid64_fpAddTest_q, rightShiftStage0Idx2_uid191_alignmentShifter_uid64_fpAddTest_q, rightShiftStage0Idx3_uid194_alignmentShifter_uid64_fpAddTest_q)
    BEGIN
        CASE (rightShiftStage0_uid206_alignmentShifter_uid64_fpAddTest_msplit_0_s) IS
            WHEN "00" => rightShiftStage0_uid206_alignmentShifter_uid64_fpAddTest_msplit_0_q <= rightPaddedIn_uid65_fpAddTest_q;
            WHEN "01" => rightShiftStage0_uid206_alignmentShifter_uid64_fpAddTest_msplit_0_q <= rightShiftStage0Idx1_uid188_alignmentShifter_uid64_fpAddTest_q;
            WHEN "10" => rightShiftStage0_uid206_alignmentShifter_uid64_fpAddTest_msplit_0_q <= rightShiftStage0Idx2_uid191_alignmentShifter_uid64_fpAddTest_q;
            WHEN "11" => rightShiftStage0_uid206_alignmentShifter_uid64_fpAddTest_msplit_0_q <= rightShiftStage0Idx3_uid194_alignmentShifter_uid64_fpAddTest_q;
            WHEN OTHERS => rightShiftStage0_uid206_alignmentShifter_uid64_fpAddTest_msplit_0_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStageSel5Dto3_uid205_alignmentShifter_uid64_fpAddTest_merged_bit_select(BITSELECT,282)@0
    rightShiftStageSel5Dto3_uid205_alignmentShifter_uid64_fpAddTest_merged_bit_select_in <= expAmExpB_uid60_fpAddTest_q(5 downto 0);
    rightShiftStageSel5Dto3_uid205_alignmentShifter_uid64_fpAddTest_merged_bit_select_b <= rightShiftStageSel5Dto3_uid205_alignmentShifter_uid64_fpAddTest_merged_bit_select_in(5 downto 3);
    rightShiftStageSel5Dto3_uid205_alignmentShifter_uid64_fpAddTest_merged_bit_select_c <= rightShiftStageSel5Dto3_uid205_alignmentShifter_uid64_fpAddTest_merged_bit_select_in(2 downto 0);

    -- rightShiftStage0_uid206_alignmentShifter_uid64_fpAddTest_selLSBs_merged_bit_select(BITSELECT,288)@0
    rightShiftStage0_uid206_alignmentShifter_uid64_fpAddTest_selLSBs_merged_bit_select_b <= rightShiftStageSel5Dto3_uid205_alignmentShifter_uid64_fpAddTest_merged_bit_select_b(1 downto 0);
    rightShiftStage0_uid206_alignmentShifter_uid64_fpAddTest_selLSBs_merged_bit_select_c <= rightShiftStageSel5Dto3_uid205_alignmentShifter_uid64_fpAddTest_merged_bit_select_b(2 downto 2);

    -- rightShiftStage0_uid206_alignmentShifter_uid64_fpAddTest_mfinal(MUX,271)@0 + 1
    rightShiftStage0_uid206_alignmentShifter_uid64_fpAddTest_mfinal_s <= rightShiftStage0_uid206_alignmentShifter_uid64_fpAddTest_selLSBs_merged_bit_select_c;
    rightShiftStage0_uid206_alignmentShifter_uid64_fpAddTest_mfinal_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rightShiftStage0_uid206_alignmentShifter_uid64_fpAddTest_mfinal_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (rightShiftStage0_uid206_alignmentShifter_uid64_fpAddTest_mfinal_s) IS
                WHEN "0" => rightShiftStage0_uid206_alignmentShifter_uid64_fpAddTest_mfinal_q <= rightShiftStage0_uid206_alignmentShifter_uid64_fpAddTest_msplit_0_q;
                WHEN "1" => rightShiftStage0_uid206_alignmentShifter_uid64_fpAddTest_mfinal_q <= rightShiftStage0_uid206_alignmentShifter_uid64_fpAddTest_msplit_1_q;
                WHEN OTHERS => rightShiftStage0_uid206_alignmentShifter_uid64_fpAddTest_mfinal_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- rightShiftStage1Idx7Rng7_uid225_alignmentShifter_uid64_fpAddTest(BITSELECT,224)@1
    rightShiftStage1Idx7Rng7_uid225_alignmentShifter_uid64_fpAddTest_b <= rightShiftStage0_uid206_alignmentShifter_uid64_fpAddTest_mfinal_q(48 downto 7);

    -- rightShiftStage1Idx7_uid227_alignmentShifter_uid64_fpAddTest(BITJOIN,226)@1
    rightShiftStage1Idx7_uid227_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage1Idx7Pad7_uid226_alignmentShifter_uid64_fpAddTest_q & rightShiftStage1Idx7Rng7_uid225_alignmentShifter_uid64_fpAddTest_b;

    -- rightShiftStage1Idx6Pad6_uid223_alignmentShifter_uid64_fpAddTest(CONSTANT,222)
    rightShiftStage1Idx6Pad6_uid223_alignmentShifter_uid64_fpAddTest_q <= "000000";

    -- rightShiftStage1Idx6Rng6_uid222_alignmentShifter_uid64_fpAddTest(BITSELECT,221)@1
    rightShiftStage1Idx6Rng6_uid222_alignmentShifter_uid64_fpAddTest_b <= rightShiftStage0_uid206_alignmentShifter_uid64_fpAddTest_mfinal_q(48 downto 6);

    -- rightShiftStage1Idx6_uid224_alignmentShifter_uid64_fpAddTest(BITJOIN,223)@1
    rightShiftStage1Idx6_uid224_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage1Idx6Pad6_uid223_alignmentShifter_uid64_fpAddTest_q & rightShiftStage1Idx6Rng6_uid222_alignmentShifter_uid64_fpAddTest_b;

    -- rightShiftStage1Idx5Pad5_uid220_alignmentShifter_uid64_fpAddTest(CONSTANT,219)
    rightShiftStage1Idx5Pad5_uid220_alignmentShifter_uid64_fpAddTest_q <= "00000";

    -- rightShiftStage1Idx5Rng5_uid219_alignmentShifter_uid64_fpAddTest(BITSELECT,218)@1
    rightShiftStage1Idx5Rng5_uid219_alignmentShifter_uid64_fpAddTest_b <= rightShiftStage0_uid206_alignmentShifter_uid64_fpAddTest_mfinal_q(48 downto 5);

    -- rightShiftStage1Idx5_uid221_alignmentShifter_uid64_fpAddTest(BITJOIN,220)@1
    rightShiftStage1Idx5_uid221_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage1Idx5Pad5_uid220_alignmentShifter_uid64_fpAddTest_q & rightShiftStage1Idx5Rng5_uid219_alignmentShifter_uid64_fpAddTest_b;

    -- zs_uid165_lzCountVal_uid85_fpAddTest(CONSTANT,164)
    zs_uid165_lzCountVal_uid85_fpAddTest_q <= "0000";

    -- rightShiftStage1Idx4Rng4_uid216_alignmentShifter_uid64_fpAddTest(BITSELECT,215)@1
    rightShiftStage1Idx4Rng4_uid216_alignmentShifter_uid64_fpAddTest_b <= rightShiftStage0_uid206_alignmentShifter_uid64_fpAddTest_mfinal_q(48 downto 4);

    -- rightShiftStage1Idx4_uid218_alignmentShifter_uid64_fpAddTest(BITJOIN,217)@1
    rightShiftStage1Idx4_uid218_alignmentShifter_uid64_fpAddTest_q <= zs_uid165_lzCountVal_uid85_fpAddTest_q & rightShiftStage1Idx4Rng4_uid216_alignmentShifter_uid64_fpAddTest_b;

    -- rightShiftStage1_uid229_alignmentShifter_uid64_fpAddTest_msplit_1(MUX,275)@1
    rightShiftStage1_uid229_alignmentShifter_uid64_fpAddTest_msplit_1_s <= rightShiftStage1_uid229_alignmentShifter_uid64_fpAddTest_selLSBs_merged_bit_select_b;
    rightShiftStage1_uid229_alignmentShifter_uid64_fpAddTest_msplit_1_combproc: PROCESS (rightShiftStage1_uid229_alignmentShifter_uid64_fpAddTest_msplit_1_s, rightShiftStage1Idx4_uid218_alignmentShifter_uid64_fpAddTest_q, rightShiftStage1Idx5_uid221_alignmentShifter_uid64_fpAddTest_q, rightShiftStage1Idx6_uid224_alignmentShifter_uid64_fpAddTest_q, rightShiftStage1Idx7_uid227_alignmentShifter_uid64_fpAddTest_q)
    BEGIN
        CASE (rightShiftStage1_uid229_alignmentShifter_uid64_fpAddTest_msplit_1_s) IS
            WHEN "00" => rightShiftStage1_uid229_alignmentShifter_uid64_fpAddTest_msplit_1_q <= rightShiftStage1Idx4_uid218_alignmentShifter_uid64_fpAddTest_q;
            WHEN "01" => rightShiftStage1_uid229_alignmentShifter_uid64_fpAddTest_msplit_1_q <= rightShiftStage1Idx5_uid221_alignmentShifter_uid64_fpAddTest_q;
            WHEN "10" => rightShiftStage1_uid229_alignmentShifter_uid64_fpAddTest_msplit_1_q <= rightShiftStage1Idx6_uid224_alignmentShifter_uid64_fpAddTest_q;
            WHEN "11" => rightShiftStage1_uid229_alignmentShifter_uid64_fpAddTest_msplit_1_q <= rightShiftStage1Idx7_uid227_alignmentShifter_uid64_fpAddTest_q;
            WHEN OTHERS => rightShiftStage1_uid229_alignmentShifter_uid64_fpAddTest_msplit_1_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage1Idx3Pad3_uid214_alignmentShifter_uid64_fpAddTest(CONSTANT,213)
    rightShiftStage1Idx3Pad3_uid214_alignmentShifter_uid64_fpAddTest_q <= "000";

    -- rightShiftStage1Idx3Rng3_uid213_alignmentShifter_uid64_fpAddTest(BITSELECT,212)@1
    rightShiftStage1Idx3Rng3_uid213_alignmentShifter_uid64_fpAddTest_b <= rightShiftStage0_uid206_alignmentShifter_uid64_fpAddTest_mfinal_q(48 downto 3);

    -- rightShiftStage1Idx3_uid215_alignmentShifter_uid64_fpAddTest(BITJOIN,214)@1
    rightShiftStage1Idx3_uid215_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage1Idx3Pad3_uid214_alignmentShifter_uid64_fpAddTest_q & rightShiftStage1Idx3Rng3_uid213_alignmentShifter_uid64_fpAddTest_b;

    -- zs_uid171_lzCountVal_uid85_fpAddTest(CONSTANT,170)
    zs_uid171_lzCountVal_uid85_fpAddTest_q <= "00";

    -- rightShiftStage1Idx2Rng2_uid210_alignmentShifter_uid64_fpAddTest(BITSELECT,209)@1
    rightShiftStage1Idx2Rng2_uid210_alignmentShifter_uid64_fpAddTest_b <= rightShiftStage0_uid206_alignmentShifter_uid64_fpAddTest_mfinal_q(48 downto 2);

    -- rightShiftStage1Idx2_uid212_alignmentShifter_uid64_fpAddTest(BITJOIN,211)@1
    rightShiftStage1Idx2_uid212_alignmentShifter_uid64_fpAddTest_q <= zs_uid171_lzCountVal_uid85_fpAddTest_q & rightShiftStage1Idx2Rng2_uid210_alignmentShifter_uid64_fpAddTest_b;

    -- rightShiftStage1Idx1Rng1_uid207_alignmentShifter_uid64_fpAddTest(BITSELECT,206)@1
    rightShiftStage1Idx1Rng1_uid207_alignmentShifter_uid64_fpAddTest_b <= rightShiftStage0_uid206_alignmentShifter_uid64_fpAddTest_mfinal_q(48 downto 1);

    -- rightShiftStage1Idx1_uid209_alignmentShifter_uid64_fpAddTest(BITJOIN,208)@1
    rightShiftStage1Idx1_uid209_alignmentShifter_uid64_fpAddTest_q <= GND_q & rightShiftStage1Idx1Rng1_uid207_alignmentShifter_uid64_fpAddTest_b;

    -- rightShiftStage1_uid229_alignmentShifter_uid64_fpAddTest_msplit_0(MUX,274)@1
    rightShiftStage1_uid229_alignmentShifter_uid64_fpAddTest_msplit_0_s <= rightShiftStage1_uid229_alignmentShifter_uid64_fpAddTest_selLSBs_merged_bit_select_b;
    rightShiftStage1_uid229_alignmentShifter_uid64_fpAddTest_msplit_0_combproc: PROCESS (rightShiftStage1_uid229_alignmentShifter_uid64_fpAddTest_msplit_0_s, rightShiftStage0_uid206_alignmentShifter_uid64_fpAddTest_mfinal_q, rightShiftStage1Idx1_uid209_alignmentShifter_uid64_fpAddTest_q, rightShiftStage1Idx2_uid212_alignmentShifter_uid64_fpAddTest_q, rightShiftStage1Idx3_uid215_alignmentShifter_uid64_fpAddTest_q)
    BEGIN
        CASE (rightShiftStage1_uid229_alignmentShifter_uid64_fpAddTest_msplit_0_s) IS
            WHEN "00" => rightShiftStage1_uid229_alignmentShifter_uid64_fpAddTest_msplit_0_q <= rightShiftStage0_uid206_alignmentShifter_uid64_fpAddTest_mfinal_q;
            WHEN "01" => rightShiftStage1_uid229_alignmentShifter_uid64_fpAddTest_msplit_0_q <= rightShiftStage1Idx1_uid209_alignmentShifter_uid64_fpAddTest_q;
            WHEN "10" => rightShiftStage1_uid229_alignmentShifter_uid64_fpAddTest_msplit_0_q <= rightShiftStage1Idx2_uid212_alignmentShifter_uid64_fpAddTest_q;
            WHEN "11" => rightShiftStage1_uid229_alignmentShifter_uid64_fpAddTest_msplit_0_q <= rightShiftStage1Idx3_uid215_alignmentShifter_uid64_fpAddTest_q;
            WHEN OTHERS => rightShiftStage1_uid229_alignmentShifter_uid64_fpAddTest_msplit_0_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist2_rightShiftStageSel5Dto3_uid205_alignmentShifter_uid64_fpAddTest_merged_bit_select_c_1(DELAY,293)
    redist2_rightShiftStageSel5Dto3_uid205_alignmentShifter_uid64_fpAddTest_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rightShiftStageSel5Dto3_uid205_alignmentShifter_uid64_fpAddTest_merged_bit_select_c, xout => redist2_rightShiftStageSel5Dto3_uid205_alignmentShifter_uid64_fpAddTest_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- rightShiftStage1_uid229_alignmentShifter_uid64_fpAddTest_selLSBs_merged_bit_select(BITSELECT,289)@1
    rightShiftStage1_uid229_alignmentShifter_uid64_fpAddTest_selLSBs_merged_bit_select_b <= redist2_rightShiftStageSel5Dto3_uid205_alignmentShifter_uid64_fpAddTest_merged_bit_select_c_1_q(1 downto 0);
    rightShiftStage1_uid229_alignmentShifter_uid64_fpAddTest_selLSBs_merged_bit_select_c <= redist2_rightShiftStageSel5Dto3_uid205_alignmentShifter_uid64_fpAddTest_merged_bit_select_c_1_q(2 downto 2);

    -- rightShiftStage1_uid229_alignmentShifter_uid64_fpAddTest_mfinal(MUX,276)@1
    rightShiftStage1_uid229_alignmentShifter_uid64_fpAddTest_mfinal_s <= rightShiftStage1_uid229_alignmentShifter_uid64_fpAddTest_selLSBs_merged_bit_select_c;
    rightShiftStage1_uid229_alignmentShifter_uid64_fpAddTest_mfinal_combproc: PROCESS (rightShiftStage1_uid229_alignmentShifter_uid64_fpAddTest_mfinal_s, rightShiftStage1_uid229_alignmentShifter_uid64_fpAddTest_msplit_0_q, rightShiftStage1_uid229_alignmentShifter_uid64_fpAddTest_msplit_1_q)
    BEGIN
        CASE (rightShiftStage1_uid229_alignmentShifter_uid64_fpAddTest_mfinal_s) IS
            WHEN "0" => rightShiftStage1_uid229_alignmentShifter_uid64_fpAddTest_mfinal_q <= rightShiftStage1_uid229_alignmentShifter_uid64_fpAddTest_msplit_0_q;
            WHEN "1" => rightShiftStage1_uid229_alignmentShifter_uid64_fpAddTest_mfinal_q <= rightShiftStage1_uid229_alignmentShifter_uid64_fpAddTest_msplit_1_q;
            WHEN OTHERS => rightShiftStage1_uid229_alignmentShifter_uid64_fpAddTest_mfinal_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- wIntCst_uid184_alignmentShifter_uid64_fpAddTest(CONSTANT,183)
    wIntCst_uid184_alignmentShifter_uid64_fpAddTest_q <= "110001";

    -- shiftedOut_uid185_alignmentShifter_uid64_fpAddTest(COMPARE,184)@0 + 1
    shiftedOut_uid185_alignmentShifter_uid64_fpAddTest_a <= STD_LOGIC_VECTOR("00" & expAmExpB_uid60_fpAddTest_q);
    shiftedOut_uid185_alignmentShifter_uid64_fpAddTest_b <= STD_LOGIC_VECTOR("00000" & wIntCst_uid184_alignmentShifter_uid64_fpAddTest_q);
    shiftedOut_uid185_alignmentShifter_uid64_fpAddTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            shiftedOut_uid185_alignmentShifter_uid64_fpAddTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            shiftedOut_uid185_alignmentShifter_uid64_fpAddTest_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftedOut_uid185_alignmentShifter_uid64_fpAddTest_a) - UNSIGNED(shiftedOut_uid185_alignmentShifter_uid64_fpAddTest_b));
        END IF;
    END PROCESS;
    shiftedOut_uid185_alignmentShifter_uid64_fpAddTest_n(0) <= not (shiftedOut_uid185_alignmentShifter_uid64_fpAddTest_o(10));

    -- r_uid231_alignmentShifter_uid64_fpAddTest(MUX,230)@1
    r_uid231_alignmentShifter_uid64_fpAddTest_s <= shiftedOut_uid185_alignmentShifter_uid64_fpAddTest_n;
    r_uid231_alignmentShifter_uid64_fpAddTest_combproc: PROCESS (r_uid231_alignmentShifter_uid64_fpAddTest_s, rightShiftStage1_uid229_alignmentShifter_uid64_fpAddTest_mfinal_q, rightShiftStage0Idx7_uid204_alignmentShifter_uid64_fpAddTest_q)
    BEGIN
        CASE (r_uid231_alignmentShifter_uid64_fpAddTest_s) IS
            WHEN "0" => r_uid231_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage1_uid229_alignmentShifter_uid64_fpAddTest_mfinal_q;
            WHEN "1" => r_uid231_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage0Idx7_uid204_alignmentShifter_uid64_fpAddTest_q;
            WHEN OTHERS => r_uid231_alignmentShifter_uid64_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- alignFracBPostShiftOut_uid68_fpAddTest(LOGICAL,67)@1
    alignFracBPostShiftOut_uid68_fpAddTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((48 downto 1 => iShiftedOut_uid67_fpAddTest_q(0)) & iShiftedOut_uid67_fpAddTest_q));
    alignFracBPostShiftOut_uid68_fpAddTest_q <= r_uid231_alignmentShifter_uid64_fpAddTest_q and alignFracBPostShiftOut_uid68_fpAddTest_b;

    -- stickyBits_uid69_fpAddTest_merged_bit_select(BITSELECT,283)@1
    stickyBits_uid69_fpAddTest_merged_bit_select_b <= alignFracBPostShiftOut_uid68_fpAddTest_q(22 downto 0);
    stickyBits_uid69_fpAddTest_merged_bit_select_c <= alignFracBPostShiftOut_uid68_fpAddTest_q(48 downto 23);

    -- fracBAddOp_uid80_fpAddTest(BITJOIN,79)@1
    fracBAddOp_uid80_fpAddTest_q <= GND_q & stickyBits_uid69_fpAddTest_merged_bit_select_c;

    -- fracBAddOpPostXor_uid81_fpAddTest(LOGICAL,80)@1 + 1
    fracBAddOpPostXor_uid81_fpAddTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 1 => effSub_uid52_fpAddTest_q(0)) & effSub_uid52_fpAddTest_q));
    fracBAddOpPostXor_uid81_fpAddTest_qi <= fracBAddOp_uid80_fpAddTest_q xor fracBAddOpPostXor_uid81_fpAddTest_b;
    fracBAddOpPostXor_uid81_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 27, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracBAddOpPostXor_uid81_fpAddTest_qi, xout => fracBAddOpPostXor_uid81_fpAddTest_q, clk => clk, aclr => areset );

    -- zocst_uid76_fpAddTest(CONSTANT,75)
    zocst_uid76_fpAddTest_q <= "01";

    -- frac_aSig_uid22_fpAddTest(BITSELECT,21)@0
    frac_aSig_uid22_fpAddTest_in <= aSig_uid16_fpAddTest_q(22 downto 0);
    frac_aSig_uid22_fpAddTest_b <= frac_aSig_uid22_fpAddTest_in(22 downto 0);

    -- redist27_frac_aSig_uid22_fpAddTest_b_2(DELAY,318)
    redist27_frac_aSig_uid22_fpAddTest_b_2 : dspba_delay
    GENERIC MAP ( width => 23, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => frac_aSig_uid22_fpAddTest_b, xout => redist27_frac_aSig_uid22_fpAddTest_b_2_q, clk => clk, aclr => areset );

    -- cmpEQ_stickyBits_cZwF_uid71_fpAddTest(LOGICAL,70)@1
    cmpEQ_stickyBits_cZwF_uid71_fpAddTest_q <= "1" WHEN stickyBits_uid69_fpAddTest_merged_bit_select_b = cstZeroWF_uid19_fpAddTest_q ELSE "0";

    -- effSubInvSticky_uid74_fpAddTest(LOGICAL,73)@1 + 1
    effSubInvSticky_uid74_fpAddTest_qi <= effSub_uid52_fpAddTest_q and cmpEQ_stickyBits_cZwF_uid71_fpAddTest_q;
    effSubInvSticky_uid74_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => effSubInvSticky_uid74_fpAddTest_qi, xout => effSubInvSticky_uid74_fpAddTest_q, clk => clk, aclr => areset );

    -- fracAAddOp_uid77_fpAddTest(BITJOIN,76)@2
    fracAAddOp_uid77_fpAddTest_q <= zocst_uid76_fpAddTest_q & redist27_frac_aSig_uid22_fpAddTest_b_2_q & GND_q & effSubInvSticky_uid74_fpAddTest_q;

    -- fracAddResult_uid82_fpAddTest(ADD,81)@2
    fracAddResult_uid82_fpAddTest_a <= STD_LOGIC_VECTOR("0" & fracAAddOp_uid77_fpAddTest_q);
    fracAddResult_uid82_fpAddTest_b <= STD_LOGIC_VECTOR("0" & fracBAddOpPostXor_uid81_fpAddTest_q);
    fracAddResult_uid82_fpAddTest_o <= STD_LOGIC_VECTOR(UNSIGNED(fracAddResult_uid82_fpAddTest_a) + UNSIGNED(fracAddResult_uid82_fpAddTest_b));
    fracAddResult_uid82_fpAddTest_q <= fracAddResult_uid82_fpAddTest_o(27 downto 0);

    -- rangeFracAddResultMwfp3Dto0_uid83_fpAddTest(BITSELECT,82)@2
    rangeFracAddResultMwfp3Dto0_uid83_fpAddTest_in <= fracAddResult_uid82_fpAddTest_q(26 downto 0);
    rangeFracAddResultMwfp3Dto0_uid83_fpAddTest_b <= rangeFracAddResultMwfp3Dto0_uid83_fpAddTest_in(26 downto 0);

    -- invCmpEQ_stickyBits_cZwF_uid72_fpAddTest(LOGICAL,71)@1 + 1
    invCmpEQ_stickyBits_cZwF_uid72_fpAddTest_qi <= not (cmpEQ_stickyBits_cZwF_uid71_fpAddTest_q);
    invCmpEQ_stickyBits_cZwF_uid72_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => invCmpEQ_stickyBits_cZwF_uid72_fpAddTest_qi, xout => invCmpEQ_stickyBits_cZwF_uid72_fpAddTest_q, clk => clk, aclr => areset );

    -- fracGRS_uid84_fpAddTest(BITJOIN,83)@2
    fracGRS_uid84_fpAddTest_q <= rangeFracAddResultMwfp3Dto0_uid83_fpAddTest_b & invCmpEQ_stickyBits_cZwF_uid72_fpAddTest_q;

    -- rVStage_uid152_lzCountVal_uid85_fpAddTest(BITSELECT,151)@2
    rVStage_uid152_lzCountVal_uid85_fpAddTest_b <= fracGRS_uid84_fpAddTest_q(27 downto 12);

    -- vCount_uid153_lzCountVal_uid85_fpAddTest(LOGICAL,152)@2
    vCount_uid153_lzCountVal_uid85_fpAddTest_q <= "1" WHEN rVStage_uid152_lzCountVal_uid85_fpAddTest_b = zs_uid151_lzCountVal_uid85_fpAddTest_q ELSE "0";

    -- redist5_vCount_uid153_lzCountVal_uid85_fpAddTest_q_1(DELAY,296)
    redist5_vCount_uid153_lzCountVal_uid85_fpAddTest_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid153_lzCountVal_uid85_fpAddTest_q, xout => redist5_vCount_uid153_lzCountVal_uid85_fpAddTest_q_1_q, clk => clk, aclr => areset );

    -- vStage_uid155_lzCountVal_uid85_fpAddTest(BITSELECT,154)@2
    vStage_uid155_lzCountVal_uid85_fpAddTest_in <= fracGRS_uid84_fpAddTest_q(11 downto 0);
    vStage_uid155_lzCountVal_uid85_fpAddTest_b <= vStage_uid155_lzCountVal_uid85_fpAddTest_in(11 downto 0);

    -- mO_uid154_lzCountVal_uid85_fpAddTest(CONSTANT,153)
    mO_uid154_lzCountVal_uid85_fpAddTest_q <= "1111";

    -- cStage_uid156_lzCountVal_uid85_fpAddTest(BITJOIN,155)@2
    cStage_uid156_lzCountVal_uid85_fpAddTest_q <= vStage_uid155_lzCountVal_uid85_fpAddTest_b & mO_uid154_lzCountVal_uid85_fpAddTest_q;

    -- vStagei_uid158_lzCountVal_uid85_fpAddTest(MUX,157)@2
    vStagei_uid158_lzCountVal_uid85_fpAddTest_s <= vCount_uid153_lzCountVal_uid85_fpAddTest_q;
    vStagei_uid158_lzCountVal_uid85_fpAddTest_combproc: PROCESS (vStagei_uid158_lzCountVal_uid85_fpAddTest_s, rVStage_uid152_lzCountVal_uid85_fpAddTest_b, cStage_uid156_lzCountVal_uid85_fpAddTest_q)
    BEGIN
        CASE (vStagei_uid158_lzCountVal_uid85_fpAddTest_s) IS
            WHEN "0" => vStagei_uid158_lzCountVal_uid85_fpAddTest_q <= rVStage_uid152_lzCountVal_uid85_fpAddTest_b;
            WHEN "1" => vStagei_uid158_lzCountVal_uid85_fpAddTest_q <= cStage_uid156_lzCountVal_uid85_fpAddTest_q;
            WHEN OTHERS => vStagei_uid158_lzCountVal_uid85_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid160_lzCountVal_uid85_fpAddTest_merged_bit_select(BITSELECT,284)@2
    rVStage_uid160_lzCountVal_uid85_fpAddTest_merged_bit_select_b <= vStagei_uid158_lzCountVal_uid85_fpAddTest_q(15 downto 8);
    rVStage_uid160_lzCountVal_uid85_fpAddTest_merged_bit_select_c <= vStagei_uid158_lzCountVal_uid85_fpAddTest_q(7 downto 0);

    -- vCount_uid161_lzCountVal_uid85_fpAddTest(LOGICAL,160)@2
    vCount_uid161_lzCountVal_uid85_fpAddTest_q <= "1" WHEN rVStage_uid160_lzCountVal_uid85_fpAddTest_merged_bit_select_b = cstAllZWE_uid20_fpAddTest_q ELSE "0";

    -- redist3_vCount_uid161_lzCountVal_uid85_fpAddTest_q_1(DELAY,294)
    redist3_vCount_uid161_lzCountVal_uid85_fpAddTest_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid161_lzCountVal_uid85_fpAddTest_q, xout => redist3_vCount_uid161_lzCountVal_uid85_fpAddTest_q_1_q, clk => clk, aclr => areset );

    -- vStagei_uid164_lzCountVal_uid85_fpAddTest(MUX,163)@2
    vStagei_uid164_lzCountVal_uid85_fpAddTest_s <= vCount_uid161_lzCountVal_uid85_fpAddTest_q;
    vStagei_uid164_lzCountVal_uid85_fpAddTest_combproc: PROCESS (vStagei_uid164_lzCountVal_uid85_fpAddTest_s, rVStage_uid160_lzCountVal_uid85_fpAddTest_merged_bit_select_b, rVStage_uid160_lzCountVal_uid85_fpAddTest_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid164_lzCountVal_uid85_fpAddTest_s) IS
            WHEN "0" => vStagei_uid164_lzCountVal_uid85_fpAddTest_q <= rVStage_uid160_lzCountVal_uid85_fpAddTest_merged_bit_select_b;
            WHEN "1" => vStagei_uid164_lzCountVal_uid85_fpAddTest_q <= rVStage_uid160_lzCountVal_uid85_fpAddTest_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid164_lzCountVal_uid85_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid166_lzCountVal_uid85_fpAddTest_merged_bit_select(BITSELECT,285)@2
    rVStage_uid166_lzCountVal_uid85_fpAddTest_merged_bit_select_b <= vStagei_uid164_lzCountVal_uid85_fpAddTest_q(7 downto 4);
    rVStage_uid166_lzCountVal_uid85_fpAddTest_merged_bit_select_c <= vStagei_uid164_lzCountVal_uid85_fpAddTest_q(3 downto 0);

    -- vCount_uid167_lzCountVal_uid85_fpAddTest(LOGICAL,166)@2 + 1
    vCount_uid167_lzCountVal_uid85_fpAddTest_qi <= "1" WHEN rVStage_uid166_lzCountVal_uid85_fpAddTest_merged_bit_select_b = zs_uid165_lzCountVal_uid85_fpAddTest_q ELSE "0";
    vCount_uid167_lzCountVal_uid85_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid167_lzCountVal_uid85_fpAddTest_qi, xout => vCount_uid167_lzCountVal_uid85_fpAddTest_q, clk => clk, aclr => areset );

    -- redist1_rVStage_uid166_lzCountVal_uid85_fpAddTest_merged_bit_select_c_1(DELAY,292)
    redist1_rVStage_uid166_lzCountVal_uid85_fpAddTest_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 4, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rVStage_uid166_lzCountVal_uid85_fpAddTest_merged_bit_select_c, xout => redist1_rVStage_uid166_lzCountVal_uid85_fpAddTest_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- redist0_rVStage_uid166_lzCountVal_uid85_fpAddTest_merged_bit_select_b_1(DELAY,291)
    redist0_rVStage_uid166_lzCountVal_uid85_fpAddTest_merged_bit_select_b_1 : dspba_delay
    GENERIC MAP ( width => 4, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rVStage_uid166_lzCountVal_uid85_fpAddTest_merged_bit_select_b, xout => redist0_rVStage_uid166_lzCountVal_uid85_fpAddTest_merged_bit_select_b_1_q, clk => clk, aclr => areset );

    -- vStagei_uid170_lzCountVal_uid85_fpAddTest(MUX,169)@3
    vStagei_uid170_lzCountVal_uid85_fpAddTest_s <= vCount_uid167_lzCountVal_uid85_fpAddTest_q;
    vStagei_uid170_lzCountVal_uid85_fpAddTest_combproc: PROCESS (vStagei_uid170_lzCountVal_uid85_fpAddTest_s, redist0_rVStage_uid166_lzCountVal_uid85_fpAddTest_merged_bit_select_b_1_q, redist1_rVStage_uid166_lzCountVal_uid85_fpAddTest_merged_bit_select_c_1_q)
    BEGIN
        CASE (vStagei_uid170_lzCountVal_uid85_fpAddTest_s) IS
            WHEN "0" => vStagei_uid170_lzCountVal_uid85_fpAddTest_q <= redist0_rVStage_uid166_lzCountVal_uid85_fpAddTest_merged_bit_select_b_1_q;
            WHEN "1" => vStagei_uid170_lzCountVal_uid85_fpAddTest_q <= redist1_rVStage_uid166_lzCountVal_uid85_fpAddTest_merged_bit_select_c_1_q;
            WHEN OTHERS => vStagei_uid170_lzCountVal_uid85_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid172_lzCountVal_uid85_fpAddTest_merged_bit_select(BITSELECT,286)@3
    rVStage_uid172_lzCountVal_uid85_fpAddTest_merged_bit_select_b <= vStagei_uid170_lzCountVal_uid85_fpAddTest_q(3 downto 2);
    rVStage_uid172_lzCountVal_uid85_fpAddTest_merged_bit_select_c <= vStagei_uid170_lzCountVal_uid85_fpAddTest_q(1 downto 0);

    -- vCount_uid173_lzCountVal_uid85_fpAddTest(LOGICAL,172)@3
    vCount_uid173_lzCountVal_uid85_fpAddTest_q <= "1" WHEN rVStage_uid172_lzCountVal_uid85_fpAddTest_merged_bit_select_b = zs_uid171_lzCountVal_uid85_fpAddTest_q ELSE "0";

    -- vStagei_uid176_lzCountVal_uid85_fpAddTest(MUX,175)@3
    vStagei_uid176_lzCountVal_uid85_fpAddTest_s <= vCount_uid173_lzCountVal_uid85_fpAddTest_q;
    vStagei_uid176_lzCountVal_uid85_fpAddTest_combproc: PROCESS (vStagei_uid176_lzCountVal_uid85_fpAddTest_s, rVStage_uid172_lzCountVal_uid85_fpAddTest_merged_bit_select_b, rVStage_uid172_lzCountVal_uid85_fpAddTest_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid176_lzCountVal_uid85_fpAddTest_s) IS
            WHEN "0" => vStagei_uid176_lzCountVal_uid85_fpAddTest_q <= rVStage_uid172_lzCountVal_uid85_fpAddTest_merged_bit_select_b;
            WHEN "1" => vStagei_uid176_lzCountVal_uid85_fpAddTest_q <= rVStage_uid172_lzCountVal_uid85_fpAddTest_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid176_lzCountVal_uid85_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid178_lzCountVal_uid85_fpAddTest(BITSELECT,177)@3
    rVStage_uid178_lzCountVal_uid85_fpAddTest_b <= vStagei_uid176_lzCountVal_uid85_fpAddTest_q(1 downto 1);

    -- vCount_uid179_lzCountVal_uid85_fpAddTest(LOGICAL,178)@3
    vCount_uid179_lzCountVal_uid85_fpAddTest_q <= "1" WHEN rVStage_uid178_lzCountVal_uid85_fpAddTest_b = GND_q ELSE "0";

    -- r_uid180_lzCountVal_uid85_fpAddTest(BITJOIN,179)@3
    r_uid180_lzCountVal_uid85_fpAddTest_q <= redist5_vCount_uid153_lzCountVal_uid85_fpAddTest_q_1_q & redist3_vCount_uid161_lzCountVal_uid85_fpAddTest_q_1_q & vCount_uid167_lzCountVal_uid85_fpAddTest_q & vCount_uid173_lzCountVal_uid85_fpAddTest_q & vCount_uid179_lzCountVal_uid85_fpAddTest_q;

    -- aMinusA_uid87_fpAddTest(LOGICAL,86)@3
    aMinusA_uid87_fpAddTest_q <= "1" WHEN r_uid180_lzCountVal_uid85_fpAddTest_q = cAmA_uid86_fpAddTest_q ELSE "0";

    -- invAMinusA_uid130_fpAddTest(LOGICAL,129)@3
    invAMinusA_uid130_fpAddTest_q <= not (aMinusA_uid87_fpAddTest_q);

    -- redist16_sigA_uid50_fpAddTest_b_3(DELAY,307)
    redist16_sigA_uid50_fpAddTest_b_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist15_sigA_uid50_fpAddTest_b_1_q, xout => redist16_sigA_uid50_fpAddTest_b_3_q, clk => clk, aclr => areset );

    -- cstAllOWE_uid18_fpAddTest(CONSTANT,17)
    cstAllOWE_uid18_fpAddTest_q <= "11111111";

    -- expXIsMax_uid38_fpAddTest(LOGICAL,37)@0 + 1
    expXIsMax_uid38_fpAddTest_qi <= "1" WHEN exp_bSig_uid35_fpAddTest_b = cstAllOWE_uid18_fpAddTest_q ELSE "0";
    expXIsMax_uid38_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid38_fpAddTest_qi, xout => expXIsMax_uid38_fpAddTest_q, clk => clk, aclr => areset );

    -- redist21_expXIsMax_uid38_fpAddTest_q_3(DELAY,312)
    redist21_expXIsMax_uid38_fpAddTest_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid38_fpAddTest_q, xout => redist21_expXIsMax_uid38_fpAddTest_q_3_q, clk => clk, aclr => areset );

    -- invExpXIsMax_uid43_fpAddTest(LOGICAL,42)@3
    invExpXIsMax_uid43_fpAddTest_q <= not (redist21_expXIsMax_uid38_fpAddTest_q_3_q);

    -- redist17_InvExpXIsZero_uid44_fpAddTest_q_3(DELAY,308)
    redist17_InvExpXIsZero_uid44_fpAddTest_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => InvExpXIsZero_uid44_fpAddTest_q, xout => redist17_InvExpXIsZero_uid44_fpAddTest_q_3_q, clk => clk, aclr => areset );

    -- excR_bSig_uid45_fpAddTest(LOGICAL,44)@3
    excR_bSig_uid45_fpAddTest_q <= redist17_InvExpXIsZero_uid44_fpAddTest_q_3_q and invExpXIsMax_uid43_fpAddTest_q;

    -- redist28_exp_aSig_uid21_fpAddTest_b_3(DELAY,319)
    redist28_exp_aSig_uid21_fpAddTest_b_3 : dspba_delay
    GENERIC MAP ( width => 8, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => exp_aSig_uid21_fpAddTest_b, xout => redist28_exp_aSig_uid21_fpAddTest_b_3_q, clk => clk, aclr => areset );

    -- expXIsMax_uid24_fpAddTest(LOGICAL,23)@3
    expXIsMax_uid24_fpAddTest_q <= "1" WHEN redist28_exp_aSig_uid21_fpAddTest_b_3_q = cstAllOWE_uid18_fpAddTest_q ELSE "0";

    -- invExpXIsMax_uid29_fpAddTest(LOGICAL,28)@3
    invExpXIsMax_uid29_fpAddTest_q <= not (expXIsMax_uid24_fpAddTest_q);

    -- excZ_aSig_uid16_uid23_fpAddTest(LOGICAL,22)@3
    excZ_aSig_uid16_uid23_fpAddTest_q <= "1" WHEN redist28_exp_aSig_uid21_fpAddTest_b_3_q = cstAllZWE_uid20_fpAddTest_q ELSE "0";

    -- InvExpXIsZero_uid30_fpAddTest(LOGICAL,29)@3
    InvExpXIsZero_uid30_fpAddTest_q <= not (excZ_aSig_uid16_uid23_fpAddTest_q);

    -- excR_aSig_uid31_fpAddTest(LOGICAL,30)@3
    excR_aSig_uid31_fpAddTest_q <= InvExpXIsZero_uid30_fpAddTest_q and invExpXIsMax_uid29_fpAddTest_q;

    -- signRReg_uid131_fpAddTest(LOGICAL,130)@3
    signRReg_uid131_fpAddTest_q <= excR_aSig_uid31_fpAddTest_q and excR_bSig_uid45_fpAddTest_q and redist16_sigA_uid50_fpAddTest_b_3_q and invAMinusA_uid130_fpAddTest_q;

    -- redist14_sigB_uid51_fpAddTest_b_3(DELAY,305)
    redist14_sigB_uid51_fpAddTest_b_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist13_sigB_uid51_fpAddTest_b_1_q, xout => redist14_sigB_uid51_fpAddTest_b_3_q, clk => clk, aclr => areset );

    -- redist22_excZ_bSig_uid17_uid37_fpAddTest_q_3(DELAY,313)
    redist22_excZ_bSig_uid17_uid37_fpAddTest_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_bSig_uid17_uid37_fpAddTest_q, xout => redist22_excZ_bSig_uid17_uid37_fpAddTest_q_3_q, clk => clk, aclr => areset );

    -- excAZBZSigASigB_uid135_fpAddTest(LOGICAL,134)@3
    excAZBZSigASigB_uid135_fpAddTest_q <= excZ_aSig_uid16_uid23_fpAddTest_q and redist22_excZ_bSig_uid17_uid37_fpAddTest_q_3_q and redist16_sigA_uid50_fpAddTest_b_3_q and redist14_sigB_uid51_fpAddTest_b_3_q;

    -- excBZARSigA_uid136_fpAddTest(LOGICAL,135)@3
    excBZARSigA_uid136_fpAddTest_q <= redist22_excZ_bSig_uid17_uid37_fpAddTest_q_3_q and excR_aSig_uid31_fpAddTest_q and redist16_sigA_uid50_fpAddTest_b_3_q;

    -- signRZero_uid137_fpAddTest(LOGICAL,136)@3
    signRZero_uid137_fpAddTest_q <= excBZARSigA_uid136_fpAddTest_q or excAZBZSigASigB_uid135_fpAddTest_q;

    -- fracXIsZero_uid39_fpAddTest(LOGICAL,38)@0 + 1
    fracXIsZero_uid39_fpAddTest_qi <= "1" WHEN cstZeroWF_uid19_fpAddTest_q = frac_bSig_uid36_fpAddTest_b ELSE "0";
    fracXIsZero_uid39_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid39_fpAddTest_qi, xout => fracXIsZero_uid39_fpAddTest_q, clk => clk, aclr => areset );

    -- redist20_fracXIsZero_uid39_fpAddTest_q_3(DELAY,311)
    redist20_fracXIsZero_uid39_fpAddTest_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid39_fpAddTest_q, xout => redist20_fracXIsZero_uid39_fpAddTest_q_3_q, clk => clk, aclr => areset );

    -- excI_bSig_uid41_fpAddTest(LOGICAL,40)@3
    excI_bSig_uid41_fpAddTest_q <= redist21_expXIsMax_uid38_fpAddTest_q_3_q and redist20_fracXIsZero_uid39_fpAddTest_q_3_q;

    -- sigBBInf_uid132_fpAddTest(LOGICAL,131)@3
    sigBBInf_uid132_fpAddTest_q <= redist14_sigB_uid51_fpAddTest_b_3_q and excI_bSig_uid41_fpAddTest_q;

    -- fracXIsZero_uid25_fpAddTest(LOGICAL,24)@2 + 1
    fracXIsZero_uid25_fpAddTest_qi <= "1" WHEN cstZeroWF_uid19_fpAddTest_q = redist27_frac_aSig_uid22_fpAddTest_b_2_q ELSE "0";
    fracXIsZero_uid25_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid25_fpAddTest_qi, xout => fracXIsZero_uid25_fpAddTest_q, clk => clk, aclr => areset );

    -- excI_aSig_uid27_fpAddTest(LOGICAL,26)@3
    excI_aSig_uid27_fpAddTest_q <= expXIsMax_uid24_fpAddTest_q and fracXIsZero_uid25_fpAddTest_q;

    -- sigAAInf_uid133_fpAddTest(LOGICAL,132)@3
    sigAAInf_uid133_fpAddTest_q <= redist16_sigA_uid50_fpAddTest_b_3_q and excI_aSig_uid27_fpAddTest_q;

    -- signRInf_uid134_fpAddTest(LOGICAL,133)@3
    signRInf_uid134_fpAddTest_q <= sigAAInf_uid133_fpAddTest_q or sigBBInf_uid132_fpAddTest_q;

    -- signRInfRZRReg_uid138_fpAddTest(LOGICAL,137)@3 + 1
    signRInfRZRReg_uid138_fpAddTest_qi <= signRInf_uid134_fpAddTest_q or signRZero_uid137_fpAddTest_q or signRReg_uid131_fpAddTest_q;
    signRInfRZRReg_uid138_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signRInfRZRReg_uid138_fpAddTest_qi, xout => signRInfRZRReg_uid138_fpAddTest_q, clk => clk, aclr => areset );

    -- redist6_signRInfRZRReg_uid138_fpAddTest_q_2(DELAY,297)
    redist6_signRInfRZRReg_uid138_fpAddTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signRInfRZRReg_uid138_fpAddTest_q, xout => redist6_signRInfRZRReg_uid138_fpAddTest_q_2_q, clk => clk, aclr => areset );

    -- fracXIsNotZero_uid40_fpAddTest(LOGICAL,39)@3
    fracXIsNotZero_uid40_fpAddTest_q <= not (redist20_fracXIsZero_uid39_fpAddTest_q_3_q);

    -- excN_bSig_uid42_fpAddTest(LOGICAL,41)@3 + 1
    excN_bSig_uid42_fpAddTest_qi <= redist21_expXIsMax_uid38_fpAddTest_q_3_q and fracXIsNotZero_uid40_fpAddTest_q;
    excN_bSig_uid42_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_bSig_uid42_fpAddTest_qi, xout => excN_bSig_uid42_fpAddTest_q, clk => clk, aclr => areset );

    -- redist18_excN_bSig_uid42_fpAddTest_q_2(DELAY,309)
    redist18_excN_bSig_uid42_fpAddTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_bSig_uid42_fpAddTest_q, xout => redist18_excN_bSig_uid42_fpAddTest_q_2_q, clk => clk, aclr => areset );

    -- fracXIsNotZero_uid26_fpAddTest(LOGICAL,25)@3
    fracXIsNotZero_uid26_fpAddTest_q <= not (fracXIsZero_uid25_fpAddTest_q);

    -- excN_aSig_uid28_fpAddTest(LOGICAL,27)@3 + 1
    excN_aSig_uid28_fpAddTest_qi <= expXIsMax_uid24_fpAddTest_q and fracXIsNotZero_uid26_fpAddTest_q;
    excN_aSig_uid28_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_aSig_uid28_fpAddTest_qi, xout => excN_aSig_uid28_fpAddTest_q, clk => clk, aclr => areset );

    -- redist24_excN_aSig_uid28_fpAddTest_q_2(DELAY,315)
    redist24_excN_aSig_uid28_fpAddTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_aSig_uid28_fpAddTest_q, xout => redist24_excN_aSig_uid28_fpAddTest_q_2_q, clk => clk, aclr => areset );

    -- excRNaN2_uid125_fpAddTest(LOGICAL,124)@5
    excRNaN2_uid125_fpAddTest_q <= redist24_excN_aSig_uid28_fpAddTest_q_2_q or redist18_excN_bSig_uid42_fpAddTest_q_2_q;

    -- redist12_effSub_uid52_fpAddTest_q_4(DELAY,303)
    redist12_effSub_uid52_fpAddTest_q_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => effSub_uid52_fpAddTest_q, xout => redist12_effSub_uid52_fpAddTest_q_4_q, clk => clk, aclr => areset );

    -- redist19_excI_bSig_uid41_fpAddTest_q_2(DELAY,310)
    redist19_excI_bSig_uid41_fpAddTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_bSig_uid41_fpAddTest_q, xout => redist19_excI_bSig_uid41_fpAddTest_q_2_q, clk => clk, aclr => areset );

    -- redist25_excI_aSig_uid27_fpAddTest_q_2(DELAY,316)
    redist25_excI_aSig_uid27_fpAddTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_aSig_uid27_fpAddTest_q, xout => redist25_excI_aSig_uid27_fpAddTest_q_2_q, clk => clk, aclr => areset );

    -- excAIBISub_uid126_fpAddTest(LOGICAL,125)@5
    excAIBISub_uid126_fpAddTest_q <= redist25_excI_aSig_uid27_fpAddTest_q_2_q and redist19_excI_bSig_uid41_fpAddTest_q_2_q and redist12_effSub_uid52_fpAddTest_q_4_q;

    -- excRNaN_uid127_fpAddTest(LOGICAL,126)@5
    excRNaN_uid127_fpAddTest_q <= excAIBISub_uid126_fpAddTest_q or excRNaN2_uid125_fpAddTest_q;

    -- invExcRNaN_uid139_fpAddTest(LOGICAL,138)@5
    invExcRNaN_uid139_fpAddTest_q <= not (excRNaN_uid127_fpAddTest_q);

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- signRPostExc_uid140_fpAddTest(LOGICAL,139)@5
    signRPostExc_uid140_fpAddTest_q <= invExcRNaN_uid139_fpAddTest_q and redist6_signRInfRZRReg_uid138_fpAddTest_q_2_q;

    -- cRBit_uid99_fpAddTest(CONSTANT,98)
    cRBit_uid99_fpAddTest_q <= "01000";

    -- leftShiftStage1Idx3Rng3_uid263_fracPostNormExt_uid88_fpAddTest(BITSELECT,262)@3
    leftShiftStage1Idx3Rng3_uid263_fracPostNormExt_uid88_fpAddTest_in <= leftShiftStage0_uid255_fracPostNormExt_uid88_fpAddTest_mfinal_q(24 downto 0);
    leftShiftStage1Idx3Rng3_uid263_fracPostNormExt_uid88_fpAddTest_b <= leftShiftStage1Idx3Rng3_uid263_fracPostNormExt_uid88_fpAddTest_in(24 downto 0);

    -- leftShiftStage1Idx3_uid264_fracPostNormExt_uid88_fpAddTest(BITJOIN,263)@3
    leftShiftStage1Idx3_uid264_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage1Idx3Rng3_uid263_fracPostNormExt_uid88_fpAddTest_b & rightShiftStage1Idx3Pad3_uid214_alignmentShifter_uid64_fpAddTest_q;

    -- leftShiftStage1Idx2Rng2_uid260_fracPostNormExt_uid88_fpAddTest(BITSELECT,259)@3
    leftShiftStage1Idx2Rng2_uid260_fracPostNormExt_uid88_fpAddTest_in <= leftShiftStage0_uid255_fracPostNormExt_uid88_fpAddTest_mfinal_q(25 downto 0);
    leftShiftStage1Idx2Rng2_uid260_fracPostNormExt_uid88_fpAddTest_b <= leftShiftStage1Idx2Rng2_uid260_fracPostNormExt_uid88_fpAddTest_in(25 downto 0);

    -- leftShiftStage1Idx2_uid261_fracPostNormExt_uid88_fpAddTest(BITJOIN,260)@3
    leftShiftStage1Idx2_uid261_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage1Idx2Rng2_uid260_fracPostNormExt_uid88_fpAddTest_b & zs_uid171_lzCountVal_uid85_fpAddTest_q;

    -- leftShiftStage1Idx1Rng1_uid257_fracPostNormExt_uid88_fpAddTest(BITSELECT,256)@3
    leftShiftStage1Idx1Rng1_uid257_fracPostNormExt_uid88_fpAddTest_in <= leftShiftStage0_uid255_fracPostNormExt_uid88_fpAddTest_mfinal_q(26 downto 0);
    leftShiftStage1Idx1Rng1_uid257_fracPostNormExt_uid88_fpAddTest_b <= leftShiftStage1Idx1Rng1_uid257_fracPostNormExt_uid88_fpAddTest_in(26 downto 0);

    -- leftShiftStage1Idx1_uid258_fracPostNormExt_uid88_fpAddTest(BITJOIN,257)@3
    leftShiftStage1Idx1_uid258_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage1Idx1Rng1_uid257_fracPostNormExt_uid88_fpAddTest_b & GND_q;

    -- leftShiftStage0Idx7_uid253_fracPostNormExt_uid88_fpAddTest(CONSTANT,252)
    leftShiftStage0Idx7_uid253_fracPostNormExt_uid88_fpAddTest_q <= "0000000000000000000000000000";

    -- redist11_fracGRS_uid84_fpAddTest_q_1(DELAY,302)
    redist11_fracGRS_uid84_fpAddTest_q_1 : dspba_delay
    GENERIC MAP ( width => 28, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracGRS_uid84_fpAddTest_q, xout => redist11_fracGRS_uid84_fpAddTest_q_1_q, clk => clk, aclr => areset );

    -- leftShiftStage0Idx6Rng24_uid251_fracPostNormExt_uid88_fpAddTest(BITSELECT,250)@3
    leftShiftStage0Idx6Rng24_uid251_fracPostNormExt_uid88_fpAddTest_in <= redist11_fracGRS_uid84_fpAddTest_q_1_q(3 downto 0);
    leftShiftStage0Idx6Rng24_uid251_fracPostNormExt_uid88_fpAddTest_b <= leftShiftStage0Idx6Rng24_uid251_fracPostNormExt_uid88_fpAddTest_in(3 downto 0);

    -- leftShiftStage0Idx6_uid252_fracPostNormExt_uid88_fpAddTest(BITJOIN,251)@3
    leftShiftStage0Idx6_uid252_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage0Idx6Rng24_uid251_fracPostNormExt_uid88_fpAddTest_b & rightShiftStage0Idx3Pad24_uid193_alignmentShifter_uid64_fpAddTest_q;

    -- leftShiftStage0Idx5Rng20_uid248_fracPostNormExt_uid88_fpAddTest(BITSELECT,247)@3
    leftShiftStage0Idx5Rng20_uid248_fracPostNormExt_uid88_fpAddTest_in <= redist11_fracGRS_uid84_fpAddTest_q_1_q(7 downto 0);
    leftShiftStage0Idx5Rng20_uid248_fracPostNormExt_uid88_fpAddTest_b <= leftShiftStage0Idx5Rng20_uid248_fracPostNormExt_uid88_fpAddTest_in(7 downto 0);

    -- leftShiftStage0Idx5Pad20_uid247_fracPostNormExt_uid88_fpAddTest(CONSTANT,246)
    leftShiftStage0Idx5Pad20_uid247_fracPostNormExt_uid88_fpAddTest_q <= "00000000000000000000";

    -- leftShiftStage0Idx5_uid249_fracPostNormExt_uid88_fpAddTest(BITJOIN,248)@3
    leftShiftStage0Idx5_uid249_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage0Idx5Rng20_uid248_fracPostNormExt_uid88_fpAddTest_b & leftShiftStage0Idx5Pad20_uid247_fracPostNormExt_uid88_fpAddTest_q;

    -- redist4_vStage_uid155_lzCountVal_uid85_fpAddTest_b_1(DELAY,295)
    redist4_vStage_uid155_lzCountVal_uid85_fpAddTest_b_1 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vStage_uid155_lzCountVal_uid85_fpAddTest_b, xout => redist4_vStage_uid155_lzCountVal_uid85_fpAddTest_b_1_q, clk => clk, aclr => areset );

    -- leftShiftStage0Idx4_uid246_fracPostNormExt_uid88_fpAddTest(BITJOIN,245)@3
    leftShiftStage0Idx4_uid246_fracPostNormExt_uid88_fpAddTest_q <= redist4_vStage_uid155_lzCountVal_uid85_fpAddTest_b_1_q & zs_uid151_lzCountVal_uid85_fpAddTest_q;

    -- leftShiftStage0_uid255_fracPostNormExt_uid88_fpAddTest_msplit_1(MUX,280)@3
    leftShiftStage0_uid255_fracPostNormExt_uid88_fpAddTest_msplit_1_s <= leftShiftStage0_uid255_fracPostNormExt_uid88_fpAddTest_selLSBs_merged_bit_select_b;
    leftShiftStage0_uid255_fracPostNormExt_uid88_fpAddTest_msplit_1_combproc: PROCESS (leftShiftStage0_uid255_fracPostNormExt_uid88_fpAddTest_msplit_1_s, leftShiftStage0Idx4_uid246_fracPostNormExt_uid88_fpAddTest_q, leftShiftStage0Idx5_uid249_fracPostNormExt_uid88_fpAddTest_q, leftShiftStage0Idx6_uid252_fracPostNormExt_uid88_fpAddTest_q, leftShiftStage0Idx7_uid253_fracPostNormExt_uid88_fpAddTest_q)
    BEGIN
        CASE (leftShiftStage0_uid255_fracPostNormExt_uid88_fpAddTest_msplit_1_s) IS
            WHEN "00" => leftShiftStage0_uid255_fracPostNormExt_uid88_fpAddTest_msplit_1_q <= leftShiftStage0Idx4_uid246_fracPostNormExt_uid88_fpAddTest_q;
            WHEN "01" => leftShiftStage0_uid255_fracPostNormExt_uid88_fpAddTest_msplit_1_q <= leftShiftStage0Idx5_uid249_fracPostNormExt_uid88_fpAddTest_q;
            WHEN "10" => leftShiftStage0_uid255_fracPostNormExt_uid88_fpAddTest_msplit_1_q <= leftShiftStage0Idx6_uid252_fracPostNormExt_uid88_fpAddTest_q;
            WHEN "11" => leftShiftStage0_uid255_fracPostNormExt_uid88_fpAddTest_msplit_1_q <= leftShiftStage0Idx7_uid253_fracPostNormExt_uid88_fpAddTest_q;
            WHEN OTHERS => leftShiftStage0_uid255_fracPostNormExt_uid88_fpAddTest_msplit_1_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage0Idx3Rng12_uid242_fracPostNormExt_uid88_fpAddTest(BITSELECT,241)@3
    leftShiftStage0Idx3Rng12_uid242_fracPostNormExt_uid88_fpAddTest_in <= redist11_fracGRS_uid84_fpAddTest_q_1_q(15 downto 0);
    leftShiftStage0Idx3Rng12_uid242_fracPostNormExt_uid88_fpAddTest_b <= leftShiftStage0Idx3Rng12_uid242_fracPostNormExt_uid88_fpAddTest_in(15 downto 0);

    -- leftShiftStage0Idx3Pad12_uid241_fracPostNormExt_uid88_fpAddTest(CONSTANT,240)
    leftShiftStage0Idx3Pad12_uid241_fracPostNormExt_uid88_fpAddTest_q <= "000000000000";

    -- leftShiftStage0Idx3_uid243_fracPostNormExt_uid88_fpAddTest(BITJOIN,242)@3
    leftShiftStage0Idx3_uid243_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage0Idx3Rng12_uid242_fracPostNormExt_uid88_fpAddTest_b & leftShiftStage0Idx3Pad12_uid241_fracPostNormExt_uid88_fpAddTest_q;

    -- leftShiftStage0Idx2Rng8_uid239_fracPostNormExt_uid88_fpAddTest(BITSELECT,238)@3
    leftShiftStage0Idx2Rng8_uid239_fracPostNormExt_uid88_fpAddTest_in <= redist11_fracGRS_uid84_fpAddTest_q_1_q(19 downto 0);
    leftShiftStage0Idx2Rng8_uid239_fracPostNormExt_uid88_fpAddTest_b <= leftShiftStage0Idx2Rng8_uid239_fracPostNormExt_uid88_fpAddTest_in(19 downto 0);

    -- leftShiftStage0Idx2_uid240_fracPostNormExt_uid88_fpAddTest(BITJOIN,239)@3
    leftShiftStage0Idx2_uid240_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage0Idx2Rng8_uid239_fracPostNormExt_uid88_fpAddTest_b & cstAllZWE_uid20_fpAddTest_q;

    -- leftShiftStage0Idx1Rng4_uid236_fracPostNormExt_uid88_fpAddTest(BITSELECT,235)@3
    leftShiftStage0Idx1Rng4_uid236_fracPostNormExt_uid88_fpAddTest_in <= redist11_fracGRS_uid84_fpAddTest_q_1_q(23 downto 0);
    leftShiftStage0Idx1Rng4_uid236_fracPostNormExt_uid88_fpAddTest_b <= leftShiftStage0Idx1Rng4_uid236_fracPostNormExt_uid88_fpAddTest_in(23 downto 0);

    -- leftShiftStage0Idx1_uid237_fracPostNormExt_uid88_fpAddTest(BITJOIN,236)@3
    leftShiftStage0Idx1_uid237_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage0Idx1Rng4_uid236_fracPostNormExt_uid88_fpAddTest_b & zs_uid165_lzCountVal_uid85_fpAddTest_q;

    -- leftShiftStage0_uid255_fracPostNormExt_uid88_fpAddTest_msplit_0(MUX,279)@3
    leftShiftStage0_uid255_fracPostNormExt_uid88_fpAddTest_msplit_0_s <= leftShiftStage0_uid255_fracPostNormExt_uid88_fpAddTest_selLSBs_merged_bit_select_b;
    leftShiftStage0_uid255_fracPostNormExt_uid88_fpAddTest_msplit_0_combproc: PROCESS (leftShiftStage0_uid255_fracPostNormExt_uid88_fpAddTest_msplit_0_s, redist11_fracGRS_uid84_fpAddTest_q_1_q, leftShiftStage0Idx1_uid237_fracPostNormExt_uid88_fpAddTest_q, leftShiftStage0Idx2_uid240_fracPostNormExt_uid88_fpAddTest_q, leftShiftStage0Idx3_uid243_fracPostNormExt_uid88_fpAddTest_q)
    BEGIN
        CASE (leftShiftStage0_uid255_fracPostNormExt_uid88_fpAddTest_msplit_0_s) IS
            WHEN "00" => leftShiftStage0_uid255_fracPostNormExt_uid88_fpAddTest_msplit_0_q <= redist11_fracGRS_uid84_fpAddTest_q_1_q;
            WHEN "01" => leftShiftStage0_uid255_fracPostNormExt_uid88_fpAddTest_msplit_0_q <= leftShiftStage0Idx1_uid237_fracPostNormExt_uid88_fpAddTest_q;
            WHEN "10" => leftShiftStage0_uid255_fracPostNormExt_uid88_fpAddTest_msplit_0_q <= leftShiftStage0Idx2_uid240_fracPostNormExt_uid88_fpAddTest_q;
            WHEN "11" => leftShiftStage0_uid255_fracPostNormExt_uid88_fpAddTest_msplit_0_q <= leftShiftStage0Idx3_uid243_fracPostNormExt_uid88_fpAddTest_q;
            WHEN OTHERS => leftShiftStage0_uid255_fracPostNormExt_uid88_fpAddTest_msplit_0_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage0_uid255_fracPostNormExt_uid88_fpAddTest_selLSBs_merged_bit_select(BITSELECT,290)@3
    leftShiftStage0_uid255_fracPostNormExt_uid88_fpAddTest_selLSBs_merged_bit_select_b <= leftShiftStageSel4Dto2_uid254_fracPostNormExt_uid88_fpAddTest_merged_bit_select_b(1 downto 0);
    leftShiftStage0_uid255_fracPostNormExt_uid88_fpAddTest_selLSBs_merged_bit_select_c <= leftShiftStageSel4Dto2_uid254_fracPostNormExt_uid88_fpAddTest_merged_bit_select_b(2 downto 2);

    -- leftShiftStage0_uid255_fracPostNormExt_uid88_fpAddTest_mfinal(MUX,281)@3
    leftShiftStage0_uid255_fracPostNormExt_uid88_fpAddTest_mfinal_s <= leftShiftStage0_uid255_fracPostNormExt_uid88_fpAddTest_selLSBs_merged_bit_select_c;
    leftShiftStage0_uid255_fracPostNormExt_uid88_fpAddTest_mfinal_combproc: PROCESS (leftShiftStage0_uid255_fracPostNormExt_uid88_fpAddTest_mfinal_s, leftShiftStage0_uid255_fracPostNormExt_uid88_fpAddTest_msplit_0_q, leftShiftStage0_uid255_fracPostNormExt_uid88_fpAddTest_msplit_1_q)
    BEGIN
        CASE (leftShiftStage0_uid255_fracPostNormExt_uid88_fpAddTest_mfinal_s) IS
            WHEN "0" => leftShiftStage0_uid255_fracPostNormExt_uid88_fpAddTest_mfinal_q <= leftShiftStage0_uid255_fracPostNormExt_uid88_fpAddTest_msplit_0_q;
            WHEN "1" => leftShiftStage0_uid255_fracPostNormExt_uid88_fpAddTest_mfinal_q <= leftShiftStage0_uid255_fracPostNormExt_uid88_fpAddTest_msplit_1_q;
            WHEN OTHERS => leftShiftStage0_uid255_fracPostNormExt_uid88_fpAddTest_mfinal_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStageSel4Dto2_uid254_fracPostNormExt_uid88_fpAddTest_merged_bit_select(BITSELECT,287)@3
    leftShiftStageSel4Dto2_uid254_fracPostNormExt_uid88_fpAddTest_merged_bit_select_b <= r_uid180_lzCountVal_uid85_fpAddTest_q(4 downto 2);
    leftShiftStageSel4Dto2_uid254_fracPostNormExt_uid88_fpAddTest_merged_bit_select_c <= r_uid180_lzCountVal_uid85_fpAddTest_q(1 downto 0);

    -- leftShiftStage1_uid266_fracPostNormExt_uid88_fpAddTest(MUX,265)@3
    leftShiftStage1_uid266_fracPostNormExt_uid88_fpAddTest_s <= leftShiftStageSel4Dto2_uid254_fracPostNormExt_uid88_fpAddTest_merged_bit_select_c;
    leftShiftStage1_uid266_fracPostNormExt_uid88_fpAddTest_combproc: PROCESS (leftShiftStage1_uid266_fracPostNormExt_uid88_fpAddTest_s, leftShiftStage0_uid255_fracPostNormExt_uid88_fpAddTest_mfinal_q, leftShiftStage1Idx1_uid258_fracPostNormExt_uid88_fpAddTest_q, leftShiftStage1Idx2_uid261_fracPostNormExt_uid88_fpAddTest_q, leftShiftStage1Idx3_uid264_fracPostNormExt_uid88_fpAddTest_q)
    BEGIN
        CASE (leftShiftStage1_uid266_fracPostNormExt_uid88_fpAddTest_s) IS
            WHEN "00" => leftShiftStage1_uid266_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage0_uid255_fracPostNormExt_uid88_fpAddTest_mfinal_q;
            WHEN "01" => leftShiftStage1_uid266_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage1Idx1_uid258_fracPostNormExt_uid88_fpAddTest_q;
            WHEN "10" => leftShiftStage1_uid266_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage1Idx2_uid261_fracPostNormExt_uid88_fpAddTest_q;
            WHEN "11" => leftShiftStage1_uid266_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage1Idx3_uid264_fracPostNormExt_uid88_fpAddTest_q;
            WHEN OTHERS => leftShiftStage1_uid266_fracPostNormExt_uid88_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- LSB_uid97_fpAddTest(BITSELECT,96)@3
    LSB_uid97_fpAddTest_in <= STD_LOGIC_VECTOR(leftShiftStage1_uid266_fracPostNormExt_uid88_fpAddTest_q(4 downto 0));
    LSB_uid97_fpAddTest_b <= STD_LOGIC_VECTOR(LSB_uid97_fpAddTest_in(4 downto 4));

    -- Guard_uid96_fpAddTest(BITSELECT,95)@3
    Guard_uid96_fpAddTest_in <= STD_LOGIC_VECTOR(leftShiftStage1_uid266_fracPostNormExt_uid88_fpAddTest_q(3 downto 0));
    Guard_uid96_fpAddTest_b <= STD_LOGIC_VECTOR(Guard_uid96_fpAddTest_in(3 downto 3));

    -- Round_uid95_fpAddTest(BITSELECT,94)@3
    Round_uid95_fpAddTest_in <= STD_LOGIC_VECTOR(leftShiftStage1_uid266_fracPostNormExt_uid88_fpAddTest_q(2 downto 0));
    Round_uid95_fpAddTest_b <= STD_LOGIC_VECTOR(Round_uid95_fpAddTest_in(2 downto 2));

    -- Sticky1_uid94_fpAddTest(BITSELECT,93)@3
    Sticky1_uid94_fpAddTest_in <= STD_LOGIC_VECTOR(leftShiftStage1_uid266_fracPostNormExt_uid88_fpAddTest_q(1 downto 0));
    Sticky1_uid94_fpAddTest_b <= STD_LOGIC_VECTOR(Sticky1_uid94_fpAddTest_in(1 downto 1));

    -- Sticky0_uid93_fpAddTest(BITSELECT,92)@3
    Sticky0_uid93_fpAddTest_in <= STD_LOGIC_VECTOR(leftShiftStage1_uid266_fracPostNormExt_uid88_fpAddTest_q(0 downto 0));
    Sticky0_uid93_fpAddTest_b <= STD_LOGIC_VECTOR(Sticky0_uid93_fpAddTest_in(0 downto 0));

    -- rndBitCond_uid98_fpAddTest(BITJOIN,97)@3
    rndBitCond_uid98_fpAddTest_q <= LSB_uid97_fpAddTest_b & Guard_uid96_fpAddTest_b & Round_uid95_fpAddTest_b & Sticky1_uid94_fpAddTest_b & Sticky0_uid93_fpAddTest_b;

    -- rBi_uid100_fpAddTest(LOGICAL,99)@3 + 1
    rBi_uid100_fpAddTest_qi <= "1" WHEN rndBitCond_uid98_fpAddTest_q = cRBit_uid99_fpAddTest_q ELSE "0";
    rBi_uid100_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rBi_uid100_fpAddTest_qi, xout => rBi_uid100_fpAddTest_q, clk => clk, aclr => areset );

    -- roundBit_uid101_fpAddTest(LOGICAL,100)@4
    roundBit_uid101_fpAddTest_q <= not (rBi_uid100_fpAddTest_q);

    -- oneCST_uid90_fpAddTest(CONSTANT,89)
    oneCST_uid90_fpAddTest_q <= "00000001";

    -- expInc_uid91_fpAddTest(ADD,90)@3
    expInc_uid91_fpAddTest_a <= STD_LOGIC_VECTOR("0" & redist28_exp_aSig_uid21_fpAddTest_b_3_q);
    expInc_uid91_fpAddTest_b <= STD_LOGIC_VECTOR("0" & oneCST_uid90_fpAddTest_q);
    expInc_uid91_fpAddTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expInc_uid91_fpAddTest_a) + UNSIGNED(expInc_uid91_fpAddTest_b));
    expInc_uid91_fpAddTest_q <= expInc_uid91_fpAddTest_o(8 downto 0);

    -- expPostNorm_uid92_fpAddTest(SUB,91)@3 + 1
    expPostNorm_uid92_fpAddTest_a <= STD_LOGIC_VECTOR("0" & expInc_uid91_fpAddTest_q);
    expPostNorm_uid92_fpAddTest_b <= STD_LOGIC_VECTOR("00000" & r_uid180_lzCountVal_uid85_fpAddTest_q);
    expPostNorm_uid92_fpAddTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expPostNorm_uid92_fpAddTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expPostNorm_uid92_fpAddTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expPostNorm_uid92_fpAddTest_a) - UNSIGNED(expPostNorm_uid92_fpAddTest_b));
        END IF;
    END PROCESS;
    expPostNorm_uid92_fpAddTest_q <= expPostNorm_uid92_fpAddTest_o(9 downto 0);

    -- fracPostNorm_uid89_fpAddTest(BITSELECT,88)@3
    fracPostNorm_uid89_fpAddTest_b <= leftShiftStage1_uid266_fracPostNormExt_uid88_fpAddTest_q(27 downto 1);

    -- fracPostNormRndRange_uid102_fpAddTest(BITSELECT,101)@3
    fracPostNormRndRange_uid102_fpAddTest_in <= fracPostNorm_uid89_fpAddTest_b(25 downto 0);
    fracPostNormRndRange_uid102_fpAddTest_b <= fracPostNormRndRange_uid102_fpAddTest_in(25 downto 2);

    -- redist9_fracPostNormRndRange_uid102_fpAddTest_b_1(DELAY,300)
    redist9_fracPostNormRndRange_uid102_fpAddTest_b_1 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracPostNormRndRange_uid102_fpAddTest_b, xout => redist9_fracPostNormRndRange_uid102_fpAddTest_b_1_q, clk => clk, aclr => areset );

    -- expFracR_uid103_fpAddTest(BITJOIN,102)@4
    expFracR_uid103_fpAddTest_q <= expPostNorm_uid92_fpAddTest_q & redist9_fracPostNormRndRange_uid102_fpAddTest_b_1_q;

    -- rndExpFrac_uid104_fpAddTest(ADD,103)@4
    rndExpFrac_uid104_fpAddTest_a <= STD_LOGIC_VECTOR("0" & expFracR_uid103_fpAddTest_q);
    rndExpFrac_uid104_fpAddTest_b <= STD_LOGIC_VECTOR("0000000000000000000000000000000000" & roundBit_uid101_fpAddTest_q);
    rndExpFrac_uid104_fpAddTest_o <= STD_LOGIC_VECTOR(UNSIGNED(rndExpFrac_uid104_fpAddTest_a) + UNSIGNED(rndExpFrac_uid104_fpAddTest_b));
    rndExpFrac_uid104_fpAddTest_q <= rndExpFrac_uid104_fpAddTest_o(34 downto 0);

    -- expRPreExc_uid118_fpAddTest(BITSELECT,117)@4
    expRPreExc_uid118_fpAddTest_in <= rndExpFrac_uid104_fpAddTest_q(31 downto 0);
    expRPreExc_uid118_fpAddTest_b <= expRPreExc_uid118_fpAddTest_in(31 downto 24);

    -- redist7_expRPreExc_uid118_fpAddTest_b_1(DELAY,298)
    redist7_expRPreExc_uid118_fpAddTest_b_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expRPreExc_uid118_fpAddTest_b, xout => redist7_expRPreExc_uid118_fpAddTest_b_1_q, clk => clk, aclr => areset );

    -- rndExpFracOvfBits_uid109_fpAddTest(BITSELECT,108)@4
    rndExpFracOvfBits_uid109_fpAddTest_in <= rndExpFrac_uid104_fpAddTest_q(33 downto 0);
    rndExpFracOvfBits_uid109_fpAddTest_b <= rndExpFracOvfBits_uid109_fpAddTest_in(33 downto 32);

    -- rOvfExtraBits_uid110_fpAddTest(COMPARE,109)@4
    rOvfExtraBits_uid110_fpAddTest_a <= STD_LOGIC_VECTOR("00" & rndExpFracOvfBits_uid109_fpAddTest_b);
    rOvfExtraBits_uid110_fpAddTest_b <= STD_LOGIC_VECTOR("00" & zocst_uid76_fpAddTest_q);
    rOvfExtraBits_uid110_fpAddTest_o <= STD_LOGIC_VECTOR(UNSIGNED(rOvfExtraBits_uid110_fpAddTest_a) - UNSIGNED(rOvfExtraBits_uid110_fpAddTest_b));
    rOvfExtraBits_uid110_fpAddTest_n(0) <= not (rOvfExtraBits_uid110_fpAddTest_o(3));

    -- wEP2AllOwE_uid105_fpAddTest(CONSTANT,104)
    wEP2AllOwE_uid105_fpAddTest_q <= "0011111111";

    -- rndExp_uid106_fpAddTest(BITSELECT,105)@4
    rndExp_uid106_fpAddTest_in <= rndExpFrac_uid104_fpAddTest_q(33 downto 0);
    rndExp_uid106_fpAddTest_b <= rndExp_uid106_fpAddTest_in(33 downto 24);

    -- rOvfEQMax_uid107_fpAddTest(LOGICAL,106)@4
    rOvfEQMax_uid107_fpAddTest_q <= "1" WHEN rndExp_uid106_fpAddTest_b = wEP2AllOwE_uid105_fpAddTest_q ELSE "0";

    -- rOvf_uid111_fpAddTest(LOGICAL,110)@4
    rOvf_uid111_fpAddTest_q <= rOvfEQMax_uid107_fpAddTest_q or rOvfExtraBits_uid110_fpAddTest_n;

    -- regInputs_uid119_fpAddTest(LOGICAL,118)@3 + 1
    regInputs_uid119_fpAddTest_qi <= excR_aSig_uid31_fpAddTest_q and excR_bSig_uid45_fpAddTest_q;
    regInputs_uid119_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => regInputs_uid119_fpAddTest_qi, xout => regInputs_uid119_fpAddTest_q, clk => clk, aclr => areset );

    -- rInfOvf_uid122_fpAddTest(LOGICAL,121)@4 + 1
    rInfOvf_uid122_fpAddTest_qi <= regInputs_uid119_fpAddTest_q and rOvf_uid111_fpAddTest_q;
    rInfOvf_uid122_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rInfOvf_uid122_fpAddTest_qi, xout => rInfOvf_uid122_fpAddTest_q, clk => clk, aclr => areset );

    -- excRInfVInC_uid123_fpAddTest(BITJOIN,122)@5
    excRInfVInC_uid123_fpAddTest_q <= rInfOvf_uid122_fpAddTest_q & redist18_excN_bSig_uid42_fpAddTest_q_2_q & redist24_excN_aSig_uid28_fpAddTest_q_2_q & redist19_excI_bSig_uid41_fpAddTest_q_2_q & redist25_excI_aSig_uid27_fpAddTest_q_2_q & redist12_effSub_uid52_fpAddTest_q_4_q;

    -- excRInf_uid124_fpAddTest(LOOKUP,123)@5
    excRInf_uid124_fpAddTest_combproc: PROCESS (excRInfVInC_uid123_fpAddTest_q)
    BEGIN
        -- Begin reserved scope level
        CASE (excRInfVInC_uid123_fpAddTest_q) IS
            WHEN "000000" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "000001" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "000010" => excRInf_uid124_fpAddTest_q <= "1";
            WHEN "000011" => excRInf_uid124_fpAddTest_q <= "1";
            WHEN "000100" => excRInf_uid124_fpAddTest_q <= "1";
            WHEN "000101" => excRInf_uid124_fpAddTest_q <= "1";
            WHEN "000110" => excRInf_uid124_fpAddTest_q <= "1";
            WHEN "000111" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "001000" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "001001" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "001010" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "001011" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "001100" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "001101" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "001110" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "001111" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "010000" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "010001" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "010010" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "010011" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "010100" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "010101" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "010110" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "010111" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "011000" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "011001" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "011010" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "011011" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "011100" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "011101" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "011110" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "011111" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "100000" => excRInf_uid124_fpAddTest_q <= "1";
            WHEN "100001" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "100010" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "100011" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "100100" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "100101" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "100110" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "100111" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "101000" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "101001" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "101010" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "101011" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "101100" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "101101" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "101110" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "101111" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "110000" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "110001" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "110010" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "110011" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "110100" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "110101" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "110110" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "110111" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "111000" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "111001" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "111010" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "111011" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "111100" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "111101" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "111110" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "111111" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN OTHERS => -- unreachable
                           excRInf_uid124_fpAddTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- redist10_aMinusA_uid87_fpAddTest_q_1(DELAY,301)
    redist10_aMinusA_uid87_fpAddTest_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aMinusA_uid87_fpAddTest_q, xout => redist10_aMinusA_uid87_fpAddTest_q_1_q, clk => clk, aclr => areset );

    -- rUdfExtraBit_uid115_fpAddTest(BITSELECT,114)@4
    rUdfExtraBit_uid115_fpAddTest_in <= STD_LOGIC_VECTOR(rndExpFrac_uid104_fpAddTest_q(33 downto 0));
    rUdfExtraBit_uid115_fpAddTest_b <= STD_LOGIC_VECTOR(rUdfExtraBit_uid115_fpAddTest_in(33 downto 33));

    -- wEP2AllZ_uid112_fpAddTest(CONSTANT,111)
    wEP2AllZ_uid112_fpAddTest_q <= "0000000000";

    -- rUdfEQMin_uid114_fpAddTest(LOGICAL,113)@4
    rUdfEQMin_uid114_fpAddTest_q <= "1" WHEN rndExp_uid106_fpAddTest_b = wEP2AllZ_uid112_fpAddTest_q ELSE "0";

    -- rUdf_uid116_fpAddTest(LOGICAL,115)@4
    rUdf_uid116_fpAddTest_q <= rUdfEQMin_uid114_fpAddTest_q or rUdfExtraBit_uid115_fpAddTest_b;

    -- redist23_excZ_bSig_uid17_uid37_fpAddTest_q_4(DELAY,314)
    redist23_excZ_bSig_uid17_uid37_fpAddTest_q_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist22_excZ_bSig_uid17_uid37_fpAddTest_q_3_q, xout => redist23_excZ_bSig_uid17_uid37_fpAddTest_q_4_q, clk => clk, aclr => areset );

    -- redist26_excZ_aSig_uid16_uid23_fpAddTest_q_1(DELAY,317)
    redist26_excZ_aSig_uid16_uid23_fpAddTest_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_aSig_uid16_uid23_fpAddTest_q, xout => redist26_excZ_aSig_uid16_uid23_fpAddTest_q_1_q, clk => clk, aclr => areset );

    -- excRZeroVInC_uid120_fpAddTest(BITJOIN,119)@4
    excRZeroVInC_uid120_fpAddTest_q <= redist10_aMinusA_uid87_fpAddTest_q_1_q & rUdf_uid116_fpAddTest_q & regInputs_uid119_fpAddTest_q & redist23_excZ_bSig_uid17_uid37_fpAddTest_q_4_q & redist26_excZ_aSig_uid16_uid23_fpAddTest_q_1_q;

    -- excRZero_uid121_fpAddTest(LOOKUP,120)@4 + 1
    excRZero_uid121_fpAddTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            excRZero_uid121_fpAddTest_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (excRZeroVInC_uid120_fpAddTest_q) IS
                WHEN "00000" => excRZero_uid121_fpAddTest_q <= "0";
                WHEN "00001" => excRZero_uid121_fpAddTest_q <= "0";
                WHEN "00010" => excRZero_uid121_fpAddTest_q <= "0";
                WHEN "00011" => excRZero_uid121_fpAddTest_q <= "1";
                WHEN "00100" => excRZero_uid121_fpAddTest_q <= "0";
                WHEN "00101" => excRZero_uid121_fpAddTest_q <= "0";
                WHEN "00110" => excRZero_uid121_fpAddTest_q <= "0";
                WHEN "00111" => excRZero_uid121_fpAddTest_q <= "0";
                WHEN "01000" => excRZero_uid121_fpAddTest_q <= "0";
                WHEN "01001" => excRZero_uid121_fpAddTest_q <= "0";
                WHEN "01010" => excRZero_uid121_fpAddTest_q <= "0";
                WHEN "01011" => excRZero_uid121_fpAddTest_q <= "1";
                WHEN "01100" => excRZero_uid121_fpAddTest_q <= "1";
                WHEN "01101" => excRZero_uid121_fpAddTest_q <= "0";
                WHEN "01110" => excRZero_uid121_fpAddTest_q <= "0";
                WHEN "01111" => excRZero_uid121_fpAddTest_q <= "0";
                WHEN "10000" => excRZero_uid121_fpAddTest_q <= "0";
                WHEN "10001" => excRZero_uid121_fpAddTest_q <= "0";
                WHEN "10010" => excRZero_uid121_fpAddTest_q <= "0";
                WHEN "10011" => excRZero_uid121_fpAddTest_q <= "1";
                WHEN "10100" => excRZero_uid121_fpAddTest_q <= "1";
                WHEN "10101" => excRZero_uid121_fpAddTest_q <= "0";
                WHEN "10110" => excRZero_uid121_fpAddTest_q <= "0";
                WHEN "10111" => excRZero_uid121_fpAddTest_q <= "0";
                WHEN "11000" => excRZero_uid121_fpAddTest_q <= "0";
                WHEN "11001" => excRZero_uid121_fpAddTest_q <= "0";
                WHEN "11010" => excRZero_uid121_fpAddTest_q <= "0";
                WHEN "11011" => excRZero_uid121_fpAddTest_q <= "1";
                WHEN "11100" => excRZero_uid121_fpAddTest_q <= "1";
                WHEN "11101" => excRZero_uid121_fpAddTest_q <= "0";
                WHEN "11110" => excRZero_uid121_fpAddTest_q <= "0";
                WHEN "11111" => excRZero_uid121_fpAddTest_q <= "0";
                WHEN OTHERS => -- unreachable
                               excRZero_uid121_fpAddTest_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- concExc_uid128_fpAddTest(BITJOIN,127)@5
    concExc_uid128_fpAddTest_q <= excRNaN_uid127_fpAddTest_q & excRInf_uid124_fpAddTest_q & excRZero_uid121_fpAddTest_q;

    -- excREnc_uid129_fpAddTest(LOOKUP,128)@5
    excREnc_uid129_fpAddTest_combproc: PROCESS (concExc_uid128_fpAddTest_q)
    BEGIN
        -- Begin reserved scope level
        CASE (concExc_uid128_fpAddTest_q) IS
            WHEN "000" => excREnc_uid129_fpAddTest_q <= "01";
            WHEN "001" => excREnc_uid129_fpAddTest_q <= "00";
            WHEN "010" => excREnc_uid129_fpAddTest_q <= "10";
            WHEN "011" => excREnc_uid129_fpAddTest_q <= "10";
            WHEN "100" => excREnc_uid129_fpAddTest_q <= "11";
            WHEN "101" => excREnc_uid129_fpAddTest_q <= "11";
            WHEN "110" => excREnc_uid129_fpAddTest_q <= "11";
            WHEN "111" => excREnc_uid129_fpAddTest_q <= "11";
            WHEN OTHERS => -- unreachable
                           excREnc_uid129_fpAddTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- expRPostExc_uid148_fpAddTest(MUX,147)@5
    expRPostExc_uid148_fpAddTest_s <= excREnc_uid129_fpAddTest_q;
    expRPostExc_uid148_fpAddTest_combproc: PROCESS (expRPostExc_uid148_fpAddTest_s, cstAllZWE_uid20_fpAddTest_q, redist7_expRPreExc_uid118_fpAddTest_b_1_q, cstAllOWE_uid18_fpAddTest_q)
    BEGIN
        CASE (expRPostExc_uid148_fpAddTest_s) IS
            WHEN "00" => expRPostExc_uid148_fpAddTest_q <= cstAllZWE_uid20_fpAddTest_q;
            WHEN "01" => expRPostExc_uid148_fpAddTest_q <= redist7_expRPreExc_uid118_fpAddTest_b_1_q;
            WHEN "10" => expRPostExc_uid148_fpAddTest_q <= cstAllOWE_uid18_fpAddTest_q;
            WHEN "11" => expRPostExc_uid148_fpAddTest_q <= cstAllOWE_uid18_fpAddTest_q;
            WHEN OTHERS => expRPostExc_uid148_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oneFracRPostExc2_uid141_fpAddTest(CONSTANT,140)
    oneFracRPostExc2_uid141_fpAddTest_q <= "00000000000000000000001";

    -- fracRPreExc_uid117_fpAddTest(BITSELECT,116)@4
    fracRPreExc_uid117_fpAddTest_in <= rndExpFrac_uid104_fpAddTest_q(23 downto 0);
    fracRPreExc_uid117_fpAddTest_b <= fracRPreExc_uid117_fpAddTest_in(23 downto 1);

    -- redist8_fracRPreExc_uid117_fpAddTest_b_1(DELAY,299)
    redist8_fracRPreExc_uid117_fpAddTest_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRPreExc_uid117_fpAddTest_b, xout => redist8_fracRPreExc_uid117_fpAddTest_b_1_q, clk => clk, aclr => areset );

    -- fracRPostExc_uid144_fpAddTest(MUX,143)@5
    fracRPostExc_uid144_fpAddTest_s <= excREnc_uid129_fpAddTest_q;
    fracRPostExc_uid144_fpAddTest_combproc: PROCESS (fracRPostExc_uid144_fpAddTest_s, cstZeroWF_uid19_fpAddTest_q, redist8_fracRPreExc_uid117_fpAddTest_b_1_q, oneFracRPostExc2_uid141_fpAddTest_q)
    BEGIN
        CASE (fracRPostExc_uid144_fpAddTest_s) IS
            WHEN "00" => fracRPostExc_uid144_fpAddTest_q <= cstZeroWF_uid19_fpAddTest_q;
            WHEN "01" => fracRPostExc_uid144_fpAddTest_q <= redist8_fracRPreExc_uid117_fpAddTest_b_1_q;
            WHEN "10" => fracRPostExc_uid144_fpAddTest_q <= cstZeroWF_uid19_fpAddTest_q;
            WHEN "11" => fracRPostExc_uid144_fpAddTest_q <= oneFracRPostExc2_uid141_fpAddTest_q;
            WHEN OTHERS => fracRPostExc_uid144_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- R_uid149_fpAddTest(BITJOIN,148)@5
    R_uid149_fpAddTest_q <= signRPostExc_uid140_fpAddTest_q & expRPostExc_uid148_fpAddTest_q & fracRPostExc_uid144_fpAddTest_q;

    -- xOut(GPOUT,4)@5
    q <= R_uid149_fpAddTest_q;

END normal;
