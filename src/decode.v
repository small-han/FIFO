module DECODE(Datain,Corr_data,DataOut);

    parameter ECC_WIDTH = 5;
    parameter DATA_WIDTH = 32;

    input  [DATA_WIDTH-1:0] DataIn;
    input  [ECC_WIDTH-1:0]  Corr_data;
    output [DATA_WIDTH-1:0] DataOut;

endmodule