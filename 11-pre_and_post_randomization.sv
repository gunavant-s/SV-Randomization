/*Pre can be used to modify constraints or initialize data members of the transaction class.
Post-randomization can be used to modify values of data members after randomization to introduce intended errors or they can be used to analyze values generated by randomization for debugging.
THIS KEYWORD TO REFER CLASS VARIABLE
*/

class generator;
  randc bit [7:0] a,b;
  
  int min,max;
  
  function void pre_randomize(input int min, input int max);
    this.min = min;
    this.max = max;
  endfunction
  
  constraint data{a inside {[min:max]};
                  b inside {[min:max]};
                 };
  
  function void post_randomize();
    $display("a : %0d, b : %0d",a,b);
  endfunction
  
endclass

module tb;
  
  generator g;
  initial begin
    g = new();
    for(int i=0;i<10;i++) begin
      g.pre_randomize(4,25);
      g.randomize();
      #10;
    end
  end
  
endmodule

/*
# KERNEL: a : 19, b : 23
# KERNEL: a : 13, b : 17
# KERNEL: a : 8, b : 9
# KERNEL: a : 17, b : 19
# KERNEL: a : 15, b : 8
# KERNEL: a : 24, b : 24
# KERNEL: a : 7, b : 5
# KERNEL: a : 6, b : 25
# KERNEL: a : 16, b : 16
# KERNEL: a : 21, b : 4
*/
