select name,
        (misses/decode(gets,0,1,gets) )*100 "Get/Miss Ratio",
        (immediate_misses/decode(immediate_gets,0,1,
                                 immediate_gets))*100 "Imm Get/Miss Ratio",
        spin_gets,
        wait_time/1000000 as wait_seconds
        from v$latch
        where wait_time > 0
order by wait_time desc
/
