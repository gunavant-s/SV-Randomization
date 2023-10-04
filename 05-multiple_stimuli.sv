// care while case of generating multiple stimuli

class generator;
  
  rand bit [3:0] a, b;
  bit [3:0] y;
  
endclass
 
module tb;
  generator g;
  int i = 0;
  int status = 0;
  
  initial begin
   
    for(i=0;i<10;i++) begin
      g = new();   // This helps us to create a unique object for generating multiple stimuli
      g.randomize();
      $display("Value of a :%0d and b: %0d", g.a,g.b);
      #10;
    end
    /*
    Gives us an incorrect result. If the object is consuming a more time, okay, then the delay that we specified in that form, the right tool to tackle this situation.
    The good idea will always be whenever you are generating the new stimuli, you generate an independent object. So whenever you generate the new stimuli, we will be generating the new object.
    */
    
  end
  
  
endmodule
