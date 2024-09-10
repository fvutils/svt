`ifndef INCLUDED_SVT_MACROS_SVH
`define INCLUDED_SVT_MACROS_SVH

`define svt_test_decl(test_t) \
    static bit _``test_t``_registered = svt_test_factory_t #(test_t)::register(`"test_t`");

`define svt_fatal(msg) \
    $display("Fatal: %0s", msg); \
    $finish;

`define svt_assert_eq(exp, act) \
    if (exp != act) begin \
        $display("Error: %0s:%0d", `__FILE__, `__LINE__); \
    end

`endif /* INCLUDED_SVT_MACROS_SVH */
