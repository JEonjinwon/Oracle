UPDATE lecture
    SET
        a = b
WHERE
    lec_code =:v0
    AND   sub_code =:v1
    AND   mem_id =:v2
    AND   lec_time =:v3
    AND   lec_full =:v4
    AND   lec_nmt =:v5
    AND   room_code =:v6
    AND   lec_grd =:v7
    AND   lec_days =:v8
    AND   lec_mbk =:v9
    AND   lec_sbk =:v10;