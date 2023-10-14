# siglen

## Testes por tamanho de siglen do index de GIST

### 6

```
================================================================================
                                                             216s elapsed
---- Requests ------------------------------------------------------------------
> Global                                                   (OK=90082  KO=16144 )
> criação                                                  (OK=44344  KO=10291 )
> busca válida                                             (OK=7835   KO=1755  )
> busca inválida                                           (OK=3501   KO=689   )
> consulta                                                 (OK=34402  KO=3409  )
---- Errors --------------------------------------------------------------------
> status.find.in(201,422,400), but actually found 502             10064 (62.34%)
> status.find.in([200, 209], 304), found 502                       5073 (31.42%)
> status.find.is(400), but actually found 502                       689 ( 4.27%)
> status.find.in(201,422,400), but actually found 500               227 ( 1.41%)
> status.find.in([200, 209], 304), found 500                         91 ( 0.56%)

---- Busca Inválida de Pessoas -------------------------------------------------
[##########################################################################]100%
          waiting: 0      / active: 0      / done: 4190
---- Busca Válida de Pessoas ---------------------------------------------------
[##########################################################################]100%
          waiting: 0      / active: 0      / done: 9590
---- Criação E Talvez Consulta de Pessoas --------------------------------------
[##########################################################################]100%
          waiting: 0      / active: 0      / done: 54635
================================================================================

Simulation RinhaBackendSimulation completed in 216 seconds
Parsing log file(s)...
Parsing log file(s) done
Generating reports...

================================================================================
---- Global Information --------------------------------------------------------
> request count                                     106226 (OK=90082  KO=16144 )
> min response time                                      0 (OK=0      KO=0     )
> max response time                                  10486 (OK=10486  KO=10095 )
> mean response time                                  1714 (OK=1986   KO=198   )
> std deviation                                       3025 (OK=3155   KO=1396  )
> response time 50th percentile                          2 (OK=2      KO=0     )
> response time 75th percentile                       2494 (OK=3888   KO=1     )
> response time 95th percentile                       8742 (OK=8779   KO=1     )
> response time 99th percentile                       9700 (OK=9544   KO=10049 )
> mean requests/sec                                489.521 (OK=415.124 KO=74.396)
---- Response Time Distribution ------------------------------------------------
> t < 800 ms                                         60158 ( 57%)
> 800 ms <= t < 1200 ms                                711 (  1%)
> t >= 1200 ms                                       29213 ( 28%)
> failed                                             16144 ( 15%)
---- Errors --------------------------------------------------------------------
> status.find.in(201,422,400), but actually found 502             10064 (62.34%)
> status.find.in([200, 209], 304), found 502                       5073 (31.42%)
> status.find.is(400), but actually found 502                       689 ( 4.27%)
> status.find.in(201,422,400), but actually found 500               227 ( 1.41%)
> status.find.in([200, 209], 304), found 500                         91 ( 0.56%)
================================================================================
A contagem de pessoas é: 37811
```

```
rinha=# \di+ pessoas_*
                                                           List of relations
 Schema |                    Name                    | Type  |  Owner   |  Table  | Persistence | Access method |  Size   | Description
--------+--------------------------------------------+-------+----------+---------+-------------+---------------+---------+-------------
 public | pessoas_apelido_index                      | index | postgres | pessoas | permanent   | btree         | 1992 kB |
 public | pessoas_busca_gist_trgm_ops_siglen_6_index | index | postgres | pessoas | permanent   | gist          | 25 MB   |
 public | pessoas_pkey                               | index | postgres | pessoas | permanent   | btree         | 1568 kB |
(3 rows)
```

### 12 (default)

```
================================================================================
---- Global Information --------------------------------------------------------
> request count                                     107180 (OK=92463  KO=14717 )
> min response time                                      0 (OK=0      KO=0     )
> max response time                                  10481 (OK=10481  KO=98    )
> mean response time                                  1100 (OK=1275   KO=0     )
> std deviation                                       2302 (OK=2433   KO=3     )
> response time 50th percentile                          2 (OK=2      KO=0     )
> response time 75th percentile                        298 (OK=1219   KO=1     )
> response time 95th percentile                       6952 (OK=7173   KO=1     )
> response time 99th percentile                       8491 (OK=8694   KO=1     )
> mean requests/sec                                510.381 (OK=440.3  KO=70.081)
---- Response Time Distribution ------------------------------------------------
> t < 800 ms                                         67785 ( 63%)
> 800 ms <= t < 1200 ms                               1425 (  1%)
> t >= 1200 ms                                       23253 ( 22%)
> failed                                             14717 ( 14%)
---- Errors --------------------------------------------------------------------
> status.find.in(201,422,400), but actually found 502              9239 (62.78%)
> status.find.in([200, 209], 304), found 502                       4848 (32.94%)
> status.find.is(400), but actually found 502                       630 ( 4.28%)
================================================================================
A contagem de pessoas é: 38765
```

