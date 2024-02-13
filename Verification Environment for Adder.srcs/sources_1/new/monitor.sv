`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Class Name: monitor
//////////////////////////////////////////////////////////////////////////////////


class monitor;
    mailbox #(transaction) mbx;    // monitor to scoreboard
    transaction trans;
    virtual add_if aif;
    
    function new(mailbox #(transaction) mbx);
        this.mbx = mbx;    
    endfunction
    
    task run();
        trans = new();
        forever begin
            repeat(3)@(posedge aif.clk);
            trans.a = aif.a;
            trans.b = aif.b;
            trans.sum = aif.sum;
            $display("[MON] : DATA SENT TO SCOREBOARD");
            trans.display();
            mbx.put(trans);
        end
        
    endtask
endclass
