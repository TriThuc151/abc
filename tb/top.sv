module top;
    import uvm_pkg::*;
    import alu_pkg::*;
    `include "uvm_macros.svh"

    alu_if vif();

    alu dut(
        .a(vif.a),
        .b(vif.b),
        .op(vif.op),
        .y(vif.y)
    );

    initial begin
        uvm_config_db#(virtual alu_if)::set(null, "*", "vif", vif);
        run_test("alu_test");
    end
endmodule