// First timescale definition `timescale <time_unit>/<time_precision>

`timescale 1ns/1ps

/*
The time_unit is the measurement of delays and simulation time while
the time_precision specifies how delay values are rounded before being 
used in simulation.
*/


// Definition of this module for the simulation, from which the other source can be called
// It's like setupping a virtual board where the program can run
module tb_gates2;

// Declare inputs and outputs for simulation
// Input should be declared as registers
// t is testbench, simulation variable


reg input1t;
reg input2t;
// equivalent to reg input1t, input2t;

wire output1t, output2t, output3t;

// we call the module on the unit under test UUT. The connections start with a dot .
gates UUT(

.SW0(input1t), //we link SW0 to input1t
.SW1(input2t),
.y_and(output1t),
.y_or(output2t),
.y_xor(output3t)

);


//begin simulation
initial begin

    //initialize, at the start of the simulation the inputs are zeroed
    input1t = 0;
    input2t = 0;
    
    //delay 100 x <time_unit>, in this case 100ns delay
    //we simulate
    // the delay is needed to allow the transitions
    // if i had more than 1 statement i would have had to put begin end
    
    repeat(8)
        #50 {input1t, input2t} = {input1t,input2t} + 1'b1;
        // for 8 times take the values in the registers of input and treat them as 2 bits, then add 1 bit
    
    #100
    $finish();
    
end


endmodule