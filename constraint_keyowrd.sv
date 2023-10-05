class generator;
  
  randc bit [3:0] a,b;
  
  constraint data_a {a > 3; a < 7;}
  constraint data_b {b == 2;}
  
endclass

module tb;
  
  generator g;
  
  initial begin
    g = new();
    
    for(int i=0;i<10;i++) begin
      if(g.randomize()) begin
        $display("a = %0d, b = %0d",g.a,g.b);
        $display("time : %0d",$time);
      end
      #20;
    end
      
  end
endmodule

/*
# KERNEL: a = 5, b = 2
# KERNEL: time : 0
# KERNEL: a = 6, b = 2
# KERNEL: time : 20
# KERNEL: a = 4, b = 2
# KERNEL: time : 40
# KERNEL: a = 6, b = 2
# KERNEL: time : 60
# KERNEL: a = 4, b = 2
# KERNEL: time : 80
# KERNEL: a = 5, b = 2
# KERNEL: time : 100
# KERNEL: a = 6, b = 2
# KERNEL: time : 120
# KERNEL: a = 4, b = 2
# KERNEL: time : 140
# KERNEL: a = 5, b = 2
# KERNEL: time : 160
# KERNEL: a = 5, b = 2
# KERNEL: time : 180
*/
