module FIFO_SM #( parameter OBSERVE_WIDTH = 8 )
  (
    input                   Reset_,
    input                   Clock,
    input [OBSERVE_WIDTH-1:0] observe_signals,
    output detected_error
);

  assign detected_error = 0;

endmodule

