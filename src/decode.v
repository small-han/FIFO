module DECODE(Datain,Corr_data,Dataout,m_error);

    parameter ECC_WIDTH = 7;
    parameter DATA_WIDTH = 32;

    input  [DATA_WIDTH:1] Datain;
    input  [ECC_WIDTH-1:0]  Corr_data;
    output reg [DATA_WIDTH-1:0] Dataout;
    output reg m_error;

    reg [ECC_WIDTH-1:0] up_corr_data;
    reg [DATA_WIDTH+ECC_WIDTH:1] Datain_reg;
    always @(*) begin
        
        Datain_reg={Datain[32:27],Corr_data[6],Datain[26:12],Corr_data[5],Datain[11:5],Corr_data[4],Datain[4:2],Corr_data[3],Datain[1],Corr_data[2],Corr_data[1]};
        
        up_corr_data[0]=(^Datain_reg)^Corr_data[0];
        up_corr_data[1]=Datain_reg[1]^Datain_reg[3]^Datain_reg[5]^Datain_reg[7]^Datain_reg[9]^Datain_reg[11]^Datain_reg[13]^Datain_reg[15]^Datain_reg[17]^Datain_reg[19]^Datain_reg[21]^Datain_reg[23]^Datain_reg[25]^Datain_reg[27]^Datain_reg[29]^Datain_reg[31]^Datain_reg[33]^Datain_reg[35]^Datain_reg[37];
        up_corr_data[2]=Datain_reg[2]^Datain_reg[3]^Datain_reg[6]^Datain_reg[7]^Datain_reg[10]^Datain_reg[11]^Datain_reg[14]^Datain_reg[15]^Datain_reg[18]^Datain_reg[19]^Datain_reg[22]^Datain_reg[23]^Datain_reg[26]^Datain_reg[27]^Datain_reg[30]^Datain_reg[31]^Datain_reg[34]^Datain_reg[35]^Datain_reg[38];
        up_corr_data[3]=Datain_reg[4]^Datain_reg[5]^Datain_reg[6]^Datain_reg[7]^Datain_reg[12]^Datain_reg[13]^Datain_reg[14]^Datain_reg[15]^Datain_reg[20]^Datain_reg[21]^Datain_reg[22]^Datain_reg[23]^Datain_reg[28]^Datain_reg[29]^Datain_reg[30]^Datain_reg[31]^Datain_reg[36]^Datain_reg[37]^Datain_reg[38];
        up_corr_data[4]=Datain_reg[8]^Datain_reg[9]^Datain_reg[10]^Datain_reg[11]^Datain_reg[12]^Datain_reg[13]^Datain_reg[14]^Datain_reg[15]^Datain_reg[24]^Datain_reg[25]^Datain_reg[26]^Datain_reg[27]^Datain_reg[28]^Datain_reg[29]^Datain_reg[30]^Datain_reg[31];
        up_corr_data[5]=Datain_reg[16]^Datain_reg[17]^Datain_reg[18]^Datain_reg[19]^Datain_reg[20]^Datain_reg[21]^Datain_reg[22]^Datain_reg[23]^Datain_reg[24]^Datain_reg[25]^Datain_reg[26]^Datain_reg[27]^Datain_reg[28]^Datain_reg[29]^Datain_reg[30]^Datain_reg[31];
        up_corr_data[6]=Datain_reg[32]^Datain_reg[33]^Datain_reg[34]^Datain_reg[35]^Datain_reg[36]^Datain_reg[37]^Datain_reg[38];
        if (up_corr_data[6:0])
            if (up_corr_data[0])
                begin
                    Datain_reg[up_corr_data[6:1]]=~Datain_reg[up_corr_data[6:1]];
                    m_error=1;
                end
            else
                m_error=1;
        else
            m_error=0;
        Dataout={Datain_reg[38:33],Datain_reg[31:17],Datain_reg[15:9],Datain_reg[7:5],Datain_reg[3]};;
    end

endmodule