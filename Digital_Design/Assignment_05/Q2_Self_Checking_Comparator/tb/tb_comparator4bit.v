`timescale 1ns/1ps
module tb_comparator4bit;

reg [3:0] A, B;
wire GT, EQ, LT;
integer i, j;
integer errors;

comparator4bit DUT (
   .A(A),
   .B(B),
   .GT(GT),
   .EQ(EQ),
   .LT(LT)
);
initial begin
   errors = 0;
   A = 0;
   B = 0;

  $display("Time\t A\t B\t GT EQ LT");
  $monitor("%0t\t %d\t %d\t %b %b %b", $time, A, B, GT, EQ, LT);
  // Applying all 256 combinations
  for (i = 0; i < 16; i = i + 1) begin
     for (j = 0; j < 16; j = j + 1) begin
        A = i;
        B = j;
        #1;
        // Automatic PASS/FAIL checking
        if ((GT !== (i > j)) || (EQ !== (i == j)) || (LT !== (i < j)))
       begin
            $display("FAIL: A=%0d, B=%0d", i, j);
            errors = errors + 1;
        end
        else begin
            $display("PASS: A=%0d, B=%0d", i, j);
        end
        #9;
     end
  end
  $display("--------------------------------");
  $display("Total test cases = 256");
  $display("Total errors = %0d", errors);

  if (errors == 0)
      $display("ALL TESTS PASSED");
  else
      $display("SOME TESTS FAILED");

  $finish;
end
endmodule
