/*
Generate values between 0 to 7 for addr signal when wr is high and values between 8 to 15 when wr is low. 
Generator code is mentioned in the Instruction tab. Verify your code for 20 iterations by sending values of both wr and addr on a console.
*/

class generator;
  
  rand bit [3:0] addr;
  rand bit wr;
  
  constraint wr_high {
    (wr == 1) -> (addr inside {[0:7]});
    (wr == 0) -> (addr inside {[8:15]});
  }
  
endclass


module tb;
  
  generator g;
  
  initial begin
    g = new();
    
    for (int i=0; i<20; i++) begin
      assert(g.randomize()) else $display("Randomization Failed");
      $display("Value of wr : %0b | addr : %0d | ", g.wr, g.addr);
    end
    
  end
  
endmodule

/*
# KERNEL: Value of wr : 1 | addr : 1 | 
# KERNEL: Value of wr : 0 | addr : 15 | 
# KERNEL: Value of wr : 1 | addr : 4 | 
# KERNEL: Value of wr : 0 | addr : 12 | 
# KERNEL: Value of wr : 1 | addr : 5 | 
# KERNEL: Value of wr : 0 | addr : 14 | 
# KERNEL: Value of wr : 0 | addr : 12 | 
# KERNEL: Value of wr : 1 | addr : 5 | 
# KERNEL: Value of wr : 1 | addr : 0 | 
# KERNEL: Value of wr : 0 | addr : 11 | 
# KERNEL: Value of wr : 0 | addr : 12 | 
# KERNEL: Value of wr : 1 | addr : 6 | 
# KERNEL: Value of wr : 1 | addr : 7 | 
# KERNEL: Value of wr : 0 | addr : 8 | 
# KERNEL: Value of wr : 0 | addr : 8 | 
# KERNEL: Value of wr : 1 | addr : 1 | 
# KERNEL: Value of wr : 1 | addr : 5 | 
# KERNEL: Value of wr : 0 | addr : 13 | 
# KERNEL: Value of wr : 0 | addr : 11 | 
# KERNEL: Value of wr : 0 | addr : 10 | 
*/