```
rinha=# \di+ pessoas_*
                                                            List of relations
 Schema |                    Name                     | Type  |  Owner   |  Table  | Persistence | Access method |  Size   | Description
--------+---------------------------------------------+-------+----------+---------+-------------+---------------+---------+-------------
 public | pessoas_apelido_index                       | index | postgres | pessoas | permanent   | btree         | 2080 kB |
 public | pessoas_busca_gist_trgm_ops_siglen_12_index | index | postgres | pessoas | permanent   | gist          | 26 MB   |
 public | pessoas_pkey                                | index | postgres | pessoas | permanent   | btree         | 1536 kB |
(3 rows)
```

### 16

```
================================================================================
                                                             208s elapsed
---- Requests ------------------------------------------------------------------
> Global                                                   (OK=105660 KO=6074  )
> busca válida                                             (OK=8943   KO=647   )
> busca inválida                                           (OK=3932   KO=258   )
> criação                                                  (OK=50808  KO=3827  )
> consulta                                                 (OK=41977  KO=1342  )
---- Errors --------------------------------------------------------------------
> status.find.in(201,422,400), but actually found 502              3827 (63.01%)
> status.find.in([200, 209], 304), found 502                       1989 (32.75%)
> status.find.is(400), but actually found 502                       258 ( 4.25%)

---- Busca Inválida de Pessoas -------------------------------------------------
[##########################################################################]100%
          waiting: 0      / active: 0      / done: 4190
---- Busca Válida de Pessoas ---------------------------------------------------
[##########################################################################]100%
          waiting: 0      / active: 0      / done: 9590
---- Criação E Talvez Consulta de Pessoas --------------------------------------
[##########################################################################]100%
          waiting: 0      / active: 0      / done: 54635
================================================================================

Simulation RinhaBackendSimulation completed in 208 seconds
Parsing log file(s)...
Parsing log file(s) done
Generating reports...

================================================================================
---- Global Information --------------------------------------------------------
> request count                                     111734 (OK=105660 KO=6074  )
> min response time                                      0 (OK=0      KO=0     )
> max response time                                   6899 (OK=6899   KO=91    )
> mean response time                                   590 (OK=623    KO=1     )
> std deviation                                       1536 (OK=1573   KO=6     )
> response time 50th percentile                          2 (OK=2      KO=0     )
> response time 75th percentile                         39 (OK=73     KO=1     )
> response time 95th percentile                       5203 (OK=5298   KO=2     )
> response time 99th percentile                       6300 (OK=6314   KO=36    )
> mean requests/sec                                534.612 (OK=505.55 KO=29.062)
---- Response Time Distribution ------------------------------------------------
> t < 800 ms                                         89532 ( 80%)
> 800 ms <= t < 1200 ms                               1079 (  1%)
> t >= 1200 ms                                       15049 ( 13%)
> failed                                              6074 (  5%)
---- Errors --------------------------------------------------------------------
> status.find.in(201,422,400), but actually found 502              3827 (63.01%)
> status.find.in([200, 209], 304), found 502                       1989 (32.75%)
> status.find.is(400), but actually found 502                       258 ( 4.25%)
================================================================================
A contagem de pessoas é: 43319
```

```
rinha=# \di+ pessoas_*
                                                            List of relations
 Schema |                    Name                     | Type  |  Owner   |  Table  | Persistence | Access method |  Size   | Description
--------+---------------------------------------------+-------+----------+---------+-------------+---------------+---------+-------------
 public | pessoas_apelido_index                       | index | postgres | pessoas | permanent   | btree         | 2224 kB |
 public | pessoas_busca_gist_trgm_ops_siglen_16_index | index | postgres | pessoas | permanent   | gist          | 21 MB   |
 public | pessoas_pkey                                | index | postgres | pessoas | permanent   | btree         | 1832 kB |
(3 rows)

```

