`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.03.2022 23:12:51
// Design Name: 
// Module Name: testbench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb( );
reg [1:81*4]a;
reg clk,reset,pl;
wire [1:4*3]b;
candidate c11(clk,reset,pl,b);
initial begin
    $dumpfile("new.vcd");
    $dumpvars(0,tb);
     clk=0;
     reset=0;
     pl=0;
    #2 reset=~reset;
    #2 reset=~reset;
    
end
always #5 pl=~pl;
always #3 clk=~clk;
initial #1000000 $finish;
endmodule
