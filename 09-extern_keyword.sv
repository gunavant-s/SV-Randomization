
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
