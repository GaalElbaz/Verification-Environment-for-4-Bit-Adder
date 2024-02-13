`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Class Name: generator
//////////////////////////////////////////////////////////////////////////////////

class generator;
    transaction trans;
    mailbox #(transaction) mbx;
    
    function new(mailbox #(transaction) mbx);
        this.mbx = mbx;     // initiallizing mailbox for gen2drv
        trans = new();      // creating a single space object to remmber the history of the randc. 
    endfunction
    
    event done;
    event next_data;
    
    task run();
        // before randomizing trans we need to create an handler of the transaction class.
        // method 1
        // method 1 - adding it before the for loop
        // trans = new();
        // disadventage -> we can lose the random data depending on the clock and time of the flow.
        // method 2 - adding it inside the for loop
        // disadvatnge - each trans will be an independet so the randc desired behaivor won't be applied in the test.
        // method 3 - deep copy & trans = new() in custome constructor.
        for(int i = 0; i < 10; i++) begin
           #10;
            assert(trans.randomize()) else $error("Randomization Failed!");
            mbx.put(trans.copy());  // this way we wont be facing race conditions.
            $display("[GEN] : DATA SENT TO DRIVER");
            trans.display();
            wait(next_data.triggered);           
        end
        -> done;
    endtask
endclass