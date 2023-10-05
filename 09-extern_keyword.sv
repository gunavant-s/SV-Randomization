//extern is used to declare a variable as a global variable such that a variable declared in another scope of the same file or another file can be accessed from anywhere in the program. 
class generator;
  
  randc bit [7:0] a,b;
  
  extern constraint data;
  extern function void display();
  
endclass

    constraint generator::data {
      a inside{[1:4],[15:24]};
      b inside{[1:5],[12:20]};
        };
                      
 	function void generator::display();
      $display("Value of a : %0d and b : %0d", a,b);
    endfunction
    
    //Without an obejct reference or creation the above can be accessed outside the class
     
module tb;
  
  generator g;
  
  initial begin
    g = new();
    for(int i=0;i<10;i++) begin
     assert(g.randomize()) else $display("Randomization Failed");   
      g.display();
      #10;
    end 
  end
  
endmodule

/*
# KERNEL: Value of a : 17 and b : 19 Using extern
# KERNEL: Value of a : 21 and b : 3 Using extern
# KERNEL: Value of a : 1 and b : 4 Using extern
# KERNEL: Value of a : 2 and b : 13 Using extern
# KERNEL: Value of a : 19 and b : 12 Using extern
# KERNEL: Value of a : 22 and b : 1 Using extern
# KERNEL: Value of a : 18 and b : 20 Using extern
# KERNEL: Value of a : 15 and b : 5 Using extern
# KERNEL: Value of a : 24 and b : 17 Using extern
# KERNEL: Value of a : 3 and b : 16 Using extern
*/
