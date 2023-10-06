/*
class generator;
  rand bit [4:0] a;
  rand bit [5:0] b;
endclass

For the Generator code mentioned in the Instruction tab, expected values for variable a ranges from 0 to 8, variable b ranges from 0 to 5.
Also, add logic to store the number of times randomization failed. Print values of variables during each iteration and error count after generating 20 random values for a and b. 
Add Constraint Code and Testbench top code to  the Design.
*/

// Code your testbench here
// or browse Examples
class generator;
  
  randc bit [4:0] a;
  rand bit [5:0] b;
  constraint data{a inside {[0:8]};
                  b inside {[0:5]};
                 }
endclass

module tb;
  generator g;
  
  initial begin
    int cnt = 0;
    g = new();
    for(int i=0;i<20;i++) begin
      #10;
      if(!g.randomize()) begin
        $display("Randomize didnt work at %0d",$time);
        cnt += 1;
      end
      else
        $display("a : %0d, b : %0d",g.a,g.b);
    end
    $display("Number of times randomization didn't work : %0d",cnt);
  end
  
endmodule
