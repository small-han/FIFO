      $display("Reset");
      Reset_ = 1'b0;
      ReadEn = 1'b0;
      WriteEn = 1'b0;
      #220
      Reset_ = 1'b1;

      // Reset flags check
      CheckFlags(.Empty(1'b0), .HalfFull(1'b1), .Full(1'b1));

      @(negedge Clock);

      // Write FIFO until full
      // Write to Half full
      repeat(FIFO_DEPTH/2)
        begin
          FifoTransfer(.Write(1'b1), .WData($random()), .Read(1'b0));
          //CheckFlags(.Empty(1'b1), .HalfFull(1'b1), .Full(1'b1));
        end

      // HalfFull flag check
      CheckFlags(.Empty(1'b1), .HalfFull(1'b0), .Full(1'b1));
      
      repeat(FIFO_DEPTH/2)
        begin
          FifoTransfer(.Write(1'b1), .WData($random()), .Read(1'b0));
          //CheckFlags(.Empty(1'b1), .HalfFull(1'b0), .Full(1'b0));
        end

      // Full flag
      CheckFlags(.Empty(1'b1), .HalfFull(1'b0), .Full(1'b0));

      // Check FIFO will not write when full
      FifoTransfer(.Write(1'b1), .WData($random()), .Read(1'b0)); 
      CheckFlags(.Empty(1'b1), .HalfFull(1'b0), .Full(1'b0));

      // Read FIFO until empty
      repeat(FIFO_DEPTH/2)
        begin
          FifoTransfer(.Write(1'b0), .WData(8'hx), .Read(1'b1));
          //CheckFlags(.Empty(1'b1), .HalfFull(1'b0), .Full(1'b1));
        end
      // HalfFull flag check
      CheckFlags(.Empty(1'b1), .HalfFull(1'b0), .Full(1'b1));

      repeat(FIFO_DEPTH/2)
        begin
          FifoTransfer(.Write(1'b0), .WData(8'hx), .Read(1'b1));
         // CheckFlags(.Empty(1'b1), .HalfFull(1'b1), .Full(1'b1));       /////////////////////////////////////////////////////
        end

      // Empty flag check
      CheckFlags(.Empty(1'b0), .HalfFull(1'b1), .Full(1'b1));

      // Check FIFO will not read when empty
      FifoTransfer(.Write(1'b0), .WData(8'hx), .Read(1'b1));
      CheckFlags(.Empty(1'b0), .HalfFull(1'b1), .Full(1'b1));

      repeat(FIFO_DEPTH*10)
        begin
          FifoTransfer(.Write($random()%2), .WData($random()), .Read($random()%2));
        end

      repeat(FIFO_DEPTH*10)
        begin
          if ($random()%3 <= 1)
            FifoTransfer(.Write(1), .WData($random()), .Read(0));
          else
            FifoTransfer(.Write(0), .WData($random()), .Read(1));
        end
      
      repeat(FIFO_DEPTH*10)
        begin
          if ($random()%3 >= 1)
            FifoTransfer(.Write(1), .WData($random()), .Read(0));
          else
            FifoTransfer(.Write(0), .WData($random()), .Read(1));
        end
      $display("Test done\n");
      $finish;