### 24

```
================================================================================
                                                             206s elapsed
---- Requests ------------------------------------------------------------------
> Global                                                   (OK=104395 KO=6945  )
> criação                                                  (OK=50323  KO=4312  )
> busca inválida                                           (OK=3900   KO=290   )
> busca válida                                             (OK=8860   KO=730   )
> consulta                                                 (OK=41312  KO=1613  )
---- Errors --------------------------------------------------------------------
> status.find.in(201,422,400), but actually found 502              4312 (62.09%)
> status.find.in([200, 209], 304), found 502                       2343 (33.74%)
> status.find.is(400), but actually found 502                       290 ( 4.18%)

---- Busca Inválida de Pessoas -------------------------------------------------
[##########################################################################]100%
          waiting: 0      / active: 0      / done: 4190
---- Busca Válida de Pessoas ---------------------------------------------------
[##########################################################################]100%
          waiting: 0      / active: 0      / done: 9590
---- Criação E Talvez Consulta de Pessoas --------------------------------------
[##########################################################################]100%
          waiting: 0      / active: 0      / done: 54635
================================================================================

Simulation RinhaBackendSimulation completed in 206 seconds
Parsing log file(s)...
Parsing log file(s) done
Generating reports...

================================================================================
---- Global Information --------------------------------------------------------
> request count                                     111340 (OK=104395 KO=6945  )
> min response time                                      0 (OK=0      KO=0     )
> max response time                                   6695 (OK=6695   KO=88    )
> mean response time                                   534 (OK=570    KO=2     )
> std deviation                                       1336 (OK=1372   KO=8     )
> response time 50th percentile                          3 (OK=3      KO=0     )
> response time 75th percentile                        116 (OK=140    KO=1     )
> response time 95th percentile                       4127 (OK=4212   KO=3     )
> response time 99th percentile                       5976 (OK=6006   KO=51    )
> mean requests/sec                                537.874 (OK=504.324 KO=33.551)
---- Response Time Distribution ------------------------------------------------
> t < 800 ms                                         87964 ( 79%)
> 800 ms <= t < 1200 ms                               1674 (  2%)
> t >= 1200 ms                                       14757 ( 13%)
> failed                                              6945 (  6%)
---- Errors --------------------------------------------------------------------
> status.find.in(201,422,400), but actually found 502              4312 (62.09%)
> status.find.in([200, 209], 304), found 502                       2343 (33.74%)
> status.find.is(400), but actually found 502                       290 ( 4.18%)
================================================================================
A contagem de pessoas é: 42925
```

```
rinha=# \di+ pessoas_*
                                                            List of relations
 Schema |                    Name                     | Type  |  Owner   |  Table  | Persistence | Access method |  Size   | Description
--------+---------------------------------------------+-------+----------+---------+-------------+---------------+---------+-------------
 public | pessoas_apelido_index                       | index | postgres | pessoas | permanent   | btree         | 2200 kB |
 public | pessoas_busca_gist_trgm_ops_siglen_24_index | index | postgres | pessoas | permanent   | gist          | 19 MB   |
 public | pessoas_pkey                                | index | postgres | pessoas | permanent   | btree         | 1824 kB |
(3 rows)
```

### 48

Testei duas vezes só pra garantir, mas o mesmo resultado

```
================================================================================
---- Global Information --------------------------------------------------------
> request count                                     114980 (OK=114980 KO=0     )
> min response time                                      0 (OK=0      KO=-     )
> max response time                                   2378 (OK=2378   KO=-     )
> mean response time                                   172 (OK=172    KO=-     )
> std deviation                                        397 (OK=397    KO=-     )
> response time 50th percentile                          3 (OK=3      KO=-     )
> response time 75th percentile                        136 (OK=136    KO=-     )
> response time 95th percentile                       1172 (OK=1172   KO=-     )
> response time 99th percentile                       2017 (OK=2017   KO=-     )
> mean requests/sec                                552.788 (OK=552.788 KO=-     )
---- Response Time Distribution ------------------------------------------------
> t < 800 ms                                        107426 ( 93%)
> 800 ms <= t < 1200 ms                               1957 (  2%)
> t >= 1200 ms                                        5597 (  5%)
> failed                                                 0 (  0%)
================================================================================
A contagem de pessoas é: 46565
```

