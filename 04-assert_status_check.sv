class generator;
  
  randc bit [3:0] a, b; ///rand or randc 
  bit [3:0] y;
  constraint data{a>16;}
  
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
      
      if(!g.randomize()) begin
        $display("Randomization not possible at %0d",$time);
        $finish();
      end
        
      $display("Value of a :%0d and b: %0d. Status:%0d", g.a,g.b,status);
      #10;
      
    end
    
  end
    
endmodule
