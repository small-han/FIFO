/*

0  1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0
1  0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 
2  0 0 0 1 1 1 1 0 0 0 0 1 1 1 1 0 0 0 0 1 1 1 1 0 0 0 0 1 1 1 1 0
3  0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 
4  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
5  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1

*/
module ENCODE(DataIn, Corr_data);

  parameter ECC_WIDTH=5;
  parameter DATA_WIDTH=32;

  input   Reset_;
  input   Clock;
  input   [DATA_WIDTH-1:0]DataIn;
  output  [ECC_WIDTH-1:0] Corr_data;
  
  assign Corr_data[0] = Datain[0]^Datain[1]^Datain[2]^Datain[3]^Datain[4]^Datain[5]^Datain[6]^Datain[7]^Datain[8]^Datain[9]^Datain[10]^Datain[11]^Datain[12]^Datain[13]^Datain[14]^Datain[15]^Datain[16]^Datain[17]^Datain[18]^Datain[19]^Datain[20]^Datain[21]^Datain[22]^Datain[23]^Datain[24]^Datain[25]^Datain[26]^Datain[27]^Datain[28]^Datain[29]^Datain[30]^Datain[31];
  assign Corr_data[1] = Datain[1]^Datain[3]^Datain[5]^Datain[7]^Datain[9]^Datain[11]^Datain[13]^Datain[15]^Datain[17]^Datain[19]^Datain[21]^Datain[23]^Datain[25]^Datain[27]^Datain[29]^Datain[31];
  assign Corr_data[2] = Datain[2]^Datain[3]^Datain[6]^Datain[7]^Datain[10]^Datain[11]^Datain[14]^Datain[15]^Datain[18]^Datain[19]^Datain[22]^Datain[23]^Datain[26]^Datain[27]^Datain[30]^Datain[31];
  assign Corr_data[3] = Datain[4]^Datain[5]^Datain[6]^Datain[7]^Datain[12]^Datain[13]^Datain[14]^Datain[15]^Datain[20]^Datain[21]^Datain[22]^Datain[23]^Datain[28]^Datain[29]^Datain[30]^Datain[31];
  assign Corr_data[4] = Datain[8]^Datain[9]^Datain[10]^Datain[11]^Datain[12]^Datain[13]^Datain[14]^Datain[15]^Datain[24]^Datain[25]^Datain[26]^Datain[27]^Datain[28]^Datain[29]^Datain[30]^Datain[31];
  assign Corr_data[5] = Datain[16]^Datain[17]^Datain[18]^Datain[19]^Datain[20]^Datain[21]^Datain[22]^Datain[23]^Datain[24]^Datain[25]^Datain[26]^Datain[27]^Datain[28]^Datain[29]^Datain[30]^Datain[31];


endmodule