Porque o tamanho do index é menor? Só Deus sabe...

```
rinha=# \di+ pessoas_*
                                                            List of relations
 Schema |                    Name                     | Type  |  Owner   |  Table  | Persistence | Access method |  Size   | Description
--------+---------------------------------------------+-------+----------+---------+-------------+---------------+---------+-------------
 public | pessoas_apelido_index                       | index | postgres | pessoas | permanent   | btree         | 2232 kB |
 public | pessoas_busca_gist_trgm_ops_siglen_48_index | index | postgres | pessoas | permanent   | gist          | 18 MB   |
 public | pessoas_pkey                                | index | postgres | pessoas | permanent   | btree         | 1976 kB |
(3 rows)
```

### 64

Por algum motivo ficou pior??? Testei três vezes...

```
================================================================================
                                                             207s elapsed
---- Requests ------------------------------------------------------------------
> Global                                                   (OK=103535 KO=7423  )
> busca válida                                             (OK=8804   KO=786   )
> busca inválida                                           (OK=3874   KO=316   )
> criação                                                  (OK=49923  KO=4712  )
> consulta                                                 (OK=40934  KO=1609  )
---- Errors --------------------------------------------------------------------
> status.find.in(201,422,400), but actually found 502              4712 (63.48%)
> status.find.in([200, 209], 304), found 502                       2395 (32.26%)
> status.find.is(400), but actually found 502                       316 ( 4.26%)

---- Busca Inválida de Pessoas -------------------------------------------------
[##########################################################################]100%
          waiting: 0      / active: 0      / done: 4190
---- Busca Válida de Pessoas ---------------------------------------------------
[##########################################################################]100%
          waiting: 0      / active: 0      / done: 9590
---- Criação E Talvez Consulta de Pessoas --------------------------------------
[##########################################################################]100%
          waiting: 0      / active: 0      / done: 54635
================================================================================

Simulation RinhaBackendSimulation completed in 207 seconds
Parsing log file(s)...
Parsing log file(s) done
Generating reports...

================================================================================
---- Global Information --------------------------------------------------------
> request count                                     110958 (OK=103535 KO=7423  )
> min response time                                      0 (OK=0      KO=0     )
> max response time                                   7353 (OK=7353   KO=123   )
> mean response time                                   614 (OK=658    KO=1     )
> std deviation                                       1452 (OK=1493   KO=5     )
> response time 50th percentile                          3 (OK=3      KO=0     )
> response time 75th percentile                        171 (OK=183    KO=1     )
> response time 95th percentile                       4375 (OK=4545   KO=1     )
> response time 99th percentile                       6623 (OK=6672   KO=17    )
> mean requests/sec                                533.452 (OK=497.764 KO=35.688)
---- Response Time Distribution ------------------------------------------------
> t < 800 ms                                         84152 ( 76%)
> 800 ms <= t < 1200 ms                               1970 (  2%)
> t >= 1200 ms                                       17413 ( 16%)
> failed                                              7423 (  7%)
---- Errors --------------------------------------------------------------------
> status.find.in(201,422,400), but actually found 502              4712 (63.48%)
> status.find.in([200, 209], 304), found 502                       2395 (32.26%)
> status.find.is(400), but actually found 502                       316 ( 4.26%)
================================================================================
A contagem de pessoas é: 42543
```

```
rinha=# \di+ pessoas_*
                                                            List of relations
 Schema |                    Name                     | Type  |  Owner   |  Table  | Persistence | Access method |  Size   | Description
--------+---------------------------------------------+-------+----------+---------+-------------+---------------+---------+-------------
 public | pessoas_apelido_index                       | index | postgres | pessoas | permanent   | btree         | 2200 kB |
 public | pessoas_busca_gist_trgm_ops_siglen_64_index | index | postgres | pessoas | permanent   | gist          | 17 MB   |
 public | pessoas_pkey                                | index | postgres | pessoas | permanent   | btree         | 1864 kB |
(3 rows)
```

### 96

