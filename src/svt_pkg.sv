
package svt_pkg;

    `include "svt_barrier.svh"
    `include "svt_component.svh"
    `include "svt_test.svh"

    svt_test_factory prv_test_rgy[string];

    function automatic void register_test_type(svt_test_factory f);
        prv_test_rgy[f.name] = f;
    endfunction

    task automatic svt_runtest();
        string testname;

        if (!$value$plusargs("SVT_TESTNAME=%s", testname)) begin
            $display("Error: +SVT_TESTNAME not specified");
            $finish;
        end else begin
            if (prv_test_rgy.exists(testname)) begin
                svt_test_factory factory = prv_test_rgy[testname];
                svt_test test = factory.create();
                svt_barrier barrier = new();
                $display("have test");
                #0;
                test.do_build();
                test.do_connect();
                test.do_run(barrier);

                $display("%0t --> wait_no_objections", $time);
                barrier.wait_no_objections();
                $display("%0t <-- wait_no_objections", $time);
            end else begin
                $display("Fatal: no test named %0s", testname);
                $finish;
            end
        end

        $display("svt_runtest");
    endtask


endpackage
