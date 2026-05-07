class alu_scoreboard extends uvm_scoreboard;
    `uvm_component_utils(alu_scoreboard)

    uvm_analysis_imp #(alu_transaction, alu_scoreboard) imp;

    function new(string name, uvm_component parent);
        super.new(name,parent);
        imp = new("imp", this);
    endfunction

    function void write(alu_transaction tr);
        bit [7:0] expected;

        case(tr.op)
            3'b000: expected = tr.a + tr.b;
            3'b001: expected = tr.a - tr.b;
            3'b010: expected = tr.a & tr.b;
            3'b011: expected = tr.a | tr.b;
            default: expected = 0;
        endcase

        if(tr.y != expected)
            `uvm_error("ALU", $sformatf("Mismatch: got=%0d exp=%0d", tr.y, expected))
        else
            `uvm_info("ALU", "PASS", UVM_LOW)
    endfunction
endclass