```
================================================================================
                                                             210s elapsed
---- Requests ------------------------------------------------------------------
> Global                                                   (OK=111520 KO=2738  )
> busca válida                                             (OK=9458   KO=132   )
> busca inválida                                           (OK=4139   KO=51    )
> criação                                                  (OK=53794  KO=841   )
> consulta                                                 (OK=44129  KO=1714  )
---- Errors --------------------------------------------------------------------
> status.find.in([200, 209], 304), found 502                       1846 (67.42%)
> status.find.in(201,422,400), but actually found 502               841 (30.72%)
> status.find.is(400), but actually found 502                        51 ( 1.86%)

---- Busca Inválida de Pessoas -------------------------------------------------
[##########################################################################]100%
          waiting: 0      / active: 0      / done: 4190
---- Busca Válida de Pessoas ---------------------------------------------------
[##########################################################################]100%
          waiting: 0      / active: 0      / done: 9590
---- Criação E Talvez Consulta de Pessoas --------------------------------------
[##########################################################################]100%
          waiting: 0      / active: 0      / done: 54635
================================================================================

Simulation RinhaBackendSimulation completed in 210 seconds
Parsing log file(s)...
Parsing log file(s) done
Generating reports...

================================================================================
---- Global Information --------------------------------------------------------
> request count                                     114258 (OK=111520 KO=2738  )
> min response time                                      0 (OK=0      KO=0     )
> max response time                                   6784 (OK=6784   KO=95    )
> mean response time                                   534 (OK=547    KO=3     )
> std deviation                                       1252 (OK=1265   KO=11    )
> response time 50th percentile                          3 (OK=4      KO=0     )
> response time 75th percentile                        194 (OK=204    KO=1     )
> response time 95th percentile                       3690 (OK=3745   KO=11    )
> response time 99th percentile                       5876 (OK=5883   KO=75    )
> mean requests/sec                                541.507 (OK=528.531 KO=12.976)
---- Response Time Distribution ------------------------------------------------
> t < 800 ms                                         93795 ( 82%)
> 800 ms <= t < 1200 ms                               1262 (  1%)
> t >= 1200 ms                                       16463 ( 14%)
> failed                                              2738 (  2%)
---- Errors --------------------------------------------------------------------
> status.find.in([200, 209], 304), found 502                       1846 (67.42%)
> status.find.in(201,422,400), but actually found 502               841 (30.72%)
> status.find.is(400), but actually found 502                        51 ( 1.86%)
================================================================================
A contagem de pessoas é: 45843
```

```
rinha=# \di+ pessoas_*
                                                            List of relations
 Schema |                    Name                     | Type  |  Owner   |  Table  | Persistence | Access method |  Size   | Description
--------+---------------------------------------------+-------+----------+---------+-------------+---------------+---------+-------------
 public | pessoas_apelido_index                       | index | postgres | pessoas | permanent   | btree         | 2232 kB |
 public | pessoas_busca_gist_trgm_ops_siglen_96_index | index | postgres | pessoas | permanent   | gist          | 18 MB   |
 public | pessoas_pkey                                | index | postgres | pessoas | permanent   | btree         | 1960 kB |
(3 rows)
```

### 128

```
================================================================================
                                                             206s elapsed
---- Requests ------------------------------------------------------------------
> Global                                                   (OK=114980 KO=0     )
> busca inválida                                           (OK=4190   KO=0     )
> busca válida                                             (OK=9590   KO=0     )
> criação                                                  (OK=54635  KO=0     )
> consulta                                                 (OK=46565  KO=0     )

---- Busca Inválida de Pessoas -------------------------------------------------
[##########################################################################]100%
          waiting: 0      / active: 0      / done: 4190
---- Busca Válida de Pessoas ---------------------------------------------------
[##########################################################################]100%
          waiting: 0      / active: 0      / done: 9590
---- Criação E Talvez Consulta de Pessoas --------------------------------------
[##########################################################################]100%
          waiting: 0      / active: 0      / done: 54635
================================================================================

Simulation RinhaBackendSimulation completed in 206 seconds
Parsing log file(s)...
Parsing log file(s) done
Generating reports...

================================================================================
---- Global Information --------------------------------------------------------
> request count                                     114980 (OK=114980 KO=0     )
> min response time                                      0 (OK=0      KO=-     )
> max response time                                   2479 (OK=2479   KO=-     )
> mean response time                                   186 (OK=186    KO=-     )
> std deviation                                        326 (OK=326    KO=-     )
> response time 50th percentile                          3 (OK=3      KO=-     )
> response time 75th percentile                        243 (OK=242    KO=-     )
> response time 95th percentile                       1015 (OK=1015   KO=-     )
> response time 99th percentile                       1396 (OK=1396   KO=-     )
> mean requests/sec                                555.459 (OK=555.459 KO=-     )
---- Response Time Distribution ------------------------------------------------
> t < 800 ms                                        106615 ( 93%)
> 800 ms <= t < 1200 ms                               5512 (  5%)
> t >= 1200 ms                                        2853 (  2%)
> failed                                                 0 (  0%)
================================================================================
A contagem de pessoas é: 46565
```

