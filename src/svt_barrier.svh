
class svt_barrier;
    int count;
    semaphore       sem = new();

    function void raise_objection();
        count += 1;
    endfunction

    function void drop_objection();
        if (count) begin
            count -= 1;
        end
        if (!count) begin
            sem.put(1);
        end
    endfunction

    task wait_no_objections();
        while (count) begin
            sem.get(1);
        end
    endtask

endclass