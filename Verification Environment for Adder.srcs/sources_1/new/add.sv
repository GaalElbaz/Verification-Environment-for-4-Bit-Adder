`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: add
//////////////////////////////////////////////////////////////////////////////////


module add(add_if.DUT aif);
    always_ff @(posedge aif.clk) begin
        aif.sum <= aif.a + aif.b;
    end 
endmodule
