

class svt_test extends svt_component;

    function new(string name);
        super.new(name, null);
    endfunction

endclass

class svt_test_factory;
    string name;

    function new(string name);
        this.name = name;
    endfunction

    virtual function svt_test create();
    endfunction

endclass

class svt_test_factory_t #(type T=int) extends svt_test_factory;

    typedef svt_test_factory_t #(T) this_t;

    function new(string name);
        super.new(name);
    endfunction

    virtual function svt_test create();
        T test = new(name);
        return test;
    endfunction

    static function bit register(string name);
        this_t factory = new(name);
        register_test_type(factory);
        return 1'b1;
    endfunction

endclass