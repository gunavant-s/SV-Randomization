// Code your testbench here
// or browse Examples

class generator;
  
  randc bit [3:0] a, b; ///rand or randc 
  bit [3:0] y;
  
endclass
 
//rand keyword -> repetition of value. 
//Whenever you want to see prediction of a value

//randc keyword -> no repetrion

module tb;
  generator g;
  int i = 0;
  int status = 0;
  
  initial begin
    g = new();
    
    for(i=0;i<10;i++) begin
      status = g.randomize(); // returns 1 if randomization is possible else 0
      $display("Value of a :%0d and b: %0d. Status:%0d", g.a,g.b,status);
      #10;
    end
    
// # KERNEL: Value of a :1 and b: 8. Status:1
// # KERNEL: Value of a :15 and b: 5. Status:1
// # KERNEL: Value of a :3 and b: 0. Status:1
// # KERNEL: Value of a :0 and b: 15. Status:1
// # KERNEL: Value of a :13 and b: 13. Status:1
// # KERNEL: Value of a :7 and b: 2. Status:1
// # KERNEL: Value of a :9 and b: 9. Status:1
// # KERNEL: Value of a :5 and b: 10. Status:1
// # KERNEL: Value of a :12 and b: 11. Status:1
// # KERNEL: Value of a :8 and b: 6. Status:1
    
  end
    
endmodule
