wvConvertFile -win $_nWave1 -o \
           "/home/ldap-users/siang/Desktop/NWC_verilog/N26094891/build/MEM_tb.vcd.fsdb" \
           "/home/ldap-users/siang/Desktop/NWC_verilog/N26094891/build/MEM_tb.vcd"
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/ldap-users/siang/Desktop/NWC_verilog/N26094891/build/MEM_tb.vcd.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/ModAdd"
wvGetSignalSetScope -win $_nWave1 "/Testbench/mem"
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Testbench/mem/data_in\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSetPosition -win $_nWave1 {("G1" 1)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 63686111.111111 -snap {("G2" 0)}
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoom -win $_nWave1 946407407.407407 1029638888.888889
wvZoom -win $_nWave1 981022969.535887 986931377.171918
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoom -win $_nWave1 945472222.222222 1006259259.259259
wvZoom -win $_nWave1 982619855.967056 986372142.203910
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 0)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/ModAdd"
wvGetSignalSetScope -win $_nWave1 "/Testbench"
wvGetSignalSetScope -win $_nWave1 "/Testbench/mem"
wvGetSignalSetScope -win $_nWave1 "/Testbench"
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Testbench/data_in\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSetPosition -win $_nWave1 {("G1" 1)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetCursor -win $_nWave1 1638729.946033 -snap {("G2" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvConvertFile -win $_nWave1 -o \
           "/home/ldap-users/siang/Desktop/NWC_verilog/N26094891/build/MEM_tb.vcd.fsdb" \
           "/home/ldap-users/siang/Desktop/NWC_verilog/N26094891/build/MEM_tb.vcd"
wvOpenFile -win $_nWave1 \
           {/home/ldap-users/siang/Desktop/NWC_verilog/N26094891/build/MEM_tb.vcd.fsdb}
wvZoom -win $_nWave1 0.000000 3752286.236854
wvSetPosition -win $_nWave1 {("G1" 0)}
wvSetPosition -win $_nWave1 {("G1" 0)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvGetSignalSetScope -win $_nWave1 "/ModAdd"
wvGetSignalSetScope -win $_nWave1 "/Testbench"
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvZoom -win $_nWave1 0.000000 3752286.236854
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Testbench/data_in\[31:0\]} \
{/Testbench/cnt\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSetPosition -win $_nWave1 {("G1" 2)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetCursor -win $_nWave1 982821046.927058 -snap {("G2" 0)}
wvSetCursor -win $_nWave1 983284292.141484 -snap {("G2" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvConvertFile -win $_nWave1 -o \
           "/home/ldap-users/siang/Desktop/NWC_verilog/N26094891/build/MEM_tb.vcd.fsdb" \
           "/home/ldap-users/siang/Desktop/NWC_verilog/N26094891/build/MEM_tb.vcd"
wvOpenFile -win $_nWave1 \
           {/home/ldap-users/siang/Desktop/NWC_verilog/N26094891/build/MEM_tb.vcd.fsdb}
wvZoom -win $_nWave1 982160922.496571 985913208.733425
wvSetPosition -win $_nWave1 {("G1" 0)}
wvSetPosition -win $_nWave1 {("G1" 0)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvGetSignalSetScope -win $_nWave1 "/ModAdd"
wvGetSignalSetScope -win $_nWave1 "/Testbench"
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvZoom -win $_nWave1 982160922.496571 985913208.733425
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Testbench/data_in\[31:0\]} \
{/Testbench/cnt\[31:0\]} \
{/Testbench/flag} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSetPosition -win $_nWave1 {("G1" 3)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 984957765.478600 -snap {("G1" 3)}
wvZoomOut -win $_nWave1
wvResizeWindow -win $_nWave1 1920 148 1920 1017
wvZoomIn -win $_nWave1
wvSetMarker -win $_nWave1 -keepViewRange -name "M1" 984959369.270941
wvSetMarker -win $_nWave1 -keepViewRange -name "M1" 984959369.270941
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 983255899.012303 -snap {("G2" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvConvertFile -win $_nWave1 -o \
           "/home/ldap-users/siang/Desktop/NWC_verilog/N26094891/build/MEM_tb.vcd.fsdb" \
           "/home/ldap-users/siang/Desktop/NWC_verilog/N26094891/build/MEM_tb.vcd"
wvOpenFile -win $_nWave1 \
           {/home/ldap-users/siang/Desktop/NWC_verilog/N26094891/build/MEM_tb.vcd.fsdb}
wvZoom -win $_nWave1 980764901.125685 985755556.219671
wvSetPosition -win $_nWave1 {("G1" 0)}
wvSetPosition -win $_nWave1 {("G1" 0)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvGetSignalSetScope -win $_nWave1 "/ModAdd"
wvGetSignalSetScope -win $_nWave1 "/Testbench"
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvZoom -win $_nWave1 980764901.125685 985755556.219671
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 983105804.122259 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 1726091.235514 -snap {("G1" 1)}
wvSetSearchMode -win $_nWave1 -value 
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSetSearchMode -win $_nWave1 -value 511
wvSearchNext -win $_nWave1
wvSetCursor -win $_nWave1 61390717.784726 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 61324329.660283 -snap {("G1" 1)}
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Testbench/data_in\[31:0\]} \
{/Testbench/cnt\[31:0\]} \
{/Testbench/flag} \
{/Testbench/i} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSetPosition -win $_nWave1 {("G1" 4)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/ModAdd"
wvGetSignalSetScope -win $_nWave1 "/Testbench"
wvGetSignalSetScope -win $_nWave1 "/Testbench/mem"
wvGetSignalSetScope -win $_nWave1 "/Testbench"
wvGetSignalSetScope -win $_nWave1 "/ModAdd"
wvGetSignalSetScope -win $_nWave1 "/Testbench"
wvGetSignalSetScope -win $_nWave1 "/Testbench/mem"
wvGetSignalSetScope -win $_nWave1 "/Testbench/mem/unmblk1"
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Testbench/data_in\[31:0\]} \
{/Testbench/cnt\[31:0\]} \
{/Testbench/flag} \
{/Testbench/mem/unmblk1/i} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSetPosition -win $_nWave1 {("G1" 4)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetMarker -win $_nWave1 -keepViewRange -name "M2" 61323319.406213
wvSetMarker -win $_nWave1 -keepViewRange -name "M2" 61323319.406213
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/ModAdd"
wvGetSignalSetScope -win $_nWave1 "/Testbench"
wvGetSignalSetScope -win $_nWave1 "/Testbench/mem"
wvGetSignalSetScope -win $_nWave1 "/Testbench/mem/unmblk1"
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Testbench/data_in\[31:0\]} \
{/Testbench/cnt\[31:0\]} \
{/Testbench/flag} \
{/Testbench/mem/unmblk1/i} \
{/Testbench/mem/unmblk1/j} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSetRadix -win $_nWave1 -format UDec
wvJumpToolbarUserMarker -win $_nWave1 -name "M2"
wvSetCursor -win $_nWave1 60072047.582475 -snap {("G2" 0)}
wvSetCursor -win $_nWave1 61128484.693174 -snap {("G2" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvConvertFile -win $_nWave1 -o \
           "/home/ldap-users/siang/Desktop/NWC_verilog/N26094891/build/MEM_tb.vcd.fsdb" \
           "/home/ldap-users/siang/Desktop/NWC_verilog/N26094891/build/MEM_tb.vcd"
wvOpenFile -win $_nWave1 \
           {/home/ldap-users/siang/Desktop/NWC_verilog/N26094891/build/MEM_tb.vcd.fsdb}
wvZoom -win $_nWave1 58827991.859220 63818646.953206
wvSetPosition -win $_nWave1 {("G1" 0)}
wvSetPosition -win $_nWave1 {("G1" 0)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvGetSignalSetScope -win $_nWave1 "/ModAdd"
wvGetSignalSetScope -win $_nWave1 "/Testbench/mem/unmblk1"
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvZoom -win $_nWave1 58827991.859220 63818646.953206
wvReloadFile -win $_nWave1
wvJumpToolbarUserMarker -win $_nWave1 -name "M1"
wvSetCursor -win $_nWave1 983058648.403692 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 982957190.030898 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 982971622.231863 -snap {("G1" 2)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Testbench"
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Testbench/data_in\[31:0\]} \
{/Testbench/cnt\[31:0\]} \
{/Testbench/flag} \
{/Testbench/mem/unmblk1/i} \
{/Testbench/mem/unmblk1/j} \
{/Testbench/clk} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 983040896.796500 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 982988940.873023 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 983052442.557272 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 983003373.073988 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 983038010.356306 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 982789776.499694 -snap {("G2" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvConvertFile -win $_nWave1 -o \
           "/home/ldap-users/siang/Desktop/NWC_verilog/N26094891/build/MEM_tb.vcd.fsdb" \
           "/home/ldap-users/siang/Desktop/NWC_verilog/N26094891/build/MEM_tb.vcd"
wvOpenFile -win $_nWave1 \
           {/home/ldap-users/siang/Desktop/NWC_verilog/N26094891/build/MEM_tb.vcd.fsdb}
wvZoom -win $_nWave1 980717312.441053 985707967.535039
wvSetPosition -win $_nWave1 {("G1" 0)}
wvSetPosition -win $_nWave1 {("G1" 0)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvGetSignalSetScope -win $_nWave1 "/ModAdd"
wvGetSignalSetScope -win $_nWave1 "/Testbench/mem/unmblk1"
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvZoom -win $_nWave1 980717312.441053 985707967.535039
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 982960076.471091 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 983035123.916113 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 982977395.112250 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 983038010.356306 -snap {("G1" 3)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Testbench/mem"
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Testbench/data_in\[31:0\]} \
{/Testbench/cnt\[31:0\]} \
{/Testbench/flag} \
{/Testbench/mem/unmblk1/i} \
{/Testbench/mem/unmblk1/j} \
{/Testbench/clk} \
{/Testbench/mem/data_in\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSetRadix -win $_nWave1 -format UDec
wvResizeWindow -win $_nWave1 1920 148 1920 1017
wvSetCursor -win $_nWave1 982805635.390398 -snap {("G1" 1)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/ModAdd"
wvGetSignalSetScope -win $_nWave1 "/Testbench"
wvGetSignalSetScope -win $_nWave1 "/Testbench/mem"
wvGetSignalSetScope -win $_nWave1 "/Testbench/mem/unmblk1"
wvGetSignalSetScope -win $_nWave1 "/Testbench/mem"
wvGetSignalSetScope -win $_nWave1 "/Testbench"
wvGetSignalSetScope -win $_nWave1 "/Testbench/mem"
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Testbench/data_in\[31:0\]} \
{/Testbench/cnt\[31:0\]} \
{/Testbench/flag} \
{/Testbench/mem/unmblk1/i} \
{/Testbench/mem/unmblk1/j} \
{/Testbench/clk} \
{/Testbench/mem/data_in\[31:0\]} \
{/Testbench/mem/BN_idx\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSetPosition -win $_nWave1 {("G1" 8)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/ModAdd"
wvGetSignalSetScope -win $_nWave1 "/Testbench"
wvGetSignalSetScope -win $_nWave1 "/Testbench/mem"
wvGetSignalSetScope -win $_nWave1 "/Testbench/mem/unmblk1"
wvGetSignalSetScope -win $_nWave1 "/Testbench/mem"
wvGetSignalSetScope -win $_nWave1 "/Testbench"
wvGetSignalSetScope -win $_nWave1 "/ModAdd"
wvSetCursor -win $_nWave1 983105322.929330 -snap {("G2" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvConvertFile -win $_nWave1 -o \
           "/home/ldap-users/siang/Desktop/NWC_verilog/N26094891/build/MEM_tb.vcd.fsdb" \
           "/home/ldap-users/siang/Desktop/NWC_verilog/N26094891/build/MEM_tb.vcd"
wvOpenFile -win $_nWave1 \
           {/home/ldap-users/siang/Desktop/NWC_verilog/N26094891/build/MEM_tb.vcd.fsdb}
wvZoom -win $_nWave1 982054407.139288 986919223.365574
wvSetPosition -win $_nWave1 {("G1" 0)}
wvSetPosition -win $_nWave1 {("G1" 0)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvGetSignalSetScope -win $_nWave1 "/ModAdd"
wvGetSignalSetScope -win $_nWave1 "/Testbench/mem/unmblk1"
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvZoom -win $_nWave1 982054407.139288 986919223.365574
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 983954139.529049 -snap {("G2" 0)}
wvSetCursor -win $_nWave1 984964635.481097 -snap {("G1" 0)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Testbench"
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Testbench/data_in\[31:0\]} \
{/Testbench/cnt\[31:0\]} \
{/Testbench/flag} \
{/Testbench/mem/unmblk1/i} \
{/Testbench/mem/unmblk1/j} \
{/Testbench/clk} \
{/Testbench/mem/data_in\[31:0\]} \
{/Testbench/rst} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSetPosition -win $_nWave1 {("G1" 8)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 985435237.881622 -snap {("G2" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvConvertFile -win $_nWave1 -o \
           "/home/ldap-users/siang/Desktop/NWC_verilog/N26094891/build/MEM_tb.vcd.fsdb" \
           "/home/ldap-users/siang/Desktop/NWC_verilog/N26094891/build/MEM_tb.vcd"
wvOpenFile -win $_nWave1 \
           {/home/ldap-users/siang/Desktop/NWC_verilog/N26094891/build/MEM_tb.vcd.fsdb}
wvZoom -win $_nWave1 982054407.139288 986919223.365574
wvSetPosition -win $_nWave1 {("G1" 0)}
wvSetPosition -win $_nWave1 {("G1" 0)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvGetSignalSetScope -win $_nWave1 "/Testbench"
wvGetSignalSetScope -win $_nWave1 "/Testbench/mem/unmblk1"
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvZoom -win $_nWave1 982054407.139288 986919223.365574
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 0)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Testbench/mem"
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Testbench/mem/data_in\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSetPosition -win $_nWave1 {("G1" 1)}
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Testbench"
wvGetSignalSetScope -win $_nWave1 "/Testbench/mem"
wvGetSignalSetScope -win $_nWave1 "/Testbench/mem/unmblk1"
wvGetSignalSetScope -win $_nWave1 "/Testbench/mem"
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Testbench/mem/data_in\[31:0\]} \
{/Testbench/mem/BN_idx\[31:0\]} \
{/Testbench/mem/MA_idx\[8:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 2 3 )} 
wvSetPosition -win $_nWave1 {("G1" 3)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 )} 
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetCursor -win $_nWave1 982802174.143715 -snap {("G2" 0)}
wvSelectGroup -win $_nWave1 {G2}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 )} 
wvSetPosition -win $_nWave1 {("G2" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSelectGroup -win $_nWave1 {G1}
wvSetPosition -win $_nWave1 {("G1" 0)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Testbench"
wvGetSignalSetScope -win $_nWave1 "/Testbench/mem"
wvGetSignalSetScope -win $_nWave1 "/Testbench/mem/unmblk1"
wvGetSignalSetScope -win $_nWave1 "/Testbench/mem"
wvGetSignalSetScope -win $_nWave1 "/Testbench"
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Testbench/BN_idx\[31:0\]} \
{/Testbench/MA_idx\[8:0\]} \
{/Testbench/data_in\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Testbench/mem/data_in\[31:0\]} \
{/Testbench/mem/BN_idx\[31:0\]} \
{/Testbench/mem/MA_idx\[8:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 )} 
wvSetPosition -win $_nWave1 {("G1" 3)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 982532949.150848 -snap {("G3" 0)}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 )} 
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 )} 
wvSetRadix -win $_nWave1 -format UDec
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Testbench"
wvGetSignalSetScope -win $_nWave1 "/Testbench/mem"
wvGetSignalSetScope -win $_nWave1 "/Testbench/mem/unmblk1"
wvGetSignalSetScope -win $_nWave1 "/Testbench"
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Testbench/BN_idx\[31:0\]} \
{/Testbench/MA_idx\[8:0\]} \
{/Testbench/data_in\[31:0\]} \
{/Testbench/flag} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Testbench/mem/data_in\[31:0\]} \
{/Testbench/mem/BN_idx\[31:0\]} \
{/Testbench/mem/MA_idx\[8:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSetPosition -win $_nWave1 {("G1" 4)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 983038197.126872 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 983500138.133522 -snap {("G3" 0)}
wvSelectSignal -win $_nWave1 {( "G2" 2 )} 
wvSelectGroup -win $_nWave1 {G1}
wvSetPosition -win $_nWave1 {("G1" 0)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Testbench"
wvGetSignalSetScope -win $_nWave1 "/Testbench/mem"
wvGetSignalSetScope -win $_nWave1 "/Testbench/mem/unmblk1"
wvGetSignalSetScope -win $_nWave1 "/Testbench"
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Testbench/cnt\[31:0\]} \
{/Testbench/BN_idx\[31:0\]} \
{/Testbench/MA_idx\[8:0\]} \
{/Testbench/data_in\[31:0\]} \
{/Testbench/flag} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Testbench/mem/data_in\[31:0\]} \
{/Testbench/mem/BN_idx\[31:0\]} \
{/Testbench/mem/MA_idx\[8:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSetPosition -win $_nWave1 {("G1" 1)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSelectSignal -win $_nWave1 {( "G2" 3 )} 
wvSetPosition -win $_nWave1 {("G2" 3)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Testbench"
wvGetSignalSetScope -win $_nWave1 "/Testbench/mem"
wvGetSignalSetScope -win $_nWave1 "/Testbench/mem/unmblk1"
wvGetSignalSetScope -win $_nWave1 "/Testbench"
wvGetSignalSetScope -win $_nWave1 "/Testbench/mem"
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/Testbench/cnt\[31:0\]} \
{/Testbench/BN_idx\[31:0\]} \
{/Testbench/MA_idx\[8:0\]} \
{/Testbench/data_in\[31:0\]} \
{/Testbench/flag} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/Testbench/mem/data_in\[31:0\]} \
{/Testbench/mem/BN_idx\[31:0\]} \
{/Testbench/mem/MA_idx\[8:0\]} \
{/Testbench/mem/memory_ans\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 4 )} 
wvSetPosition -win $_nWave1 {("G2" 4)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 799735.367763 -snap {("G3" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvConvertFile -win $_nWave1 -o \
           "/home/ldap-users/siang/Desktop/NWC_verilog/N26094891/build/MEM_tb.vcd.fsdb" \
           "/home/ldap-users/siang/Desktop/NWC_verilog/N26094891/build/MEM_tb.vcd"
wvOpenFile -win $_nWave1 \
           {/home/ldap-users/siang/Desktop/NWC_verilog/N26094891/build/MEM_tb.vcd.fsdb}
wvZoom -win $_nWave1 0.000000 4864816.226286
wvSetPosition -win $_nWave1 {("G1" 0)}
wvSetPosition -win $_nWave1 {("G1" 0)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G3" 0)}
wvGetSignalSetScope -win $_nWave1 "/Testbench"
wvGetSignalSetScope -win $_nWave1 "/Testbench/mem/unmblk1"
wvSetPosition -win $_nWave1 {("G3" 0)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvZoom -win $_nWave1 0.000000 4864816.226286
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Testbench/mem"
wvSetCursor -win $_nWave1 2451174.466538 -snap {("G3" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvConvertFile -win $_nWave1 -o \
           "/home/ldap-users/siang/Desktop/NWC_verilog/N26094891/build/MEM_tb.vcd.fsdb" \
           "/home/ldap-users/siang/Desktop/NWC_verilog/N26094891/build/MEM_tb.vcd"
wvOpenFile -win $_nWave1 \
           {/home/ldap-users/siang/Desktop/NWC_verilog/N26094891/build/MEM_tb.vcd.fsdb}
wvZoom -win $_nWave1 0.000000 4864816.226286
wvSetPosition -win $_nWave1 {("G1" 0)}
wvSetPosition -win $_nWave1 {("G1" 0)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G3" 0)}
wvGetSignalSetScope -win $_nWave1 "/Testbench"
wvGetSignalSetScope -win $_nWave1 "/Testbench/mem/unmblk1"
wvSetPosition -win $_nWave1 {("G3" 0)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvZoom -win $_nWave1 0.000000 4864816.226286
wvReloadFile -win $_nWave1
wvJumpToolbarUserMarker -win $_nWave1 -name "M2"
wvJumpToolbarUserMarker -win $_nWave1 -name "M1"
wvSetCursor -win $_nWave1 984531969.035064 -snap {("G3" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvConvertFile -win $_nWave1 -o \
           "/home/ldap-users/siang/Desktop/NWC_verilog/N26094891/build/MEM_tb.vcd.fsdb" \
           "/home/ldap-users/siang/Desktop/NWC_verilog/N26094891/build/MEM_tb.vcd"
wvOpenFile -win $_nWave1 \
           {/home/ldap-users/siang/Desktop/NWC_verilog/N26094891/build/MEM_tb.vcd.fsdb}
wvZoom -win $_nWave1 981884469.640774 986749285.867060
wvSetPosition -win $_nWave1 {("G1" 0)}
wvSetPosition -win $_nWave1 {("G1" 0)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G3" 0)}
wvGetSignalSetScope -win $_nWave1 "/Testbench"
wvGetSignalSetScope -win $_nWave1 "/Testbench/mem/unmblk1"
wvSetPosition -win $_nWave1 {("G3" 0)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvZoom -win $_nWave1 981884469.640774 986749285.867060
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 983042209.288617 -snap {("G1" 5)}
wvSelectUserMarker -win $_nWave1 -name "M1"
wvSetMarker -win $_nWave1 -keepViewRange -name "M1" 983033547.894743
wvSetCursor -win $_nWave1 983781314.899258 -snap {("G3" 0)}
wvSetCursor -win $_nWave1 983354019.468106 -snap {("G1" 3)}
wvSelectUserMarker -win $_nWave1 -name "M1"
wvSetMarker -win $_nWave1 -keepViewRange -name "M1" 983039322.157326
wvSetCursor -win $_nWave1 983414649.225229 -snap {("G3" 0)}
wvZoom -win $_nWave1 982990240.925369 983117274.702198
wvZoom -win $_nWave1 983039245.052860 983040451.308308
wvSelectUserMarker -win $_nWave1 -name "M1"
wvSetMarker -win $_nWave1 -keepViewRange -name "M1" 983039998.872970
wvSetCursor -win $_nWave1 983040091.221310 -snap {("G3" 0)}
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 984155565.029368 -snap {("G3" 0)}
wvSetCursor -win $_nWave1 983850612.198150 -snap {("G2" 2)}
wvSetCursor -win $_nWave1 983281757.878379 -snap {("G3" 0)}
wvSetCursor -win $_nWave1 982199761.775309 -snap {("G2" 1)}
wvSetCursor -win $_nWave1 984240599.953457 -snap {("G3" 0)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/Testbench"
wvGetSignalSetScope -win $_nWave1 "/Testbench/mem"
wvGetSignalSetScope -win $_nWave1 "/Testbench/result"
wvGetSignalSetScope -win $_nWave1 "/Testbench/mem/unmblk1"
wvGetSignalSetScope -win $_nWave1 "/Testbench/mem"
wvSetCursor -win $_nWave1 983009059.673540 -snap {("G3" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvConvertFile -win $_nWave1 -o \
           "/home/ldap-users/siang/Desktop/NWC_verilog/N26094891/build/MEM_tb.vcd.fsdb" \
           "/home/ldap-users/siang/Desktop/NWC_verilog/N26094891/build/MEM_tb.vcd"
wvOpenFile -win $_nWave1 \
           {/home/ldap-users/siang/Desktop/NWC_verilog/N26094891/build/MEM_tb.vcd.fsdb}
wvZoom -win $_nWave1 980569437.023846 985510259.337322
wvSetPosition -win $_nWave1 {("G1" 0)}
wvSetPosition -win $_nWave1 {("G1" 0)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G3" 0)}
wvGetSignalSetScope -win $_nWave1 "/Testbench"
wvGetSignalSetScope -win $_nWave1 "/Testbench/result"
wvSetPosition -win $_nWave1 {("G3" 0)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvZoom -win $_nWave1 980569437.023846 985510259.337322
wvReloadFile -win $_nWave1
