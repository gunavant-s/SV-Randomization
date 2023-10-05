/*
Assume generator class consists of three 8-bit data members (x,y, and z). Write a code to generate 20 random values for all the data members at an interval of 20 ns.
Random values for all data members should range from 0 to 50.
*/
class generator; 
  
  randc bit [7:0] x, y, z;
  constraint data{
    x inside {[0:50]};
    y inside {[0:50]};
  	z inside {[0:50]};
  }
  
endclass

module tb;
  
  generator g;
  
  initial begin
    for(int i = 0;i<20;i++) begin
      g = new();
      if(g.randomize())
        $display("x : %0d, y : %0d, z : %0d",g.x,g.y,g.z);
      #20;
    end
  end
  
endmodule

/*
# KERNEL: x : 25, y : 26, z : 8
# KERNEL: x : 8, y : 3, z : 3
# KERNEL: x : 29, y : 27, z : 6
# KERNEL: x : 14, y : 49, z : 47
# KERNEL: x : 9, y : 30, z : 48
# KERNEL: x : 25, y : 8, z : 30
# KERNEL: x : 4, y : 36, z : 26
# KERNEL: x : 6, y : 46, z : 28
# KERNEL: x : 15, y : 20, z : 5
# KERNEL: x : 49, y : 46, z : 48
# KERNEL: x : 49, y : 2, z : 37
# KERNEL: x : 5, y : 38, z : 0
# KERNEL: x : 8, y : 47, z : 0
# KERNEL: x : 25, y : 18, z : 26
# KERNEL: x : 12, y : 37, z : 9
# KERNEL: x : 0, y : 5, z : 24
# KERNEL: x : 15, y : 45, z : 7
# KERNEL: x : 23, y : 34, z : 32
# KERNEL: x : 36, y : 37, z : 10
# KERNEL: x : 7, y : 10, z : 40
*/
