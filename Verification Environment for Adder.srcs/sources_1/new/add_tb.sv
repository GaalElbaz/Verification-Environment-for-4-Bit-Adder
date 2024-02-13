`timescale 1ns / 1ps
`include "add_if.sv"
`include "transaction.sv"
`include "driver.sv"
`include "add.sv"
`include "generator.sv"
`include "scoreboard.sv"
`include "monitor.sv"
//////////////////////////////////////////////////////////////////////////////////
// Module Name: add_tb
//////////////////////////////////////////////////////////////////////////////////

module add_tb;
    add_if aif();
    generator gen;
    driver drv;
    monitor mon;
    scoreboard sco;
    event done, next_data;
    mailbox #(transaction) gdmbx;
    mailbox #(transaction) msmbx;
    
    // err error; // for error injections
    
    // applying dut
    add dut(aif);
    
    // genertating clock
    initial begin
        aif.clk <= 0;
    end
    
    always #10 aif.clk <= ~aif.clk;
    
    initial begin
        // creating handlers
        gdmbx = new();
        gen = new(gdmbx);
        drv = new(gdmbx);
        drv.aif = aif;
        done = gen.done;
        
        msmbx = new();
        mon = new(msmbx);
        sco = new(msmbx);
        mon.aif = aif;
        
        // error = new();      // for error injections
        // gen.trans = error;
        
        gen.next_data = next_data;
        sco.next_data = next_data;
    end
    
    initial begin
        fork
            gen.run();
            drv.run();
            mon.run();
            sco.run();
        join_none
        wait(done.triggered);
        $finish();
    end

endmodule