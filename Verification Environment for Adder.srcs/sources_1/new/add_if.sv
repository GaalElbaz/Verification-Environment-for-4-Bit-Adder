`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Interface Name: add_if
//////////////////////////////////////////////////////////////////////////////////


interface add_if;
    logic [3:0] a,b;
    logic clk;
    logic [4:0] sum;

    modport DUT (
        input a,b,clk,
        output sum
    );
    
    modport DRV (
        output a,b,
        input sum, clk
     );
endinterface
