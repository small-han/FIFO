module DECODE(Datain,Corr_data,DataOut);

    parameter ECC_WIDTH = 5;
    parameter DATA_WIDTH = 32;

    input  [DATA_WIDTH-1:0] DataIn;
    input  [ECC_WIDTH-1:0]  Corr_data;
    output [DATA_WIDTH-1:0] DataOut;

    reg [ECC_WIDTH-1:0] up_corr_data;
    assign up_corr_data[0] = Datain[1]^Datain[3]^Datain[5]^Datain[7]^Datain[9]^Datain[11]^Datain[13]^Datain[15]^Datain[17]^Datain[19]^Datain[21]^Datain[23]^Datain[25]^Datain[27]^Datain[29]^Datain[31];

    assign up_corr_data[1] = Datain[2]^Datain[3]^Datain[6]^Datain[7]^Datain[10]^Datain[11]^Datain[14]^Datain[15]^Datain[18]^Datain[19]^Datain[22]^Datain[23]^Datain[26]^Datain[27]^Datain[30]^Datain[31];

    assign up_corr_data[2] = Datain[4]^Datain[5]^Datain[6]^Datain[7]^Datain[12]^Datain[13]^Datain[14]^Datain[15]^Datain[20]^Datain[21]^Datain[22]^Datain[23]^Datain[28]^Datain[29]^Datain[30]^Datain[31];

    assign up_corr_data[3] = Datain[8]^Datain[9]^Datain[10]^Datain[11]^Datain[12]^Datain[13]^Datain[14]^Datain[15]^Datain[24]^Datain[25]^Datain[26]^Datain[27]^Datain[28]^Datain[29]^Datain[30]^Datain[31];

    assign up_corr_data[4] = Datain[16]^Datain[17]^Datain[18]^Datain[19]^Datain[20]^Datain[21]^Datain[22]^Datain[23]^Datain[24]^Datain[25]^Datain[26]^Datain[27]^Datain[28]^Datain[29]^Datain[30]^Datain[31];

    assign up_corr_data[5]=

endmodule