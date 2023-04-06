//testbench for fifo
`timescale 1ns/1ns

module test;

  parameter FIFO_DEPTH = 16;
  parameter DATA_WIDTH = 32; 

  reg                   Clock;
  reg                   Reset_;
  reg                   WriteEn;
  reg                   ReadEn;
  reg  [DATA_WIDTH-1:0] DataIn;
  wire [DATA_WIDTH-1:0] DataOut;
  wire                  FifoEmpty;
  wire                  FifoHalfFull;
  wire                  FifoFull;
  wire                  Error;

  int                   golden_data[$];
  int                   temp_data;

  `include "strobe.sv" 

  FIFO #(.FIFO_DEPTH(FIFO_DEPTH), .DATA_WIDTH(DATA_WIDTH)) DUT 
  (
    .Reset_(Reset_),
    .ReadClk(Clock),
    .WriteClk(Clock),
    .WriteEn(WriteEn),
    .DataIn(DataIn),
    .ReadEn(ReadEn),
    .DataOut(DataOut),
    .Empty_(FifoEmpty),
    .HalfFull_(FifoHalfFull),
    .Full_(FifoFull)
  );

  FIFO_SM #(.OBSERVE_WIDTH(8)) DUT_SM
  (
    .Reset_(Reset_),
    .Clock(Clock),
    .observe_signals(8'h0),  // input the signals you need to observe
    .detected_error(Error)   // output Error signal when SM detect a fault
  );

  integer i;
  initial
    begin
      // Initialize Memory
      for (int i=0; i < FIFO_DEPTH; i++)
      begin
         #1 test.DUT.sdpram_i1.sdpram_i1.mem_array[i] <= {DATA_WIDTH {1'h0}};
      end
      
      if($test$plusargs("test1"))
      begin
        $display("Using test1");
        `include "./test1.v"
      end
      if($test$plusargs("test2"))
      begin
          $display("Using test2");
         `include "./test2.v"
      end
      if($test$plusargs("test3"))
      begin
          $display("Using test3");
         `include "./test3.v"
      end
       $display("Calling finish");
      #10 $finish;
    end

initial begin
      $fsdbDumpfile("fifo.fsdb");
      $fsdbDumpvars(0,test.DUT);
end


endmodule
