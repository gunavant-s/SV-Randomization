class generator;
  
  randc bit [7:0] a,b;
  
  constraint data 
  {
    a inside {[2:7],[9:13], 15}; //2 3 4 5 6 7 9 10 11 12 13 15
    !(a inside {[14:19]});       //none from 14 to 19
    b inside {[1:6],[9:12]};     // 1 2 3 4 5 6 9 10 11 12
  }
  
endclass

module tb;
  
  generator g;
  
  initial begin
    g = new();
    for(int i=0;i<10;i++) begin
      g.randomize();
      $display("a = %0d, b = %0d",g.a,g.b);
    end 
  end
  
endmodule

/*
# KERNEL: a = 9, b = 9
# KERNEL: a = 3, b = 2
# KERNEL: a = 10, b = 6
# KERNEL: a = 5, b = 1
# KERNEL: a = 12, b = 4
# KERNEL: a = 7, b = 10
# KERNEL: a = 13, b = 12
# KERNEL: a = 4, b = 5
# KERNEL: a = 11, b = 3
# KERNEL: a = 2, b = 11
*/
