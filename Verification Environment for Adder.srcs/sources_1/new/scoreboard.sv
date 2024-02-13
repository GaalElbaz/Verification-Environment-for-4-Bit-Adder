`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Class Name: scoreboard
//////////////////////////////////////////////////////////////////////////////////


class scoreboard;
    mailbox #(transaction) mbx;    // monitor to scoreboard
    transaction data;
    event next_data;
    
    
    function new(mailbox #(transaction) mbx);
        this.mbx = mbx;    
    endfunction
    
    task compare(input transaction trans);
        if ((trans.sum) == (trans.a + trans.b)) begin
            $display("SUM RESULT MATCHED");
        end
        else begin
            $error("SUM RESULT MISMATCHED");
        end
    
    endtask
 
    
    task run();
        forever begin
            mbx.get(data);
            $display("[SCO] : DATA RCVD FROM MONITOR");
            data.display();
            compare(data);
            $display("----------------------------");
            ->next_data;
        end
    endtask
endclass
