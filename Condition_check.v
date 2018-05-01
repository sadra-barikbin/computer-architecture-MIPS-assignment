module Condition_check(
    input [31:0] val1, src2_val,
    input [1:0] branch_type,
    output branch_taken
);

    assign branch_taken = ( (branch_type == 3 && val1 == 0) || 
                            (branch_type == 2 && val1 != src2_val) || 
                             branch_type == 1
                          ) ? 1 : 0; 


endmodule