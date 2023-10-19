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
      g.randomize();
      $display("Value of a :%0d and b: %0d", g.a,g.b);
      #10;
    end
    
    /*
    # KERNEL: Value of a :6 and b: 5
	# KERNEL: Value of a :3 and b: 4
	# KERNEL: Value of a :15 and b: 13
	# KERNEL: Value of a :11 and b: 8
	# KERNEL: Value of a :7 and b: 8
	# KERNEL: Value of a :10 and b: 10
	# KERNEL: Value of a :11 and b: 13
	# KERNEL: Value of a :13 and b: 4
	# KERNEL: Value of a :9 and b: 9
	# KERNEL: Value of a :1 and b: 11
    */
    
  //no repetition of a,b
    
  end
    
endmodule
