//Assume generator class consists of three 8-bit data members (x,y, and z). Write a code to generate 20 random values for all the data members at an interval of 20 ns.

class generator; 
  
  randc bit [7:0] x, y, z;
  
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
# KERNEL: x : 17, y : 56, z : 153
# KERNEL: x : 132, y : 56, z : 82
# KERNEL: x : 91, y : 5, z : 22
# KERNEL: x : 107, y : 141, z : 4
# KERNEL: x : 239, y : 114, z : 212
# KERNEL: x : 222, y : 43, z : 169
# KERNEL: x : 247, y : 97, z : 195
# KERNEL: x : 130, y : 91, z : 54
# KERNEL: x : 111, y : 223, z : 123
# KERNEL: x : 218, y : 213, z : 135
# KERNEL: x : 132, y : 116, z : 67
# KERNEL: x : 169, y : 223, z : 111
# KERNEL: x : 148, y : 85, z : 195
# KERNEL: x : 229, y : 97, z : 115
# KERNEL: x : 13, y : 170, z : 182
# KERNEL: x : 54, y : 176, z : 253
# KERNEL: x : 32, y : 136, z : 139
# KERNEL: x : 112, y : 202, z : 35
# KERNEL: x : 139, y : 71, z : 250
# KERNEL: x : 16, y : 197, z : 17
*/