```
rinha=# \di+ pessoas_*
                                                            List of relations
 Schema |                     Name                     | Type  |  Owner   |  Table  | Persistence | Access method |  Size   | Description
--------+----------------------------------------------+-------+----------+---------+-------------+---------------+---------+-------------
 public | pessoas_apelido_index                        | index | postgres | pessoas | permanent   | btree         | 2232 kB |
 public | pessoas_busca_gist_trgm_ops_siglen_128_index | index | postgres | pessoas | permanent   | gist          | 18 MB   |
 public | pessoas_pkey                                 | index | postgres | pessoas | permanent   | btree         | 2024 kB |
(3 rows)
```

### 256

```
================================================================================
                                                             205s elapsed
---- Requests ------------------------------------------------------------------
> Global                                                   (OK=114980 KO=0     )
> criação                                                  (OK=54635  KO=0     )
> busca inválida                                           (OK=4190   KO=0     )
> busca válida                                             (OK=9590   KO=0     )
> consulta                                                 (OK=46565  KO=0     )

---- Busca Inválida de Pessoas -------------------------------------------------
[##########################################################################]100%
          waiting: 0      / active: 0      / done: 4190
---- Busca Válida de Pessoas ---------------------------------------------------
[##########################################################################]100%
          waiting: 0      / active: 0      / done: 9590
---- Criação E Talvez Consulta de Pessoas --------------------------------------
[##########################################################################]100%
          waiting: 0      / active: 0      / done: 54635
================================================================================

Simulation RinhaBackendSimulation completed in 205 seconds
Parsing log file(s)...
Parsing log file(s) done
Generating reports...

================================================================================
---- Global Information --------------------------------------------------------
> request count                                     114980 (OK=114980 KO=0     )
> min response time                                      0 (OK=0      KO=-     )
> max response time                                    978 (OK=978    KO=-     )
> mean response time                                    61 (OK=61     KO=-     )
> std deviation                                         98 (OK=98     KO=-     )
> response time 50th percentile                          3 (OK=3      KO=-     )
> response time 75th percentile                         97 (OK=97     KO=-     )
> response time 95th percentile                        269 (OK=269    KO=-     )
> response time 99th percentile                        400 (OK=400    KO=-     )
> mean requests/sec                                558.155 (OK=558.155 KO=-     )
---- Response Time Distribution ------------------------------------------------
> t < 800 ms                                        114945 (100%)
> 800 ms <= t < 1200 ms                                 35 (  0%)
> t >= 1200 ms                                           0 (  0%)
> failed                                                 0 (  0%)
================================================================================
A contagem de pessoas é: 46565
```

```
rinha=# \di+ pessoas_*
                                                            List of relations
 Schema |                     Name                     | Type  |  Owner   |  Table  | Persistence | Access method |  Size   | Description
--------+----------------------------------------------+-------+----------+---------+-------------+---------------+---------+-------------
 public | pessoas_apelido_index                        | index | postgres | pessoas | permanent   | btree         | 2232 kB |
 public | pessoas_busca_gist_trgm_ops_siglen_256_index | index | postgres | pessoas | permanent   | gist          | 18 MB   |
 public | pessoas_pkey                                 | index | postgres | pessoas | permanent   | btree         | 1920 kB |
(3 rows)
```

### 512

