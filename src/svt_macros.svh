`ifndef INCLUDED_SVT_MACROS_SVH
`define INCLUDED_SVT_MACROS_SVH

`define svt_test_decl(test_t) \
    static bit _``test_t``_registered = svt_test_factory_t #(test_t)::register(`"test_t`");
`endif /* INCLUDED_SVT_MACROS_SVH */
