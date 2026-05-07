class alu_monitor extends uvm_monitor;
    `uvm_component_utils(alu_monitor)

    virtual alu_if vif;
    uvm_analysis_port #(alu_transaction) ap;

    function new(string name="alu_monitor", uvm_component parent=null);
        super.new(name, parent);
        ap = new("ap", this);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        if (!uvm_config_db#(virtual alu_if)::get(this, "", "vif", vif))
            `uvm_fatal("MON", "Virtual interface not set")
    endfunction

    task run_phase(uvm_phase phase);
        alu_transaction tr;

        forever begin
            #10;

            tr = alu_transaction::type_id::create("tr");

            tr.a  = vif.a;
            tr.b  = vif.b;
            tr.op = vif.op;
            tr.y  = vif.y;

            ap.write(tr);
        end
    endtask
endclass