```
================================================================================
                                                             205s elapsed
---- Requests ------------------------------------------------------------------
> Global                                                   (OK=114544 KO=0     )
> busca inválida                                           (OK=4183   KO=0     )
> busca válida                                             (OK=9570   KO=0     )
> criação                                                  (OK=54508  KO=0     )
> consulta                                                 (OK=46283  KO=0     )

---- Busca Inválida de Pessoas -------------------------------------------------
[#########################################################################-] 99%
          waiting: 0      / active: 7      / done: 4183
---- Busca Válida de Pessoas ---------------------------------------------------
[#########################################################################-] 99%
          waiting: 0      / active: 20     / done: 9570
---- Criação E Talvez Consulta de Pessoas --------------------------------------
[#########################################################################-] 99%
          waiting: 0      / active: 305    / done: 54330
================================================================================


================================================================================
2023-10-13 20:58:03                                         205s elapsed
---- Requests ------------------------------------------------------------------
> Global                                                   (OK=114980 KO=0     )
> busca inválida                                           (OK=4190   KO=0     )
> busca válida                                             (OK=9590   KO=0     )
> criação                                                  (OK=54635  KO=0     )
> consulta                                                 (OK=46565  KO=0     )

---- Busca Inválida de Pessoas -------------------------------------------------
[##########################################################################]100%
          waiting: 0      / active: 0      / done: 4190
---- Busca Válida de Pessoas ---------------------------------------------------
[##########################################################################]100%
          waiting: 0      / active: 0      / done: 9590
---- Criação E Talvez Consulta de Pessoas --------------------------------------
[##########################################################################]100%
          waiting: 0      / active: 0      / done: 54635
================================================================================

Simulation RinhaBackendSimulation completed in 205 seconds
Parsing log file(s)...
Parsing log file(s) done
Generating reports...

================================================================================
---- Global Information --------------------------------------------------------
> request count                                     114980 (OK=114980 KO=0     )
> min response time                                      0 (OK=0      KO=-     )
> max response time                                   1178 (OK=1178   KO=-     )
> mean response time                                    57 (OK=57     KO=-     )
> std deviation                                         98 (OK=98     KO=-     )
> response time 50th percentile                          2 (OK=2      KO=-     )
> response time 75th percentile                         90 (OK=90     KO=-     )
> response time 95th percentile                        264 (OK=264    KO=-     )
> response time 99th percentile                        420 (OK=419    KO=-     )
> mean requests/sec                                558.155 (OK=558.155 KO=-     )
---- Response Time Distribution ------------------------------------------------
> t < 800 ms                                        114926 (100%)
> 800 ms <= t < 1200 ms                                 54 (  0%)
> t >= 1200 ms                                           0 (  0%)
> failed                                                 0 (  0%)
================================================================================
A contagem de pessoas é: 46565
```

```
rinha=# \di+ pessoas_*
                                                            List of relations
 Schema |                     Name                     | Type  |  Owner   |  Table  | Persistence | Access method |  Size   | Description
--------+----------------------------------------------+-------+----------+---------+-------------+---------------+---------+-------------
 public | pessoas_apelido_index                        | index | postgres | pessoas | permanent   | btree         | 2232 kB |
 public | pessoas_busca_gist_trgm_ops_siglen_512_index | index | postgres | pessoas | permanent   | gist          | 22 MB   |
 public | pessoas_pkey                                 | index | postgres | pessoas | permanent   | btree         | 2032 kB |
(3 rows)
```

### 1024

```
================================================================================
                                                             205s elapsed
---- Requests ------------------------------------------------------------------
> Global                                                   (OK=114980 KO=0     )
> busca válida                                             (OK=9590   KO=0     )
> busca inválida                                           (OK=4190   KO=0     )
> criação                                                  (OK=54635  KO=0     )
> consulta                                                 (OK=46565  KO=0     )

---- Busca Inválida de Pessoas -------------------------------------------------
[##########################################################################]100%
          waiting: 0      / active: 0      / done: 4190
---- Busca Válida de Pessoas ---------------------------------------------------
[##########################################################################]100%
          waiting: 0      / active: 0      / done: 9590
---- Criação E Talvez Consulta de Pessoas --------------------------------------
[##########################################################################]100%
          waiting: 0      / active: 0      / done: 54635
================================================================================

Simulation RinhaBackendSimulation completed in 205 seconds
Parsing log file(s)...
Parsing log file(s) done
Generating reports...

================================================================================
---- Global Information --------------------------------------------------------
> request count                                     114980 (OK=114980 KO=0     )
> min response time                                      0 (OK=0      KO=-     )
> max response time                                    961 (OK=961    KO=-     )
> mean response time                                    56 (OK=56     KO=-     )
> std deviation                                         89 (OK=89     KO=-     )
> response time 50th percentile                          3 (OK=3      KO=-     )
> response time 75th percentile                         90 (OK=90     KO=-     )
> response time 95th percentile                        243 (OK=243    KO=-     )
> response time 99th percentile                        385 (OK=385    KO=-     )
> mean requests/sec                                558.155 (OK=558.155 KO=-     )
---- Response Time Distribution ------------------------------------------------
> t < 800 ms                                        114968 (100%)
> 800 ms <= t < 1200 ms                                 12 (  0%)
> t >= 1200 ms                                           0 (  0%)
> failed                                                 0 (  0%)
================================================================================
A contagem de pessoas é: 46565
```

