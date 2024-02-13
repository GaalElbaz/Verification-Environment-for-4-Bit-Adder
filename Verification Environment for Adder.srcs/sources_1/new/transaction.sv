`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Class Name: transaction
//////////////////////////////////////////////////////////////////////////////////
class transaction;
    // working with 2 - state variables.
    randc bit [3:0] a;
    randc bit [3:0] b;
    bit [4:0] sum;
    
    function void display();
        $display("a : %0d \t b: %0d \t sum : %0d",a,b,sum);
    endfunction
    
    // DEEP COPY METHOD in order to overcome data-race states.
    virtual function transaction copy();
        copy = new();
        copy.a = this.a;
        copy.b = this.b;
        copy.sum = copy.sum;
    endfunction
endclass


//class err extends transaction;      // ee class is the child class
//    // constraint err {a == 0; b == 0;}
    
//    function transaction copy();
//        copy = new();
//        copy.a = 2;
//        copy.b = this.b;
//        copy.sum = this.sum;
//    endfunction
    
//endclass
