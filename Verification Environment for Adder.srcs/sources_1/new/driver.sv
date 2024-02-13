`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: driver
//////////////////////////////////////////////////////////////////////////////////

class driver;
    
    virtual add_if.DRV aif; // The interface behaivor is outside the class.
    transaction data;
    mailbox #(transaction) mbx;
    event next;
    
    function new(mailbox #(transaction) mbx);
        this.mbx = mbx;
    endfunction
    
    task run();
        forever begin
           mbx.get(data);
           @(posedge aif.clk);
           aif.a <= data.a;
           aif.b <= data.b;           
           $display("[DRV] : Interface Trigger");
           data.display();
           @(posedge aif.clk);
        end
    endtask

endclass