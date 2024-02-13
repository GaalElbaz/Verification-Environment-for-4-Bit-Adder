`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: transaction
//////////////////////////////////////////////////////////////////////////////////
class transaction;
    // working with 2 - state variables.
    bit randc [3:0] a,b;
    bit [4:0] sum;
    
    function void display();
        $display("a : %0d \t b : %0d \t sum : %0d", a,b,sum);
    endfunction
endclass
