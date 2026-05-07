class alu_sequence extends uvm_sequence #(alu_transaction);
    `uvm_object_utils(alu_sequence)

    function new(string name="alu_sequence");
        super.new(name);
    endfunction

    task body();
        alu_transaction req;

        repeat(10) begin
            req = alu_transaction::type_id::create("req");

            start_item(req);

            req.a  = $urandom_range(0,255);
            req.b  = $urandom_range(0,255);
            req.op = $urandom_range(0,3);

            finish_item(req);
        end
    endtask
endclass