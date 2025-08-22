`timescale 1ns/1ps

module logic_gates(SW0, SW1, y_and, y_or);

// Definitions
input SW0;
input SW1;
output y_and;
output y_or;

// logical gates
assign y_and = SW0 && SW1; //returns a boolean, not bitwise. bitwise would be &
assign y_or = SW0 || SW1;

endmodule