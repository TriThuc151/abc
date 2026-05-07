class alu_transaction extends uvm_sequence_item;
    rand bit [7:0] a, b;
    rand bit [2:0] op;
         bit [7:0] y;

    `uvm_object_utils(alu_transaction)

    function new(string name="alu_transaction");
        super.new(name);
    endfunction
endclass