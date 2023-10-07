/*
Take the help of pseudo-random number generator to generate values for wr and rst signal. 
rst should be low for apprx. 30% of time whie wr should be high for apprx. 50% of time. 
Verify your code for 20 iterations by sending values of both wr and rst on a console.
*/

class generator;
  
  rand bit rst;
  rand bit wr;
  
  /////////////////add constraint 
  
  constraint ctrl {
    
    rst dist {0 := 30, 1 := 70};
    wr dist {0 := 50, 1 := 50};
  
  }

endclass


module tb;
  
  generator g;
  
  initial begin
    g = new();
    
    for(int i=0;i<20;i++) begin
      g.randomize();
      $display("Values rst : %0d, wr : %0d",g.rst,g.wr);
    end
  end
  
endmodule

/*
# KERNEL: Values rst : 0, wr : 1
# KERNEL: Values rst : 1, wr : 1
# KERNEL: Values rst : 0, wr : 0
# KERNEL: Values rst : 1, wr : 1
# KERNEL: Values rst : 1, wr : 0
# KERNEL: Values rst : 1, wr : 0
# KERNEL: Values rst : 1, wr : 0
# KERNEL: Values rst : 1, wr : 0
# KERNEL: Values rst : 0, wr : 1
# KERNEL: Values rst : 0, wr : 1
# KERNEL: Values rst : 1, wr : 1
# KERNEL: Values rst : 0, wr : 1
# KERNEL: Values rst : 0, wr : 1
# KERNEL: Values rst : 1, wr : 0
# KERNEL: Values rst : 1, wr : 1
# KERNEL: Values rst : 1, wr : 1
# KERNEL: Values rst : 1, wr : 0
# KERNEL: Values rst : 1, wr : 1
# KERNEL: Values rst : 0, wr : 0
# KERNEL: Values rst : 1, wr : 0
*/
