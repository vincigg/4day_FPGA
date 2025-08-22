`timescale 1ns/1ps


module gates(SW0, SW1, y_and, y_or, y_xor);

// Definitions
input SW0;
input SW1;
output y_and;
output y_or;
output y_xor;

and(y_and, SW0, SW1); //bitwise and 
or(y_or, SW0, SW1);  //bitwise or
xor(y_xor, SW0, SW1);  //bitwise xor

endmodule