```
rinha=# \di+ pessoas_*
                                                             List of relations
 Schema |                     Name                      | Type  |  Owner   |  Table  | Persistence | Access method |  Size   | Description
--------+-----------------------------------------------+-------+----------+---------+-------------+---------------+---------+-------------
 public | pessoas_apelido_index                         | index | postgres | pessoas | permanent   | btree         | 2232 kB |
 public | pessoas_busca_gist_trgm_ops_siglen_1024_index | index | postgres | pessoas | permanent   | gist          | 20 MB   |
 public | pessoas_pkey                                  | index | postgres | pessoas | permanent   | btree         | 2040 kB |
(3 rows)
```

### 2024 (máximo)

```
================================================================================
                                                             205s elapsed
---- Requests ------------------------------------------------------------------
> Global                                                   (OK=114980 KO=0     )
> busca inválida                                           (OK=4190   KO=0     )
> busca válida                                             (OK=9590   KO=0     )
> criação                                                  (OK=54635  KO=0     )
> consulta                                                 (OK=46565  KO=0     )

---- Busca Inválida de Pessoas -------------------------------------------------
[##########################################################################]100%
          waiting: 0      / active: 0      / done: 4190
---- Busca Válida de Pessoas ---------------------------------------------------
[##########################################################################]100%
          waiting: 0      / active: 0      / done: 9590
---- Criação E Talvez Consulta de Pessoas --------------------------------------
[##########################################################################]100%
          waiting: 0      / active: 0      / done: 54635
================================================================================

Simulation RinhaBackendSimulation completed in 205 seconds
Parsing log file(s)...
Parsing log file(s) done
Generating reports...

================================================================================
---- Global Information --------------------------------------------------------
> request count                                     114980 (OK=114980 KO=0     )
> min response time                                      0 (OK=0      KO=-     )
> max response time                                   1081 (OK=1081   KO=-     )
> mean response time                                    69 (OK=69     KO=-     )
> std deviation                                        116 (OK=116    KO=-     )
> response time 50th percentile                          2 (OK=2      KO=-     )
> response time 75th percentile                         98 (OK=98     KO=-     )
> response time 95th percentile                        301 (OK=301    KO=-     )
> response time 99th percentile                        490 (OK=490    KO=-     )
> mean requests/sec                                558.155 (OK=558.155 KO=-     )
---- Response Time Distribution ------------------------------------------------
> t < 800 ms                                        114927 (100%)
> 800 ms <= t < 1200 ms                                 53 (  0%)
> t >= 1200 ms                                           0 (  0%)
> failed                                                 0 (  0%)
================================================================================
A contagem de pessoas é: 46565
```

```
rinha=# \di+ pessoas_*
                                                             List of relations
 Schema |                     Name                      | Type  |  Owner   |  Table  | Persistence | Access method |  Size   | Description
--------+-----------------------------------------------+-------+----------+---------+-------------+---------------+---------+-------------
 public | pessoas_apelido_index                         | index | postgres | pessoas | permanent   | btree         | 2232 kB |
 public | pessoas_busca_gist_trgm_ops_siglen_2024_index | index | postgres | pessoas | permanent   | gist          | 27 MB   |
 public | pessoas_pkey                                  | index | postgres | pessoas | permanent   | btree         | 2008 kB |
(3 rows)
```

## Conclusões

- O siglen de tamanho a partir de 128 bytes parecem ser o tamanho mínimo para ter uma performance ideal, e começa a ter _diminishing returns_ a partir de 256.
- Por alguma razão o siglen de 48 bytes é estranhamente melhor que até tamanhos maioes, nem idéia de o porquê, mesmo testando mais de uma vez não houve nenhuma difereça
- Os siglen entre 48 e 128 tem uma degradação de performance inesperadamente, alguns casos testei mais de uma vez, mas nenhumaa diferença
- O tamanho do index do postgres parece ser inesperadamente menor do que deveria em alguns casos
