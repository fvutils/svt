
class svt_component;
    string              name;
    svt_component       parent;
    svt_component       children[$];

    function new(string name, svt_component parent);
        this.name = name;
        this.parent = parent;
        if (parent != null) begin
            parent.children.push_back(this);
        end
    endfunction

    virtual function void build();
    endfunction

    virtual function void connect();
    endfunction

    virtual task run(svt_barrier barrier);
    endtask

    function void do_build();
        foreach (children[i]) begin
            children[i].do_build();
        end
        build();
    endfunction

    function void do_connect();
        foreach (children[i]) begin
            children[i].do_connect();
        end
        connect();
    endfunction

    virtual task do_run(svt_barrier barrier);
        foreach (children[i]) begin
            children[i].do_run(barrier);
        end
        barrier.raise_objection();
        fork
            barrier.drop_objection();
            run(barrier);
        join_none
    endtask

endclass
