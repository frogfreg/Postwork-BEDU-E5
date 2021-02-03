# Postwork Equipo 5

## Sesión 1

1.  Importa los datos de soccer de la temporada 2019/2020 de la primera
    división de la liga española a R, los datos los puedes encontrar en
    el siguiente enlace: <https://www.football-data.co.uk/spainm.php>

<!-- end list -->

``` r
soccer <-
  read.csv("https://www.football-data.co.uk/mmz4281/1920/SP1.csv")
```

2.  Del data frame que resulta de importar los datos a R, extrae las
    columnas que contienen los números de goles anotados por los equipos
    que jugaron en casa (FTHG) y los goles anotados por los equipos que
    jugaron como visitante (FTAG)

<!-- end list -->

``` r
Goles_casa <- soccer$FTHG

Goles_visitante <- soccer$FTAG
```

3.  Consulta como funciona la función table en R al ejecutar en la
    consola ?table

Primero realizo las tablas de los goles de casa y goles de visitante

``` r
Tabla_1 <- table(Goles_casa)
Tabla_1
```

    ## Goles_casa
    ##   0   1   2   3   4   5   6 
    ##  88 132  99  38  14   8   1

``` r
Tabla_2 <- table(Goles_visitante)
Tabla_2
```

    ## Goles_visitante
    ##   0   1   2   3   4   5 
    ## 136 134  81  18   9   2

Usando las tablas anteriores elaboro las tablas de frecuencia relativas
en base a los goles

``` r
Tabla_3 <- prop.table(x = Tabla_1)
Tabla_3
```

    ## Goles_casa
    ##           0           1           2           3           4           5 
    ## 0.231578947 0.347368421 0.260526316 0.100000000 0.036842105 0.021052632 
    ##           6 
    ## 0.002631579

``` r
Tabla_4 <- prop.table(x = Tabla_2)
Tabla_4
```

    ## Goles_visitante
    ##           0           1           2           3           4           5 
    ## 0.357894737 0.352631579 0.213157895 0.047368421 0.023684211 0.005263158

Por ultimo, elaboro una tabla con ambos vectores, goles en casa y goles
en visitantes, y posteriormente realizo una tabla de frecuencia relativa
conjunta.

``` r
Tabla_5 <- table(Goles_casa, Goles_visitante)
Tabla_6 <- prop.table(x = Tabla_5)
Tabla_6
```

    ##           Goles_visitante
    ## Goles_casa           0           1           2           3           4
    ##          0 0.086842105 0.073684211 0.039473684 0.021052632 0.005263158
    ##          1 0.113157895 0.128947368 0.084210526 0.013157895 0.007894737
    ##          2 0.102631579 0.092105263 0.052631579 0.007894737 0.005263158
    ##          3 0.036842105 0.036842105 0.018421053 0.005263158 0.002631579
    ##          4 0.010526316 0.013157895 0.010526316 0.000000000 0.002631579
    ##          5 0.005263158 0.007894737 0.007894737 0.000000000 0.000000000
    ##          6 0.002631579 0.000000000 0.000000000 0.000000000 0.000000000
    ##           Goles_visitante
    ## Goles_casa           5
    ##          0 0.005263158
    ##          1 0.000000000
    ##          2 0.000000000
    ##          3 0.000000000
    ##          4 0.000000000
    ##          5 0.000000000
    ##          6 0.000000000

## Sesión 2

Ahora vamos a generar un cúmulo de datos mayor al que se tenia, esta es
una situación habitual que se puede presentar para complementar un
an?lisis, siempre es importante estar revisando las características o
tipos de datos que tenemos, por si es necesario realizar alguna
transformaciónn en las variables y poder hacer operaciones aritméticas
si es el caso, además de solo tener presente algunas de las variables,
no siempre se requiere el uso de todas para ciertos procesamientos.

  - Importa los datos de soccer de las temporadas 2017/2018, 2018/2019 y
    2019/2020 de la primera división de la liga española a R, los datos
    los puedes encontrar en el siguiente enlace:
    <https://www.football-data.co.uk/spainm.php>

<!-- end list -->

``` r
SP1 <-
  read.csv("https://www.football-data.co.uk/mmz4281/1718/SP1.csv")
SP2 <-
  read.csv("https://www.football-data.co.uk/mmz4281/1819/SP1.csv")
SP3 <-
  read.csv("https://www.football-data.co.uk/mmz4281/1920/SP1.csv")
```

  - Obtén una mejor idea de las características de los data frames al
    usar las funciones: str, head, View y summary

<!-- end list -->

``` r
str(SP1)
```

    ## 'data.frame':    380 obs. of  64 variables:
    ##  $ Div       : chr  "SP1" "SP1" "SP1" "SP1" ...
    ##  $ Date      : chr  "18/08/17" "18/08/17" "19/08/17" "19/08/17" ...
    ##  $ HomeTeam  : chr  "Leganes" "Valencia" "Celta" "Girona" ...
    ##  $ AwayTeam  : chr  "Alaves" "Las Palmas" "Sociedad" "Ath Madrid" ...
    ##  $ FTHG      : int  1 1 2 2 1 0 2 0 1 0 ...
    ##  $ FTAG      : int  0 0 3 2 1 0 0 3 0 1 ...
    ##  $ FTR       : chr  "H" "H" "A" "D" ...
    ##  $ HTHG      : int  1 1 1 2 1 0 2 0 0 0 ...
    ##  $ HTAG      : int  0 0 1 0 1 0 0 2 0 0 ...
    ##  $ HTR       : chr  "H" "H" "D" "H" ...
    ##  $ HS        : int  16 22 16 13 9 12 15 12 14 10 ...
    ##  $ AS        : int  6 5 13 9 9 8 3 16 9 13 ...
    ##  $ HST       : int  9 6 5 6 4 2 2 6 3 4 ...
    ##  $ AST       : int  3 4 6 3 6 2 0 8 1 6 ...
    ##  $ HF        : int  14 25 12 15 14 16 16 16 18 16 ...
    ##  $ AF        : int  18 13 11 15 12 15 15 12 14 15 ...
    ##  $ HC        : int  4 5 5 6 7 7 8 4 11 3 ...
    ##  $ AC        : int  2 2 4 0 3 6 0 4 6 7 ...
    ##  $ HY        : int  0 3 3 2 2 1 2 5 1 2 ...
    ##  $ AY        : int  1 3 1 4 4 3 1 1 3 3 ...
    ##  $ HR        : int  0 0 0 0 1 0 0 0 0 0 ...
    ##  $ AR        : int  0 1 0 1 0 1 0 1 0 0 ...
    ##  $ B365H     : num  2.05 1.75 2.38 8 1.62 1.5 1.17 9.5 3.25 2.1 ...
    ##  $ B365D     : num  3.2 3.8 3.25 4.33 4 4 8 5.75 3.25 3.3 ...
    ##  $ B365A     : num  4.1 4.5 3.2 1.45 5.5 7.5 15 1.3 2.3 3.7 ...
    ##  $ BWH       : num  2.05 1.75 2.4 7.5 1.62 1.48 1.18 9.25 3.25 2.15 ...
    ##  $ BWD       : num  3.1 3.9 3.3 4.33 3.9 4.25 7.5 5.75 3.2 3.3 ...
    ##  $ BWA       : num  4.1 4.6 3 1.45 5.75 7 14.5 1.3 2.3 3.5 ...
    ##  $ IWH       : num  2.1 1.75 2.5 7.2 1.55 1.5 1.17 7.5 3.3 2.1 ...
    ##  $ IWD       : num  3.4 3.6 3.3 4.4 4 4.2 7.5 5.5 3.35 3.4 ...
    ##  $ IWA       : num  3.5 4.8 2.85 1.45 6.2 6.5 15 1.35 2.2 3.5 ...
    ##  $ LBH       : num  2.05 1.75 2.35 7.5 1.6 1.5 1.2 9.5 3.25 2.1 ...
    ##  $ LBD       : num  3 3.8 3.25 4 3.9 4 6.5 5.25 3.1 3.1 ...
    ##  $ LBA       : num  4.2 4.33 3 1.5 5.5 7 15 1.3 2.3 3.4 ...
    ##  $ PSH       : num  2.03 1.78 2.44 8.36 1.62 ...
    ##  $ PSD       : num  3.25 4.01 3.4 4.38 4.17 4.37 7.35 5.79 3.24 3.36 ...
    ##  $ PSA       : num  4.52 4.83 3.16 1.49 6.18 7.31 15.5 1.33 2.36 3.49 ...
    ##  $ WHH       : num  2.05 1.8 2.4 8 1.67 1.5 1.22 11 3.1 2.2 ...
    ##  $ WHD       : num  3.1 3.75 3.4 4.2 3.6 4 6 4.5 3.1 3.3 ...
    ##  $ WHA       : num  4 4.2 2.9 1.44 5.5 7 13 1.33 2.4 3.3 ...
    ##  $ VCH       : num  2.05 1.8 2.4 7.5 1.65 1.5 1.2 9.5 3.25 2.15 ...
    ##  $ VCD       : num  3.2 4 3.4 4.3 4 4.2 7 5.75 3.25 3.3 ...
    ##  $ VCA       : num  4.4 4.6 3.13 1.5 5.75 7 13 1.3 2.3 3.5 ...
    ##  $ Bb1X2     : int  35 35 35 35 35 34 35 35 34 34 ...
    ##  $ BbMxH     : num  2.12 1.83 2.5 8.36 1.69 ...
    ##  $ BbAvH     : num  2.03 1.77 2.39 7.53 1.63 1.5 1.19 9.68 3.26 2.18 ...
    ##  $ BbMxD     : num  3.4 4.04 3.5 4.4 4.17 4.4 8 5.86 3.35 3.4 ...
    ##  $ BbAvD     : num  3.15 3.86 3.32 4.17 3.93 4.17 7.11 5.44 3.17 3.26 ...
    ##  $ BbMxA     : num  4.52 4.83 3.2 1.51 6.2 7.5 17 1.35 2.4 3.7 ...
    ##  $ BbAvA     : num  4.17 4.46 3.01 1.48 5.58 ...
    ##  $ BbOU      : int  31 33 34 34 33 32 27 27 32 32 ...
    ##  $ BbMx.2.5  : num  2.84 1.69 2.03 2.2 1.81 2.01 1.44 1.5 2.42 2.25 ...
    ##  $ BbAv.2.5  : num  2.68 1.64 1.98 2.11 1.75 1.94 1.4 1.46 2.36 2.14 ...
    ##  $ BbMx.2.5.1: num  1.53 2.4 1.9 1.8 2.14 1.96 3.1 2.95 1.63 1.76 ...
    ##  $ BbAv.2.5.1: num  1.46 2.27 1.84 1.74 2.09 1.87 2.88 2.64 1.58 1.7 ...
    ##  $ BbAH      : int  18 16 18 16 16 17 17 16 15 17 ...
    ##  $ BbAHh     : num  -0.5 -0.75 -0.25 1.25 -1 -1 -2 1.5 0.25 -0.25 ...
    ##  $ BbMxAHH   : num  2.07 2.05 2.08 1.77 2.12 1.9 2.05 2.03 1.93 1.92 ...
    ##  $ BbAvAHH   : num  2.03 1.97 2.05 1.75 2.06 1.86 2 1.98 1.89 1.88 ...
    ##  $ BbMxAHA   : num  1.9 1.96 1.87 2.25 1.86 2.05 1.91 1.95 2.03 2.04 ...
    ##  $ BbAvAHA   : num  1.86 1.91 1.83 2.16 1.82 2.01 1.86 1.89 1.98 1.99 ...
    ##  $ PSCH      : num  1.98 1.78 2.12 6.93 1.64 1.53 1.2 12.4 3.31 2.2 ...
    ##  $ PSCD      : num  3.35 4.24 3.53 3.83 4.18 4.48 8.25 7 3.32 3.27 ...
    ##  $ PSCA      : num  4.63 4.43 3.74 1.63 5.82 6.91 15.2 1.26 2.4 3.85 ...

``` r
head(SP1)
```

    ##   Div     Date   HomeTeam   AwayTeam FTHG FTAG FTR HTHG HTAG HTR HS AS HST AST
    ## 1 SP1 18/08/17    Leganes     Alaves    1    0   H    1    0   H 16  6   9   3
    ## 2 SP1 18/08/17   Valencia Las Palmas    1    0   H    1    0   H 22  5   6   4
    ## 3 SP1 19/08/17      Celta   Sociedad    2    3   A    1    1   D 16 13   5   6
    ## 4 SP1 19/08/17     Girona Ath Madrid    2    2   D    2    0   H 13  9   6   3
    ## 5 SP1 19/08/17    Sevilla    Espanol    1    1   D    1    1   D  9  9   4   6
    ## 6 SP1 20/08/17 Ath Bilbao     Getafe    0    0   D    0    0   D 12  8   2   2
    ##   HF AF HC AC HY AY HR AR B365H B365D B365A  BWH  BWD  BWA  IWH IWD  IWA  LBH
    ## 1 14 18  4  2  0  1  0  0  2.05  3.20  4.10 2.05 3.10 4.10 2.10 3.4 3.50 2.05
    ## 2 25 13  5  2  3  3  0  1  1.75  3.80  4.50 1.75 3.90 4.60 1.75 3.6 4.80 1.75
    ## 3 12 11  5  4  3  1  0  0  2.38  3.25  3.20 2.40 3.30 3.00 2.50 3.3 2.85 2.35
    ## 4 15 15  6  0  2  4  0  1  8.00  4.33  1.45 7.50 4.33 1.45 7.20 4.4 1.45 7.50
    ## 5 14 12  7  3  2  4  1  0  1.62  4.00  5.50 1.62 3.90 5.75 1.55 4.0 6.20 1.60
    ## 6 16 15  7  6  1  3  0  1  1.50  4.00  7.50 1.48 4.25 7.00 1.50 4.2 6.50 1.50
    ##    LBD  LBA  PSH  PSD  PSA  WHH  WHD  WHA  VCH VCD  VCA Bb1X2 BbMxH BbAvH BbMxD
    ## 1 3.00 4.20 2.03 3.25 4.52 2.05 3.10 4.00 2.05 3.2 4.40    35  2.12  2.03  3.40
    ## 2 3.80 4.33 1.78 4.01 4.83 1.80 3.75 4.20 1.80 4.0 4.60    35  1.83  1.77  4.04
    ## 3 3.25 3.00 2.44 3.40 3.16 2.40 3.40 2.90 2.40 3.4 3.13    35  2.50  2.39  3.50
    ## 4 4.00 1.50 8.36 4.38 1.49 8.00 4.20 1.44 7.50 4.3 1.50    35  8.36  7.53  4.40
    ## 5 3.90 5.50 1.62 4.17 6.18 1.67 3.60 5.50 1.65 4.0 5.75    35  1.69  1.63  4.17
    ## 6 4.00 7.00 1.53 4.37 7.31 1.50 4.00 7.00 1.50 4.2 7.00    34  1.53  1.50  4.40
    ##   BbAvD BbMxA BbAvA BbOU BbMx.2.5 BbAv.2.5 BbMx.2.5.1 BbAv.2.5.1 BbAH BbAHh
    ## 1  3.15  4.52  4.17   31     2.84     2.68       1.53       1.46   18 -0.50
    ## 2  3.86  4.83  4.46   33     1.69     1.64       2.40       2.27   16 -0.75
    ## 3  3.32  3.20  3.01   34     2.03     1.98       1.90       1.84   18 -0.25
    ## 4  4.17  1.51  1.48   34     2.20     2.11       1.80       1.74   16  1.25
    ## 5  3.93  6.20  5.58   33     1.81     1.75       2.14       2.09   16 -1.00
    ## 6  4.17  7.50  6.94   32     2.01     1.94       1.96       1.87   17 -1.00
    ##   BbMxAHH BbAvAHH BbMxAHA BbAvAHA PSCH PSCD PSCA
    ## 1    2.07    2.03    1.90    1.86 1.98 3.35 4.63
    ## 2    2.05    1.97    1.96    1.91 1.78 4.24 4.43
    ## 3    2.08    2.05    1.87    1.83 2.12 3.53 3.74
    ## 4    1.77    1.75    2.25    2.16 6.93 3.83 1.63
    ## 5    2.12    2.06    1.86    1.82 1.64 4.18 5.82
    ## 6    1.90    1.86    2.05    2.01 1.53 4.48 6.91

``` r
View(SP1)
summary(SP1)
```

    ##      Div                Date             HomeTeam           AwayTeam        
    ##  Length:380         Length:380         Length:380         Length:380        
    ##  Class :character   Class :character   Class :character   Class :character  
    ##  Mode  :character   Mode  :character   Mode  :character   Mode  :character  
    ##                                                                             
    ##                                                                             
    ##                                                                             
    ##                                                                             
    ##       FTHG            FTAG           FTR                 HTHG       
    ##  Min.   :0.000   Min.   :0.000   Length:380         Min.   :0.0000  
    ##  1st Qu.:0.750   1st Qu.:0.000   Class :character   1st Qu.:0.0000  
    ##  Median :1.000   Median :1.000   Mode  :character   Median :0.0000  
    ##  Mean   :1.547   Mean   :1.147                      Mean   :0.6605  
    ##  3rd Qu.:2.000   3rd Qu.:2.000                      3rd Qu.:1.0000  
    ##  Max.   :7.000   Max.   :6.000                      Max.   :5.0000  
    ##                                                                     
    ##       HTAG            HTR                  HS              AS       
    ##  Min.   :0.0000   Length:380         Min.   : 2.00   Min.   : 1.00  
    ##  1st Qu.:0.0000   Class :character   1st Qu.:10.00   1st Qu.: 8.00  
    ##  Median :0.0000   Mode  :character   Median :13.00   Median :10.00  
    ##  Mean   :0.4868                      Mean   :13.53   Mean   :10.47  
    ##  3rd Qu.:1.0000                      3rd Qu.:16.00   3rd Qu.:13.00  
    ##  Max.   :3.0000                      Max.   :30.00   Max.   :24.00  
    ##                                                                     
    ##       HST              AST               HF              AF       
    ##  Min.   : 0.000   Min.   : 0.000   Min.   : 4.00   Min.   : 0.00  
    ##  1st Qu.: 3.000   1st Qu.: 2.000   1st Qu.:11.00   1st Qu.:11.00  
    ##  Median : 4.500   Median : 3.000   Median :13.00   Median :14.00  
    ##  Mean   : 4.758   Mean   : 3.805   Mean   :13.73   Mean   :13.95  
    ##  3rd Qu.: 6.000   3rd Qu.: 5.000   3rd Qu.:17.00   3rd Qu.:17.00  
    ##  Max.   :14.000   Max.   :13.000   Max.   :29.00   Max.   :29.00  
    ##                                                                   
    ##        HC               AC               HY              AY       
    ##  Min.   : 0.000   Min.   : 0.000   Min.   :0.000   Min.   :0.000  
    ##  1st Qu.: 4.000   1st Qu.: 2.000   1st Qu.:1.000   1st Qu.:2.000  
    ##  Median : 5.000   Median : 4.000   Median :2.000   Median :3.000  
    ##  Mean   : 5.613   Mean   : 4.192   Mean   :2.339   Mean   :2.676  
    ##  3rd Qu.: 7.000   3rd Qu.: 6.000   3rd Qu.:3.000   3rd Qu.:4.000  
    ##  Max.   :16.000   Max.   :14.000   Max.   :8.000   Max.   :9.000  
    ##                                                                   
    ##        HR               AR              B365H            B365D       
    ##  Min.   :0.0000   Min.   :0.00000   Min.   : 1.050   Min.   : 2.790  
    ##  1st Qu.:0.0000   1st Qu.:0.00000   1st Qu.: 1.617   1st Qu.: 3.290  
    ##  Median :0.0000   Median :0.00000   Median : 2.075   Median : 3.500  
    ##  Mean   :0.1105   Mean   :0.07895   Mean   : 2.777   Mean   : 4.259  
    ##  3rd Qu.:0.0000   3rd Qu.:0.00000   3rd Qu.: 2.790   3rd Qu.: 4.330  
    ##  Max.   :2.0000   Max.   :2.00000   Max.   :17.000   Max.   :15.000  
    ##                                                                      
    ##      B365A             BWH              BWD              BWA        
    ##  Min.   : 1.170   Min.   : 1.050   Min.   : 2.950   Min.   : 1.180  
    ##  1st Qu.: 2.600   1st Qu.: 1.650   1st Qu.: 3.300   1st Qu.: 2.600  
    ##  Median : 3.700   Median : 2.100   Median : 3.600   Median : 3.700  
    ##  Mean   : 5.192   Mean   : 2.744   Mean   : 4.278   Mean   : 5.204  
    ##  3rd Qu.: 5.500   3rd Qu.: 2.750   3rd Qu.: 4.330   3rd Qu.: 5.500  
    ##  Max.   :34.000   Max.   :14.500   Max.   :15.500   Max.   :34.000  
    ##                                                                     
    ##       IWH              IWD              IWA              LBH        
    ##  Min.   : 1.070   Min.   : 3.050   Min.   : 1.200   Min.   : 1.050  
    ##  1st Qu.: 1.650   1st Qu.: 3.300   1st Qu.: 2.600   1st Qu.: 1.610  
    ##  Median : 2.100   Median : 3.500   Median : 3.500   Median : 2.050  
    ##  Mean   : 2.721   Mean   : 4.161   Mean   : 5.041   Mean   : 2.742  
    ##  3rd Qu.: 2.700   3rd Qu.: 4.200   3rd Qu.: 5.300   3rd Qu.: 2.750  
    ##  Max.   :15.000   Max.   :12.000   Max.   :27.000   Max.   :19.000  
    ##                                                     NA's   :1       
    ##       LBD              LBA              PSH              PSD        
    ##  Min.   : 2.900   Min.   : 1.170   Min.   : 1.050   Min.   : 3.020  
    ##  1st Qu.: 3.250   1st Qu.: 2.575   1st Qu.: 1.660   1st Qu.: 3.410  
    ##  Median : 3.500   Median : 3.600   Median : 2.120   Median : 3.705  
    ##  Mean   : 4.152   Mean   : 5.375   Mean   : 2.857   Mean   : 4.539  
    ##  3rd Qu.: 4.200   3rd Qu.: 5.500   3rd Qu.: 2.850   3rd Qu.: 4.455  
    ##  Max.   :17.000   Max.   :41.000   Max.   :19.650   Max.   :20.380  
    ##  NA's   :1        NA's   :1                                         
    ##       PSA              WHH              WHD              WHA        
    ##  Min.   : 1.180   Min.   : 1.060   Min.   : 2.900   Min.   : 1.170  
    ##  1st Qu.: 2.670   1st Qu.: 1.665   1st Qu.: 3.250   1st Qu.: 2.600  
    ##  Median : 3.845   Median : 2.100   Median : 3.500   Median : 3.550  
    ##  Mean   : 5.522   Mean   : 2.738   Mean   : 4.092   Mean   : 5.041  
    ##  3rd Qu.: 5.942   3rd Qu.: 2.750   3rd Qu.: 4.200   3rd Qu.: 5.500  
    ##  Max.   :36.500   Max.   :17.000   Max.   :15.000   Max.   :26.000  
    ##                                                                     
    ##       VCH              VCD              VCA             Bb1X2      
    ##  Min.   : 1.040   Min.   : 3.000   Min.   : 1.180   Min.   : 3.00  
    ##  1st Qu.: 1.650   1st Qu.: 3.400   1st Qu.: 2.630   1st Qu.:35.00  
    ##  Median : 2.100   Median : 3.700   Median : 3.700   Median :37.00  
    ##  Mean   : 2.762   Mean   : 4.416   Mean   : 5.472   Mean   :37.71  
    ##  3rd Qu.: 2.800   3rd Qu.: 4.400   3rd Qu.: 5.750   3rd Qu.:40.00  
    ##  Max.   :15.000   Max.   :17.000   Max.   :36.000   Max.   :43.00  
    ##                                                                    
    ##      BbMxH            BbAvH            BbMxD            BbAvD       
    ##  Min.   : 1.080   Min.   : 1.050   Min.   : 3.110   Min.   : 2.940  
    ##  1st Qu.: 1.700   1st Qu.: 1.640   1st Qu.: 3.478   1st Qu.: 3.328  
    ##  Median : 2.200   Median : 2.090   Median : 3.750   Median : 3.570  
    ##  Mean   : 2.966   Mean   : 2.743   Mean   : 4.636   Mean   : 4.261  
    ##  3rd Qu.: 2.882   3rd Qu.: 2.765   3rd Qu.: 4.553   3rd Qu.: 4.272  
    ##  Max.   :19.650   Max.   :16.300   Max.   :20.380   Max.   :15.320  
    ##                                                                     
    ##      BbMxA            BbAvA             BbOU          BbMx.2.5    
    ##  Min.   : 1.210   Min.   : 1.170   Min.   : 3.00   Min.   :1.130  
    ##  1st Qu.: 2.728   1st Qu.: 2.607   1st Qu.:31.75   1st Qu.:1.667  
    ##  Median : 3.920   Median : 3.665   Median :34.00   Median :1.960  
    ##  Mean   : 6.107   Mean   : 5.190   Mean   :34.06   Mean   :1.950  
    ##  3rd Qu.: 6.105   3rd Qu.: 5.543   3rd Qu.:37.00   3rd Qu.:2.203  
    ##  Max.   :67.000   Max.   :33.420   Max.   :42.00   Max.   :3.080  
    ##                                                                   
    ##     BbAv.2.5       BbMx.2.5.1      BbAv.2.5.1         BbAH      
    ##  Min.   :1.120   Min.   :1.470   Min.   :1.410   Min.   : 1.00  
    ##  1st Qu.:1.617   1st Qu.:1.780   1st Qu.:1.718   1st Qu.:17.00  
    ##  Median :1.880   Median :2.000   Median :1.920   Median :18.00  
    ##  Mean   :1.872   Mean   :2.284   Mean   :2.162   Mean   :18.16  
    ##  3rd Qu.:2.120   3rd Qu.:2.402   3rd Qu.:2.283   3rd Qu.:19.00  
    ##  Max.   :2.850   Max.   :7.000   Max.   :5.970   Max.   :24.00  
    ##                                                                 
    ##      BbAHh            BbMxAHH         BbAvAHH         BbMxAHA     
    ##  Min.   :-3.2500   Min.   :1.610   Min.   :1.580   Min.   :1.680  
    ##  1st Qu.:-0.7500   1st Qu.:1.890   1st Qu.:1.840   1st Qu.:1.897  
    ##  Median :-0.2500   Median :1.985   Median :1.930   Median :1.970  
    ##  Mean   :-0.4059   Mean   :1.988   Mean   :1.938   Mean   :1.988  
    ##  3rd Qu.: 0.0625   3rd Qu.:2.070   3rd Qu.:2.020   3rd Qu.:2.080  
    ##  Max.   : 2.0000   Max.   :2.420   Max.   :2.340   Max.   :2.520  
    ##                                                                   
    ##     BbAvAHA           PSCH             PSCD             PSCA       
    ##  Min.   :1.630   Min.   : 1.060   Min.   : 2.930   Min.   : 1.160  
    ##  1st Qu.:1.850   1st Qu.: 1.640   1st Qu.: 3.410   1st Qu.: 2.590  
    ##  Median :1.930   Median : 2.120   Median : 3.700   Median : 3.850  
    ##  Mean   :1.937   Mean   : 2.839   Mean   : 4.508   Mean   : 5.695  
    ##  3rd Qu.:2.030   3rd Qu.: 2.980   3rd Qu.: 4.560   3rd Qu.: 6.095  
    ##  Max.   :2.440   Max.   :18.700   Max.   :18.500   Max.   :46.000  
    ##                  NA's   :1        NA's   :1        NA's   :1

``` r
str(SP2)
```

    ## 'data.frame':    380 obs. of  61 variables:
    ##  $ Div       : chr  "SP1" "SP1" "SP1" "SP1" ...
    ##  $ Date      : chr  "17/08/2018" "17/08/2018" "18/08/2018" "18/08/2018" ...
    ##  $ HomeTeam  : chr  "Betis" "Girona" "Barcelona" "Celta" ...
    ##  $ AwayTeam  : chr  "Levante" "Valladolid" "Alaves" "Espanol" ...
    ##  $ FTHG      : int  0 0 3 1 1 1 2 1 2 1 ...
    ##  $ FTAG      : int  3 0 0 1 2 2 0 4 1 1 ...
    ##  $ FTR       : chr  "A" "D" "H" "D" ...
    ##  $ HTHG      : int  0 0 0 0 1 0 1 0 1 0 ...
    ##  $ HTAG      : int  1 0 0 1 1 2 0 3 1 1 ...
    ##  $ HTR       : chr  "A" "D" "D" "A" ...
    ##  $ HS        : int  22 13 25 12 16 18 10 13 17 13 ...
    ##  $ AS        : int  6 2 3 14 8 8 4 17 12 9 ...
    ##  $ HST       : int  8 1 9 2 7 6 3 2 5 4 ...
    ##  $ AST       : int  4 1 0 5 4 6 1 8 2 3 ...
    ##  $ HF        : int  10 21 6 13 16 12 11 6 12 10 ...
    ##  $ AF        : int  10 20 13 14 10 13 27 15 13 15 ...
    ##  $ HC        : int  5 3 7 8 4 7 3 2 6 4 ...
    ##  $ AC        : int  3 2 1 7 6 0 0 6 2 10 ...
    ##  $ HY        : int  0 1 0 3 2 1 1 1 4 2 ...
    ##  $ AY        : int  2 1 2 2 3 1 7 0 5 3 ...
    ##  $ HR        : int  0 0 0 0 0 0 0 0 0 0 ...
    ##  $ AR        : int  0 0 0 0 0 0 0 0 0 0 ...
    ##  $ B365H     : num  1.66 1.75 1.11 1.85 2.04 1.66 1.2 3.25 1.75 3 ...
    ##  $ B365D     : num  4 3.6 10 3.5 3.4 3.75 7 3.6 3.3 3.2 ...
    ##  $ B365A     : num  5 5 21 4.5 3.8 5.5 13 2.14 5.5 2.5 ...
    ##  $ BWH       : num  1.7 1.75 1.11 1.91 2.05 1.7 1.18 3.5 1.78 2.85 ...
    ##  $ BWD       : num  3.7 3.5 10 3.4 3.3 3.7 7.25 3.5 3.5 3.25 ...
    ##  $ BWA       : num  5.25 5.25 20 4.25 3.9 5.25 16 2.1 5 2.55 ...
    ##  $ IWH       : num  1.75 1.8 1.12 1.9 2 1.7 1.2 3.5 1.85 2.85 ...
    ##  $ IWD       : num  3.6 3.6 9 3.5 3.4 3.75 6.5 3.4 3.5 3.2 ...
    ##  $ IWA       : num  4.9 4.5 20 4.1 3.8 5 15 2.1 4.4 2.55 ...
    ##  $ PSH       : num  1.69 1.8 1.11 1.93 2.06 1.72 1.2 3.46 1.79 3.12 ...
    ##  $ PSD       : num  4.19 3.7 11.27 3.64 3.51 ...
    ##  $ PSA       : num  5.11 4.99 25.4 4.27 3.91 ...
    ##  $ WHH       : num  1.67 1.75 1.08 1.91 2.05 1.73 1.22 3.3 1.8 3 ...
    ##  $ WHD       : num  3.9 3.6 9 3.5 3.3 3.6 6 3.7 3.4 3.2 ...
    ##  $ WHA       : num  4.75 4.6 29 4 3.6 4.75 13 2.05 4.75 2.4 ...
    ##  $ VCH       : num  1.67 1.8 1.1 1.93 2.05 1.7 1.2 3.4 1.8 3 ...
    ##  $ VCD       : num  4.2 3.7 10.5 3.5 3.5 3.8 7 3.6 3.4 3.2 ...
    ##  $ VCA       : num  5.2 4.8 34 4.4 3.9 5 13 2.1 5 2.45 ...
    ##  $ Bb1X2     : int  40 40 40 38 40 40 39 40 40 39 ...
    ##  $ BbMxH     : num  1.75 1.85 1.13 1.97 2.11 1.76 1.24 3.53 1.85 3.12 ...
    ##  $ BbAvH     : num  1.68 1.78 1.1 1.9 2.03 1.7 1.21 3.38 1.78 2.99 ...
    ##  $ BbMxD     : num  4.25 3.83 11.5 3.73 3.62 3.93 7.36 3.75 3.64 3.29 ...
    ##  $ BbAvD     : num  4 3.6 9.82 3.53 3.43 3.77 6.66 3.56 3.43 3.14 ...
    ##  $ BbMxA     : num  5.25 5.27 41 4.5 3.93 ...
    ##  $ BbAvA     : num  4.95 4.79 25.67 4.2 3.76 ...
    ##  $ BbOU      : int  38 38 32 36 37 37 33 37 36 36 ...
    ##  $ BbMx.2.5  : num  1.82 2.21 1.39 2.13 2.05 1.95 1.5 1.83 2.49 2.45 ...
    ##  $ BbAv.2.5  : num  1.76 2.13 1.34 2.06 1.99 1.88 1.45 1.76 2.35 2.33 ...
    ##  $ BbMx.2.5.1: num  2.15 1.78 3.4 1.84 1.88 1.98 2.75 2.13 1.64 1.65 ...
    ##  $ BbAv.2.5.1: num  2.06 1.71 3.18 1.76 1.81 1.91 2.66 2.04 1.58 1.59 ...
    ##  $ BbAH      : int  20 20 19 18 18 19 19 19 18 17 ...
    ##  $ BbAHh     : num  -0.75 -0.75 -2.5 -0.75 -0.25 -0.75 -1.75 0.25 -0.75 0.25 ...
    ##  $ BbMxAHH   : num  1.89 2.06 1.95 2.26 1.76 1.96 1.85 2.08 2.11 1.82 ...
    ##  $ BbAvAHH   : num  1.85 2.01 1.91 2.18 1.74 1.91 1.8 2.03 2.04 1.75 ...
    ##  $ BbMxAHA   : num  2.07 1.9 2 1.74 2.23 2.01 2.15 1.86 1.86 2.23 ...
    ##  $ BbAvAHA   : num  2 1.85 1.95 1.71 2.14 1.94 2.07 1.83 1.82 2.12 ...
    ##  $ PSCH      : num  1.59 1.76 1.1 2.18 2.32 1.77 1.19 4.57 1.69 3.55 ...
    ##  $ PSCD      : num  4.42 3.57 11.85 3.26 3.21 ...
    ##  $ PSCA      : num  5.89 5.62 32.17 3.85 3.53 ...

``` r
head(SP2)
```

    ##   Div       Date   HomeTeam   AwayTeam FTHG FTAG FTR HTHG HTAG HTR HS AS HST
    ## 1 SP1 17/08/2018      Betis    Levante    0    3   A    0    1   A 22  6   8
    ## 2 SP1 17/08/2018     Girona Valladolid    0    0   D    0    0   D 13  2   1
    ## 3 SP1 18/08/2018  Barcelona     Alaves    3    0   H    0    0   D 25  3   9
    ## 4 SP1 18/08/2018      Celta    Espanol    1    1   D    0    1   A 12 14   2
    ## 5 SP1 18/08/2018 Villarreal   Sociedad    1    2   A    1    1   D 16  8   7
    ## 6 SP1 19/08/2018      Eibar     Huesca    1    2   A    0    2   A 18  8   6
    ##   AST HF AF HC AC HY AY HR AR B365H B365D B365A  BWH  BWD   BWA  IWH  IWD  IWA
    ## 1   4 10 10  5  3  0  2  0  0  1.66  4.00   5.0 1.70  3.7  5.25 1.75 3.60  4.9
    ## 2   1 21 20  3  2  1  1  0  0  1.75  3.60   5.0 1.75  3.5  5.25 1.80 3.60  4.5
    ## 3   0  6 13  7  1  0  2  0  0  1.11 10.00  21.0 1.11 10.0 20.00 1.12 9.00 20.0
    ## 4   5 13 14  8  7  3  2  0  0  1.85  3.50   4.5 1.91  3.4  4.25 1.90 3.50  4.1
    ## 5   4 16 10  4  6  2  3  0  0  2.04  3.40   3.8 2.05  3.3  3.90 2.00 3.40  3.8
    ## 6   6 12 13  7  0  1  1  0  0  1.66  3.75   5.5 1.70  3.7  5.25 1.70 3.75  5.0
    ##    PSH   PSD   PSA  WHH WHD   WHA  VCH  VCD  VCA Bb1X2 BbMxH BbAvH BbMxD BbAvD
    ## 1 1.69  4.19  5.11 1.67 3.9  4.75 1.67  4.2  5.2    40  1.75  1.68  4.25  4.00
    ## 2 1.80  3.70  4.99 1.75 3.6  4.60 1.80  3.7  4.8    40  1.85  1.78  3.83  3.60
    ## 3 1.11 11.27 25.40 1.08 9.0 29.00 1.10 10.5 34.0    40  1.13  1.10 11.50  9.82
    ## 4 1.93  3.64  4.27 1.91 3.5  4.00 1.93  3.5  4.4    38  1.97  1.90  3.73  3.53
    ## 5 2.06  3.51  3.91 2.05 3.3  3.60 2.05  3.5  3.9    40  2.11  2.03  3.62  3.43
    ## 6 1.72  3.90  5.26 1.73 3.6  4.75 1.70  3.8  5.0    40  1.76  1.70  3.93  3.77
    ##   BbMxA BbAvA BbOU BbMx.2.5 BbAv.2.5 BbMx.2.5.1 BbAv.2.5.1 BbAH BbAHh BbMxAHH
    ## 1  5.25  4.95   38     1.82     1.76       2.15       2.06   20 -0.75    1.89
    ## 2  5.27  4.79   38     2.21     2.13       1.78       1.71   20 -0.75    2.06
    ## 3 41.00 25.67   32     1.39     1.34       3.40       3.18   19 -2.50    1.95
    ## 4  4.50  4.20   36     2.13     2.06       1.84       1.76   18 -0.75    2.26
    ## 5  3.93  3.76   37     2.05     1.99       1.88       1.81   18 -0.25    1.76
    ## 6  5.50  5.08   37     1.95     1.88       1.98       1.91   19 -0.75    1.96
    ##   BbAvAHH BbMxAHA BbAvAHA PSCH  PSCD  PSCA
    ## 1    1.85    2.07    2.00 1.59  4.42  5.89
    ## 2    2.01    1.90    1.85 1.76  3.57  5.62
    ## 3    1.91    2.00    1.95 1.10 11.85 32.17
    ## 4    2.18    1.74    1.71 2.18  3.26  3.85
    ## 5    1.74    2.23    2.14 2.32  3.21  3.53
    ## 6    1.91    2.01    1.94 1.77  3.68  5.32

``` r
View(SP2)
summary(SP2)
```

    ##      Div                Date             HomeTeam           AwayTeam        
    ##  Length:380         Length:380         Length:380         Length:380        
    ##  Class :character   Class :character   Class :character   Class :character  
    ##  Mode  :character   Mode  :character   Mode  :character   Mode  :character  
    ##                                                                             
    ##                                                                             
    ##                                                                             
    ##       FTHG            FTAG           FTR                 HTHG       
    ##  Min.   :0.000   Min.   :0.000   Length:380         Min.   :0.0000  
    ##  1st Qu.:1.000   1st Qu.:0.000   Class :character   1st Qu.:0.0000  
    ##  Median :1.000   Median :1.000   Mode  :character   Median :0.0000  
    ##  Mean   :1.453   Mean   :1.134                      Mean   :0.5447  
    ##  3rd Qu.:2.000   3rd Qu.:2.000                      3rd Qu.:1.0000  
    ##  Max.   :8.000   Max.   :6.000                      Max.   :3.0000  
    ##       HTAG            HTR                  HS              AS       
    ##  Min.   :0.0000   Length:380         Min.   : 3.00   Min.   : 2.00  
    ##  1st Qu.:0.0000   Class :character   1st Qu.:10.00   1st Qu.: 8.00  
    ##  Median :0.0000   Mode  :character   Median :13.00   Median :10.00  
    ##  Mean   :0.5132                      Mean   :13.87   Mean   :10.43  
    ##  3rd Qu.:1.0000                      3rd Qu.:17.00   3rd Qu.:13.00  
    ##  Max.   :5.0000                      Max.   :34.00   Max.   :21.00  
    ##       HST              AST               HF              AF       
    ##  Min.   : 0.000   Min.   : 0.000   Min.   : 1.00   Min.   : 3.00  
    ##  1st Qu.: 3.000   1st Qu.: 2.000   1st Qu.:11.00   1st Qu.:11.00  
    ##  Median : 5.000   Median : 3.000   Median :13.00   Median :13.00  
    ##  Mean   : 4.834   Mean   : 3.589   Mean   :13.63   Mean   :13.45  
    ##  3rd Qu.: 6.000   3rd Qu.: 5.000   3rd Qu.:16.00   3rd Qu.:16.00  
    ##  Max.   :15.000   Max.   :11.000   Max.   :26.00   Max.   :27.00  
    ##        HC               AC               HY              AY       
    ##  Min.   : 0.000   Min.   : 0.000   Min.   :0.000   Min.   :0.000  
    ##  1st Qu.: 4.000   1st Qu.: 2.000   1st Qu.:1.000   1st Qu.:2.000  
    ##  Median : 5.000   Median : 4.000   Median :2.000   Median :3.000  
    ##  Mean   : 5.574   Mean   : 4.021   Mean   :2.529   Mean   :2.642  
    ##  3rd Qu.: 7.000   3rd Qu.: 6.000   3rd Qu.:4.000   3rd Qu.:3.000  
    ##  Max.   :15.000   Max.   :12.000   Max.   :8.000   Max.   :7.000  
    ##        HR                AR             B365H            B365D       
    ##  Min.   :0.00000   Min.   :0.0000   Min.   : 1.080   Min.   : 2.870  
    ##  1st Qu.:0.00000   1st Qu.:0.0000   1st Qu.: 1.660   1st Qu.: 3.300  
    ##  Median :0.00000   Median :0.0000   Median : 2.120   Median : 3.500  
    ##  Mean   :0.08684   Mean   :0.1211   Mean   : 2.596   Mean   : 3.996  
    ##  3rd Qu.:0.00000   3rd Qu.:0.0000   3rd Qu.: 2.800   3rd Qu.: 4.000  
    ##  Max.   :1.00000   Max.   :2.0000   Max.   :17.000   Max.   :11.000  
    ##      B365A             BWH              BWD              BWA        
    ##  Min.   : 1.160   Min.   : 1.060   Min.   : 2.900   Min.   : 1.190  
    ##  1st Qu.: 2.547   1st Qu.: 1.670   1st Qu.: 3.300   1st Qu.: 2.600  
    ##  Median : 3.500   Median : 2.150   Median : 3.500   Median : 3.500  
    ##  Mean   : 4.790   Mean   : 2.579   Mean   : 3.991   Mean   : 4.745  
    ##  3rd Qu.: 5.062   3rd Qu.: 2.800   3rd Qu.: 4.000   3rd Qu.: 5.250  
    ##  Max.   :29.000   Max.   :15.000   Max.   :12.000   Max.   :36.000  
    ##       IWH              IWD              IWA              PSH        
    ##  Min.   : 1.070   Min.   : 2.850   Min.   : 1.200   Min.   : 1.080  
    ##  1st Qu.: 1.700   1st Qu.: 3.300   1st Qu.: 2.600   1st Qu.: 1.700  
    ##  Median : 2.150   Median : 3.500   Median : 3.450   Median : 2.180  
    ##  Mean   : 2.553   Mean   : 3.943   Mean   : 4.587   Mean   : 2.639  
    ##  3rd Qu.: 2.763   3rd Qu.: 4.000   3rd Qu.: 4.950   3rd Qu.: 2.840  
    ##  Max.   :13.000   Max.   :13.000   Max.   :28.000   Max.   :19.070  
    ##       PSD              PSA              WHH              WHD        
    ##  Min.   : 2.990   Min.   : 1.180   Min.   : 1.050   Min.   : 2.500  
    ##  1st Qu.: 3.357   1st Qu.: 2.652   1st Qu.: 1.700   1st Qu.: 3.300  
    ##  Median : 3.640   Median : 3.575   Median : 2.150   Median : 3.500  
    ##  Mean   : 4.133   Mean   : 4.994   Mean   : 2.564   Mean   : 3.997  
    ##  3rd Qu.: 4.170   3rd Qu.: 5.230   3rd Qu.: 2.800   3rd Qu.: 4.000  
    ##  Max.   :13.220   Max.   :36.830   Max.   :17.000   Max.   :13.000  
    ##       WHA              VCH              VCD              VCA       
    ##  Min.   : 1.150   Min.   : 1.060   Min.   : 3.000   Min.   : 1.18  
    ##  1st Qu.: 2.587   1st Qu.: 1.700   1st Qu.: 3.300   1st Qu.: 2.60  
    ##  Median : 3.500   Median : 2.150   Median : 3.600   Median : 3.60  
    ##  Mean   : 4.779   Mean   : 2.627   Mean   : 4.097   Mean   : 5.00  
    ##  3rd Qu.: 5.000   3rd Qu.: 2.800   3rd Qu.: 4.200   3rd Qu.: 5.20  
    ##  Max.   :34.000   Max.   :21.000   Max.   :13.000   Max.   :41.00  
    ##      Bb1X2           BbMxH            BbAvH            BbMxD       
    ##  Min.   :31.00   Min.   : 1.100   Min.   : 1.070   Min.   : 3.040  
    ##  1st Qu.:34.00   1st Qu.: 1.750   1st Qu.: 1.690   1st Qu.: 3.420  
    ##  Median :36.00   Median : 2.250   Median : 2.160   Median : 3.735  
    ##  Mean   :36.13   Mean   : 2.739   Mean   : 2.582   Mean   : 4.251  
    ##  3rd Qu.:38.00   3rd Qu.: 2.913   3rd Qu.: 2.792   3rd Qu.: 4.250  
    ##  Max.   :41.00   Max.   :21.000   Max.   :16.550   Max.   :15.000  
    ##      BbAvD            BbMxA            BbAvA             BbOU      
    ##  Min.   : 2.920   Min.   : 1.200   Min.   : 1.170   Min.   :28.00  
    ##  1st Qu.: 3.288   1st Qu.: 2.750   1st Qu.: 2.620   1st Qu.:32.00  
    ##  Median : 3.550   Median : 3.695   Median : 3.495   Median :34.00  
    ##  Mean   : 4.005   Mean   : 5.361   Mean   : 4.763   Mean   :33.84  
    ##  3rd Qu.: 4.032   3rd Qu.: 5.370   3rd Qu.: 5.043   3rd Qu.:35.00  
    ##  Max.   :12.430   Max.   :52.000   Max.   :33.380   Max.   :39.00  
    ##     BbMx.2.5        BbAv.2.5       BbMx.2.5.1      BbAv.2.5.1   
    ##  Min.   :1.200   Min.   :1.170   Min.   :1.420   Min.   :1.380  
    ##  1st Qu.:1.710   1st Qu.:1.650   1st Qu.:1.710   1st Qu.:1.650  
    ##  Median :2.000   Median :1.940   Median :1.950   Median :1.870  
    ##  Mean   :2.029   Mean   :1.947   Mean   :2.116   Mean   :2.018  
    ##  3rd Qu.:2.315   3rd Qu.:2.230   3rd Qu.:2.303   3rd Qu.:2.210  
    ##  Max.   :3.200   Max.   :2.890   Max.   :5.250   Max.   :4.740  
    ##       BbAH           BbAHh            BbMxAHH         BbAvAHH     
    ##  Min.   :15.00   Min.   :-3.0000   Min.   :1.560   Min.   :1.520  
    ##  1st Qu.:19.00   1st Qu.:-1.0000   1st Qu.:1.850   1st Qu.:1.800  
    ##  Median :20.00   Median :-0.2500   Median :2.030   Median :1.970  
    ##  Mean   :19.88   Mean   :-0.4033   Mean   :2.055   Mean   :1.992  
    ##  3rd Qu.:21.00   3rd Qu.: 0.2500   3rd Qu.:2.200   3rd Qu.:2.130  
    ##  Max.   :24.00   Max.   : 2.0000   Max.   :3.270   Max.   :3.020  
    ##     BbMxAHA         BbAvAHA           PSCH             PSCD       
    ##  Min.   :1.450   Min.   :1.410   Min.   : 1.070   Min.   : 2.860  
    ##  1st Qu.:1.800   1st Qu.:1.750   1st Qu.: 1.698   1st Qu.: 3.310  
    ##  Median :1.950   Median :1.890   Median : 2.190   Median : 3.610  
    ##  Mean   :1.972   Mean   :1.915   Mean   : 2.726   Mean   : 4.102  
    ##  3rd Qu.:2.130   3rd Qu.:2.070   3rd Qu.: 2.970   3rd Qu.: 4.202  
    ##  Max.   :2.850   Max.   :2.670   Max.   :18.040   Max.   :14.910  
    ##       PSCA       
    ##  Min.   : 1.190  
    ##  1st Qu.: 2.612  
    ##  Median : 3.645  
    ##  Mean   : 5.100  
    ##  3rd Qu.: 5.575  
    ##  Max.   :36.030

``` r
str(SP3)
```

    ## 'data.frame':    380 obs. of  105 variables:
    ##  $ Div        : chr  "SP1" "SP1" "SP1" "SP1" ...
    ##  $ Date       : chr  "16/08/2019" "17/08/2019" "17/08/2019" "17/08/2019" ...
    ##  $ Time       : chr  "20:00" "16:00" "18:00" "19:00" ...
    ##  $ HomeTeam   : chr  "Ath Bilbao" "Celta" "Valencia" "Mallorca" ...
    ##  $ AwayTeam   : chr  "Barcelona" "Real Madrid" "Sociedad" "Eibar" ...
    ##  $ FTHG       : int  1 1 1 2 0 4 1 0 1 1 ...
    ##  $ FTAG       : int  0 3 1 1 1 4 0 2 2 0 ...
    ##  $ FTR        : chr  "H" "A" "D" "H" ...
    ##  $ HTHG       : int  0 0 0 1 0 1 0 0 0 1 ...
    ##  $ HTAG       : int  0 1 0 0 0 1 0 1 0 0 ...
    ##  $ HTR        : chr  "D" "A" "D" "H" ...
    ##  $ HS         : int  11 7 14 16 13 12 9 7 13 5 ...
    ##  $ AS         : int  11 17 12 11 4 14 16 12 14 6 ...
    ##  $ HST        : int  5 4 6 4 2 7 2 2 4 5 ...
    ##  $ AST        : int  2 11 3 5 2 7 4 4 3 0 ...
    ##  $ HF         : int  14 17 13 13 17 10 18 11 11 19 ...
    ##  $ AF         : int  9 12 14 14 11 16 15 17 19 22 ...
    ##  $ HC         : int  3 6 3 9 8 2 2 8 6 3 ...
    ##  $ AC         : int  8 4 3 3 0 7 9 4 1 4 ...
    ##  $ HY         : int  1 5 4 2 1 3 2 2 2 3 ...
    ##  $ AY         : int  1 2 4 3 4 1 1 2 6 4 ...
    ##  $ HR         : int  0 0 1 0 1 0 0 0 1 1 ...
    ##  $ AR         : int  0 1 0 0 0 0 0 0 0 1 ...
    ##  $ B365H      : num  5.25 4.75 1.66 2.8 2 1.6 2.15 3.2 1.66 1.44 ...
    ##  $ B365D      : num  3.8 4.2 3.75 3.2 3.2 3.8 3.2 3.3 3.75 4.33 ...
    ##  $ B365A      : num  1.65 1.65 5.5 2.6 4.2 6.5 3.6 2.3 5.5 8 ...
    ##  $ BWH        : num  5.5 4.4 1.67 2.95 2.05 1.6 2.15 3.1 1.65 1.45 ...
    ##  $ BWD        : num  3.8 4.2 3.75 3.1 3.25 3.8 3.3 3.4 3.75 4.33 ...
    ##  $ BWA        : num  1.65 1.72 5.5 2.6 3.9 6.25 3.6 2.3 5.75 7.5 ...
    ##  $ IWH        : num  5 5.3 1.67 2.9 2.05 1.63 2.2 3.1 1.63 1.45 ...
    ##  $ IWD        : num  3.8 4.2 3.75 3.1 3.1 4 3.25 3.4 3.75 4.4 ...
    ##  $ IWA        : num  1.7 1.6 5.3 2.6 4.05 5.5 3.4 2.3 5.7 7.2 ...
    ##  $ PSH        : num  5.15 4.73 1.68 2.98 2.1 1.62 2.29 3.13 1.63 1.49 ...
    ##  $ PSD        : num  3.84 4.18 3.94 3.14 3.21 3.99 3.31 3.56 3.81 4.34 ...
    ##  $ PSA        : num  1.74 1.72 5.47 2.66 4.13 6.13 3.45 2.33 6.38 7.58 ...
    ##  $ WHH        : num  5 5.25 1.67 2.9 2.05 1.6 2.25 3 1.62 1.47 ...
    ##  $ WHD        : num  3.8 4.2 3.8 3.1 3.2 3.9 3.3 3.5 3.75 4.2 ...
    ##  $ WHA        : num  1.7 1.6 5.25 2.62 4 5.8 3.3 2.3 6 8 ...
    ##  $ VCH        : num  5 4.75 1.67 2.9 2.1 1.65 2.25 3 1.62 1.45 ...
    ##  $ VCD        : num  3.8 4.2 3.9 3.13 3.2 4 3.3 3.5 3.8 4.2 ...
    ##  $ VCA        : num  1.75 1.73 5.75 2.7 4.1 5.75 3.3 2.3 5.75 8 ...
    ##  $ MaxH       : num  5.5 5.3 1.72 3.05 2.1 1.65 2.31 3.2 1.67 1.52 ...
    ##  $ MaxD       : num  3.95 4.4 3.98 3.2 3.3 4.15 3.4 3.56 3.9 4.5 ...
    ##  $ MaxA       : num  1.76 1.73 5.75 2.7 4.25 6.5 3.6 2.4 6.5 8.5 ...
    ##  $ AvgH       : num  5.07 4.67 1.68 2.91 2.06 1.61 2.23 3.08 1.64 1.47 ...
    ##  $ AvgD       : num  3.81 4.12 3.8 3.09 3.18 3.95 3.25 3.41 3.76 4.23 ...
    ##  $ AvgA       : num  1.71 1.69 5.29 2.62 4.02 5.8 3.43 2.33 5.78 7.63 ...
    ##  $ B365.2.5   : num  1.8 1.53 2 2.3 2.5 1.8 2.1 1.9 2.1 2.2 ...
    ##  $ B365.2.5.1 : num  2 2.5 1.8 1.61 1.53 2 1.72 1.9 1.72 1.66 ...
    ##  $ P.2.5      : num  1.81 1.52 2.08 2.45 2.72 1.88 2.16 1.95 2.16 2.3 ...
    ##  $ P.2.5.1    : num  2.09 2.66 1.82 1.6 1.5 2.02 1.76 1.95 1.76 1.68 ...
    ##  $ Max.2.5    : num  1.85 1.53 2.14 2.47 2.75 1.9 2.2 1.98 2.21 2.3 ...
    ##  $ Max.2.5.1  : num  2.11 2.72 1.83 1.65 1.54 2.05 1.77 1.95 1.78 1.71 ...
    ##  $ Avg.2.5    : num  1.79 1.49 2.07 2.34 2.59 1.84 2.13 1.92 2.13 2.23 ...
    ##  $ Avg.2.5.1  : num  2.05 2.58 1.77 1.6 1.49 1.98 1.72 1.89 1.72 1.66 ...
    ##  $ AHh        : num  0.75 0.75 -0.75 0 -0.5 -1 -0.25 0.25 -0.75 -1 ...
    ##  $ B365AHH    : num  1.99 2.04 1.91 2.05 2.08 2.05 1.95 1.88 1.86 1.88 ...
    ##  $ B365AHA    : num  1.94 1.89 2.02 1.88 1.85 1.75 1.98 2.05 2.07 2.05 ...
    ##  $ PAHH       : num  1.98 2.01 1.91 2.07 2.1 2.11 1.96 1.9 1.84 1.88 ...
    ##  $ PAHA       : num  1.94 1.91 2.01 1.85 1.82 1.81 1.96 2.02 2.08 2.04 ...
    ##  $ MaxAHH     : num  2 2.05 1.93 2.07 2.1 2.14 1.97 1.9 1.87 1.89 ...
    ##  $ MaxAHA     : num  1.95 1.91 2.03 1.88 1.85 1.85 1.99 2.06 2.08 2.08 ...
    ##  $ AvgAHH     : num  1.96 2 1.89 2.04 2.06 2.07 1.93 1.87 1.83 1.85 ...
    ##  $ AvgAHA     : num  1.92 1.88 1.99 1.85 1.83 1.8 1.95 2.01 2.06 2.03 ...
    ##  $ B365CH     : num  5.25 5.25 1.66 2.87 1.9 1.53 2.3 3 1.8 1.5 ...
    ##  $ B365CD     : num  3.8 4.2 3.75 3.2 3.1 4 3.4 3.4 3.6 4 ...
    ##  $ B365CA     : num  1.65 1.57 5.5 2.55 5 6.5 3.2 2.4 4.75 8 ...
    ##  $ BWCH       : num  4.75 4.5 1.65 2.95 1.95 1.57 2.35 3 1.8 1.5 ...
    ##  $ BWCD       : num  3.75 4.1 3.8 3.1 3.2 3.8 3.2 3.4 3.4 3.9 ...
    ##  $ BWCA       : num  1.75 1.7 5.5 2.6 4.5 6.5 3.2 2.35 5 7.75 ...
    ##  $ IWCH       : num  5 4.6 1.67 2.9 1.9 1.55 2.35 3 1.85 1.5 ...
    ##  $ IWCD       : num  3.8 3.8 3.8 3.1 3.15 4.05 3.25 3.35 3.55 3.9 ...
    ##  $ IWCA       : num  1.7 1.75 5.3 2.6 4.85 6.3 3.15 2.35 4.4 7.6 ...
    ##  $ PSCH       : num  5.34 5.1 1.69 2.96 1.9 1.54 2.43 3.13 1.82 1.57 ...
    ##  $ PSCD       : num  3.62 4.46 3.88 3.26 3.18 4.19 3.27 3.38 3.53 3.78 ...
    ##  $ PSCA       : num  1.78 1.65 5.47 2.6 5.3 6.87 3.2 2.41 5.07 7.66 ...
    ##  $ WHCH       : num  5 5 1.65 2.9 2.05 1.62 2.25 3 1.78 1.5 ...
    ##  $ WHCD       : num  3.8 4.2 3.9 3.1 3.2 3.9 3.3 3.4 3.5 3.8 ...
    ##  $ WHCA       : num  1.7 1.63 5.25 2.6 4 5.8 3.3 2.35 5 8 ...
    ##  $ VCCH       : num  4.8 5.2 1.7 3 1.9 1.57 2.45 3.13 1.87 1.55 ...
    ##  $ VCCD       : num  3.8 4.4 3.9 3.13 3.2 4 3.3 3.4 3.5 3.9 ...
    ##  $ VCCA       : num  1.8 1.65 5.5 2.63 5.2 7 3.13 2.4 4.6 8 ...
    ##  $ MaxCH      : num  5.8 6 1.72 3.05 1.95 1.58 2.46 3.38 1.87 1.58 ...
    ##  $ MaxCD      : num  3.9 4.52 3.95 3.29 3.26 4.2 3.42 3.47 3.65 4.05 ...
    ##  $ MaxCA      : num  1.81 1.75 6.2 2.72 5.3 7.3 3.58 2.48 5.35 8.9 ...
    ##  $ AvgCH      : num  5.03 4.93 1.68 2.93 1.9 1.54 2.37 3.05 1.83 1.53 ...
    ##  $ AvgCD      : num  3.66 4.26 3.82 3.14 3.16 4.05 3.25 3.34 3.5 3.84 ...
    ##  $ AvgCA      : num  1.76 1.65 5.37 2.59 4.91 6.66 3.18 2.39 4.74 7.68 ...
    ##  $ B365C.2.5  : num  1.9 1.44 2 2.2 2.75 1.9 2.1 2 2 2.37 ...
    ##  $ B365C.2.5.1: num  1.9 2.75 1.8 1.66 1.44 1.9 1.72 1.8 1.8 1.57 ...
    ##  $ PC.2.5     : num  1.98 1.49 2.06 2.2 2.84 1.95 2.18 2.04 2.03 2.43 ...
    ##  $ PC.2.5.1   : num  1.93 2.76 1.85 1.74 1.47 1.95 1.75 1.85 1.87 1.61 ...
    ##  $ MaxC.2.5   : num  1.99 1.51 2.08 2.38 2.85 1.98 2.18 2.09 2.07 2.46 ...
    ##  $ MaxC.2.5.1 : num  2.11 2.88 1.98 1.74 1.5 2.1 1.83 2.05 1.92 1.65 ...
    ##  $ AvgC.2.5   : num  1.86 1.47 2 2.24 2.69 1.9 2.1 1.97 1.99 2.36 ...
    ##  $ AvgC.2.5.1 : num  1.97 2.63 1.82 1.66 1.46 1.92 1.74 1.85 1.83 1.59 ...
    ##  $ AHCh       : num  0.75 1 -0.75 0 -0.5 -1 -0.25 0.25 -0.75 -1 ...
    ##  $ B365CAHH   : num  1.93 1.82 1.94 2.11 1.89 1.96 2.08 1.86 2.02 2.06 ...
    ##  $ B365CAHA   : num  2 1.97 1.99 1.82 2.04 1.97 1.85 2.07 1.77 1.87 ...
    ##   [list output truncated]

``` r
head(SP3)
```

    ##   Div       Date  Time   HomeTeam    AwayTeam FTHG FTAG FTR HTHG HTAG HTR HS AS
    ## 1 SP1 16/08/2019 20:00 Ath Bilbao   Barcelona    1    0   H    0    0   D 11 11
    ## 2 SP1 17/08/2019 16:00      Celta Real Madrid    1    3   A    0    1   A  7 17
    ## 3 SP1 17/08/2019 18:00   Valencia    Sociedad    1    1   D    0    0   D 14 12
    ## 4 SP1 17/08/2019 19:00   Mallorca       Eibar    2    1   H    1    0   H 16 11
    ## 5 SP1 17/08/2019 20:00    Leganes     Osasuna    0    1   A    0    0   D 13  4
    ## 6 SP1 17/08/2019 20:00 Villarreal     Granada    4    4   D    1    1   D 12 14
    ##   HST AST HF AF HC AC HY AY HR AR B365H B365D B365A  BWH  BWD  BWA  IWH  IWD
    ## 1   5   2 14  9  3  8  1  1  0  0  5.25  3.80  1.65 5.50 3.80 1.65 5.00 3.80
    ## 2   4  11 17 12  6  4  5  2  0  1  4.75  4.20  1.65 4.40 4.20 1.72 5.30 4.20
    ## 3   6   3 13 14  3  3  4  4  1  0  1.66  3.75  5.50 1.67 3.75 5.50 1.67 3.75
    ## 4   4   5 13 14  9  3  2  3  0  0  2.80  3.20  2.60 2.95 3.10 2.60 2.90 3.10
    ## 5   2   2 17 11  8  0  1  4  1  0  2.00  3.20  4.20 2.05 3.25 3.90 2.05 3.10
    ## 6   7   7 10 16  2  7  3  1  0  0  1.60  3.80  6.50 1.60 3.80 6.25 1.63 4.00
    ##    IWA  PSH  PSD  PSA  WHH WHD  WHA  VCH  VCD  VCA MaxH MaxD MaxA AvgH AvgD
    ## 1 1.70 5.15 3.84 1.74 5.00 3.8 1.70 5.00 3.80 1.75 5.50 3.95 1.76 5.07 3.81
    ## 2 1.60 4.73 4.18 1.72 5.25 4.2 1.60 4.75 4.20 1.73 5.30 4.40 1.73 4.67 4.12
    ## 3 5.30 1.68 3.94 5.47 1.67 3.8 5.25 1.67 3.90 5.75 1.72 3.98 5.75 1.68 3.80
    ## 4 2.60 2.98 3.14 2.66 2.90 3.1 2.62 2.90 3.13 2.70 3.05 3.20 2.70 2.91 3.09
    ## 5 4.05 2.10 3.21 4.13 2.05 3.2 4.00 2.10 3.20 4.10 2.10 3.30 4.25 2.06 3.18
    ## 6 5.50 1.62 3.99 6.13 1.60 3.9 5.80 1.65 4.00 5.75 1.65 4.15 6.50 1.61 3.95
    ##   AvgA B365.2.5 B365.2.5.1 P.2.5 P.2.5.1 Max.2.5 Max.2.5.1 Avg.2.5 Avg.2.5.1
    ## 1 1.71     1.80       2.00  1.81    2.09    1.85      2.11    1.79      2.05
    ## 2 1.69     1.53       2.50  1.52    2.66    1.53      2.72    1.49      2.58
    ## 3 5.29     2.00       1.80  2.08    1.82    2.14      1.83    2.07      1.77
    ## 4 2.62     2.30       1.61  2.45    1.60    2.47      1.65    2.34      1.60
    ## 5 4.02     2.50       1.53  2.72    1.50    2.75      1.54    2.59      1.49
    ## 6 5.80     1.80       2.00  1.88    2.02    1.90      2.05    1.84      1.98
    ##     AHh B365AHH B365AHA PAHH PAHA MaxAHH MaxAHA AvgAHH AvgAHA B365CH B365CD
    ## 1  0.75    1.99    1.94 1.98 1.94   2.00   1.95   1.96   1.92   5.25   3.80
    ## 2  0.75    2.04    1.89 2.01 1.91   2.05   1.91   2.00   1.88   5.25   4.20
    ## 3 -0.75    1.91    2.02 1.91 2.01   1.93   2.03   1.89   1.99   1.66   3.75
    ## 4  0.00    2.05    1.88 2.07 1.85   2.07   1.88   2.04   1.85   2.87   3.20
    ## 5 -0.50    2.08    1.85 2.10 1.82   2.10   1.85   2.06   1.83   1.90   3.10
    ## 6 -1.00    2.05    1.75 2.11 1.81   2.14   1.85   2.07   1.80   1.53   4.00
    ##   B365CA BWCH BWCD BWCA IWCH IWCD IWCA PSCH PSCD PSCA WHCH WHCD WHCA VCCH VCCD
    ## 1   1.65 4.75 3.75 1.75 5.00 3.80 1.70 5.34 3.62 1.78 5.00  3.8 1.70 4.80 3.80
    ## 2   1.57 4.50 4.10 1.70 4.60 3.80 1.75 5.10 4.46 1.65 5.00  4.2 1.63 5.20 4.40
    ## 3   5.50 1.65 3.80 5.50 1.67 3.80 5.30 1.69 3.88 5.47 1.65  3.9 5.25 1.70 3.90
    ## 4   2.55 2.95 3.10 2.60 2.90 3.10 2.60 2.96 3.26 2.60 2.90  3.1 2.60 3.00 3.13
    ## 5   5.00 1.95 3.20 4.50 1.90 3.15 4.85 1.90 3.18 5.30 2.05  3.2 4.00 1.90 3.20
    ## 6   6.50 1.57 3.80 6.50 1.55 4.05 6.30 1.54 4.19 6.87 1.62  3.9 5.80 1.57 4.00
    ##   VCCA MaxCH MaxCD MaxCA AvgCH AvgCD AvgCA B365C.2.5 B365C.2.5.1 PC.2.5
    ## 1 1.80  5.80  3.90  1.81  5.03  3.66  1.76      1.90        1.90   1.98
    ## 2 1.65  6.00  4.52  1.75  4.93  4.26  1.65      1.44        2.75   1.49
    ## 3 5.50  1.72  3.95  6.20  1.68  3.82  5.37      2.00        1.80   2.06
    ## 4 2.63  3.05  3.29  2.72  2.93  3.14  2.59      2.20        1.66   2.20
    ## 5 5.20  1.95  3.26  5.30  1.90  3.16  4.91      2.75        1.44   2.84
    ## 6 7.00  1.58  4.20  7.30  1.54  4.05  6.66      1.90        1.90   1.95
    ##   PC.2.5.1 MaxC.2.5 MaxC.2.5.1 AvgC.2.5 AvgC.2.5.1  AHCh B365CAHH B365CAHA
    ## 1     1.93     1.99       2.11     1.86       1.97  0.75     1.93     2.00
    ## 2     2.76     1.51       2.88     1.47       2.63  1.00     1.82     1.97
    ## 3     1.85     2.08       1.98     2.00       1.82 -0.75     1.94     1.99
    ## 4     1.74     2.38       1.74     2.24       1.66  0.00     2.11     1.82
    ## 5     1.47     2.85       1.50     2.69       1.46 -0.50     1.89     2.04
    ## 6     1.95     1.98       2.10     1.90       1.92 -1.00     1.96     1.97
    ##   PCAHH PCAHA MaxCAHH MaxCAHA AvgCAHH AvgCAHA
    ## 1  1.91  2.01    2.02    2.03    1.91    1.98
    ## 2  1.85  2.07    2.00    2.20    1.82    2.06
    ## 3  1.92  2.00    1.96    2.12    1.89    2.00
    ## 4  2.09  1.83    2.12    1.88    2.07    1.83
    ## 5  1.90  2.01    1.95    2.06    1.90    1.99
    ## 6  1.96  1.96    1.98    2.12    1.93    1.95

``` r
View(SP3)
summary(SP3)
```

    ##      Div                Date               Time             HomeTeam        
    ##  Length:380         Length:380         Length:380         Length:380        
    ##  Class :character   Class :character   Class :character   Class :character  
    ##  Mode  :character   Mode  :character   Mode  :character   Mode  :character  
    ##                                                                             
    ##                                                                             
    ##                                                                             
    ##                                                                             
    ##    AwayTeam              FTHG            FTAG           FTR           
    ##  Length:380         Min.   :0.000   Min.   :0.000   Length:380        
    ##  Class :character   1st Qu.:1.000   1st Qu.:0.000   Class :character  
    ##  Mode  :character   Median :1.000   Median :1.000   Mode  :character  
    ##                     Mean   :1.437   Mean   :1.042                     
    ##                     3rd Qu.:2.000   3rd Qu.:2.000                     
    ##                     Max.   :6.000   Max.   :5.000                     
    ##                                                                       
    ##       HTHG             HTAG          HTR                  HS       
    ##  Min.   :0.0000   Min.   :0.00   Length:380         Min.   : 3.00  
    ##  1st Qu.:0.0000   1st Qu.:0.00   Class :character   1st Qu.: 9.00  
    ##  Median :0.0000   Median :0.00   Mode  :character   Median :12.00  
    ##  Mean   :0.6026   Mean   :0.45                      Mean   :12.46  
    ##  3rd Qu.:1.0000   3rd Qu.:1.00                      3rd Qu.:15.00  
    ##  Max.   :4.0000   Max.   :3.00                      Max.   :25.00  
    ##                                                                    
    ##        AS             HST              AST               HF       
    ##  Min.   : 1.00   Min.   : 0.000   Min.   : 0.000   Min.   : 4.00  
    ##  1st Qu.: 7.00   1st Qu.: 3.000   1st Qu.: 2.000   1st Qu.:11.00  
    ##  Median :10.00   Median : 4.000   Median : 3.000   Median :13.00  
    ##  Mean   :10.14   Mean   : 4.337   Mean   : 3.511   Mean   :13.66  
    ##  3rd Qu.:12.25   3rd Qu.: 6.000   3rd Qu.: 5.000   3rd Qu.:16.00  
    ##  Max.   :24.00   Max.   :17.000   Max.   :12.000   Max.   :28.00  
    ##                                                                   
    ##        AF              HC               AC               HY       
    ##  Min.   : 5.00   Min.   : 0.000   Min.   : 0.000   Min.   :0.000  
    ##  1st Qu.:11.00   1st Qu.: 3.000   1st Qu.: 2.750   1st Qu.:1.000  
    ##  Median :13.00   Median : 5.000   Median : 4.000   Median :2.000  
    ##  Mean   :13.79   Mean   : 5.042   Mean   : 4.195   Mean   :2.547  
    ##  3rd Qu.:16.00   3rd Qu.: 7.000   3rd Qu.: 6.000   3rd Qu.:4.000  
    ##  Max.   :30.00   Max.   :14.000   Max.   :12.000   Max.   :7.000  
    ##                                                                   
    ##        AY              HR            AR             B365H       
    ##  Min.   :0.000   Min.   :0.0   Min.   :0.0000   Min.   : 1.120  
    ##  1st Qu.:2.000   1st Qu.:0.0   1st Qu.:0.0000   1st Qu.: 1.700  
    ##  Median :2.000   Median :0.0   Median :0.0000   Median : 2.200  
    ##  Mean   :2.584   Mean   :0.1   Mean   :0.1263   Mean   : 2.595  
    ##  3rd Qu.:4.000   3rd Qu.:0.0   3rd Qu.:0.0000   3rd Qu.: 2.900  
    ##  Max.   :8.000   Max.   :2.0   Max.   :2.0000   Max.   :10.000  
    ##                                                                 
    ##      B365D           B365A             BWH              BWD       
    ##  Min.   :2.800   Min.   : 1.280   Min.   : 1.120   Min.   :2.700  
    ##  1st Qu.:3.200   1st Qu.: 2.500   1st Qu.: 1.700   1st Qu.:3.200  
    ##  Median :3.400   Median : 3.500   Median : 2.200   Median :3.400  
    ##  Mean   :3.805   Mean   : 4.465   Mean   : 2.599   Mean   :3.813  
    ##  3rd Qu.:4.000   3rd Qu.: 5.062   3rd Qu.: 2.900   3rd Qu.:4.000  
    ##  Max.   :9.500   Max.   :21.000   Max.   :10.000   Max.   :9.500  
    ##                                                                   
    ##       BWA              IWH             IWD             IWA        
    ##  Min.   : 1.280   Min.   :1.130   Min.   :2.750   Min.   : 1.280  
    ##  1st Qu.: 2.550   1st Qu.:1.730   1st Qu.:3.188   1st Qu.: 2.550  
    ##  Median : 3.500   Median :2.200   Median :3.400   Median : 3.450  
    ##  Mean   : 4.438   Mean   :2.603   Mean   :3.770   Mean   : 4.378  
    ##  3rd Qu.: 5.250   3rd Qu.:2.913   3rd Qu.:4.000   3rd Qu.: 5.000  
    ##  Max.   :20.000   Max.   :9.900   Max.   :8.800   Max.   :19.500  
    ##                                                                   
    ##       PSH              PSD             PSA              WHH        
    ##  Min.   : 1.120   Min.   :2.780   Min.   : 1.290   Min.   : 1.110  
    ##  1st Qu.: 1.720   1st Qu.:3.230   1st Qu.: 2.600   1st Qu.: 1.700  
    ##  Median : 2.260   Median :3.515   Median : 3.520   Median : 2.225  
    ##  Mean   : 2.650   Mean   :3.894   Mean   : 4.673   Mean   : 2.616  
    ##  3rd Qu.: 2.958   3rd Qu.:4.088   3rd Qu.: 5.230   3rd Qu.: 2.900  
    ##  Max.   :10.020   Max.   :9.950   Max.   :25.500   Max.   :10.000  
    ##  NA's   :2        NA's   :2       NA's   :2                        
    ##       WHD             WHA              VCH              VCD       
    ##  Min.   :2.800   Min.   : 1.270   Min.   : 1.100   Min.   :2.800  
    ##  1st Qu.:3.200   1st Qu.: 2.550   1st Qu.: 1.700   1st Qu.:3.200  
    ##  Median :3.400   Median : 3.450   Median : 2.200   Median :3.500  
    ##  Mean   :3.802   Mean   : 4.623   Mean   : 2.582   Mean   :3.831  
    ##  3rd Qu.:4.000   3rd Qu.: 5.250   3rd Qu.: 2.885   3rd Qu.:4.025  
    ##  Max.   :9.000   Max.   :26.000   Max.   :10.500   Max.   :9.500  
    ##                                                                   
    ##       VCA              MaxH             MaxD             MaxA       
    ##  Min.   : 1.250   Min.   : 1.160   Min.   : 2.900   Min.   : 1.320  
    ##  1st Qu.: 2.500   1st Qu.: 1.778   1st Qu.: 3.340   1st Qu.: 2.678  
    ##  Median : 3.400   Median : 2.310   Median : 3.600   Median : 3.625  
    ##  Mean   : 4.453   Mean   : 2.757   Mean   : 4.019   Mean   : 4.951  
    ##  3rd Qu.: 5.000   3rd Qu.: 3.055   3rd Qu.: 4.202   3rd Qu.: 5.500  
    ##  Max.   :26.000   Max.   :11.000   Max.   :10.500   Max.   :31.000  
    ##                                                                     
    ##       AvgH            AvgD            AvgA           B365.2.5    
    ##  Min.   :1.120   Min.   :2.780   Min.   : 1.280   Min.   :1.280  
    ##  1st Qu.:1.718   1st Qu.:3.210   1st Qu.: 2.550   1st Qu.:1.800  
    ##  Median :2.220   Median :3.435   Median : 3.455   Median :2.100  
    ##  Mean   :2.608   Mean   :3.813   Mean   : 4.483   Mean   :2.108  
    ##  3rd Qu.:2.917   3rd Qu.:4.022   3rd Qu.: 5.093   3rd Qu.:2.500  
    ##  Max.   :9.910   Max.   :9.160   Max.   :21.610   Max.   :3.400  
    ##                                                                  
    ##    B365.2.5.1        P.2.5          P.2.5.1         Max.2.5     
    ##  Min.   :1.330   Min.   :1.310   Min.   :1.370   Min.   :1.310  
    ##  1st Qu.:1.530   1st Qu.:1.810   1st Qu.:1.570   1st Qu.:1.850  
    ##  Median :1.720   Median :2.145   Median :1.770   Median :2.175  
    ##  Mean   :1.867   Mean   :2.162   Mean   :1.912   Mean   :2.196  
    ##  3rd Qu.:2.000   3rd Qu.:2.520   3rd Qu.:2.098   3rd Qu.:2.553  
    ##  Max.   :3.750   Max.   :3.340   Max.   :3.640   Max.   :3.400  
    ##                  NA's   :2       NA's   :2                      
    ##    Max.2.5.1        Avg.2.5        Avg.2.5.1          AHh         
    ##  Min.   :1.380   Min.   :1.260   Min.   :1.350   Min.   :-2.5000  
    ##  1st Qu.:1.610   1st Qu.:1.780   1st Qu.:1.560   1st Qu.:-0.7500  
    ##  Median :1.820   Median :2.080   Median :1.750   Median :-0.2500  
    ##  Mean   :1.950   Mean   :2.099   Mean   :1.869   Mean   :-0.3289  
    ##  3rd Qu.:2.132   3rd Qu.:2.440   3rd Qu.:2.040   3rd Qu.: 0.0000  
    ##  Max.   :3.950   Max.   :3.160   Max.   :3.680   Max.   : 1.7500  
    ##                                                                   
    ##     B365AHH         B365AHA           PAHH            PAHA      
    ##  Min.   :1.670   Min.   :1.650   Min.   :1.750   Min.   :1.680  
    ##  1st Qu.:1.900   1st Qu.:1.890   1st Qu.:1.890   1st Qu.:1.880  
    ##  Median :1.970   Median :1.960   Median :1.970   Median :1.950  
    ##  Mean   :1.963   Mean   :1.954   Mean   :1.966   Mean   :1.954  
    ##  3rd Qu.:2.040   3rd Qu.:2.030   3rd Qu.:2.040   3rd Qu.:2.030  
    ##  Max.   :2.200   Max.   :2.160   Max.   :2.310   Max.   :2.200  
    ##  NA's   :10      NA's   :10      NA's   :2       NA's   :2      
    ##      MaxAHH          MaxAHA          AvgAHH          AvgAHA     
    ##  Min.   :1.800   Min.   :1.710   Min.   :1.740   Min.   :1.670  
    ##  1st Qu.:1.920   1st Qu.:1.910   1st Qu.:1.870   1st Qu.:1.860  
    ##  Median :1.990   Median :1.980   Median :1.940   Median :1.930  
    ##  Mean   :1.995   Mean   :1.988   Mean   :1.939   Mean   :1.932  
    ##  3rd Qu.:2.070   3rd Qu.:2.060   3rd Qu.:2.010   3rd Qu.:2.000  
    ##  Max.   :2.330   Max.   :2.250   Max.   :2.270   Max.   :2.170  
    ##                                                                 
    ##      B365CH           B365CD           B365CA            BWCH      
    ##  Min.   : 1.100   Min.   : 2.700   Min.   : 1.250   Min.   :1.100  
    ##  1st Qu.: 1.700   1st Qu.: 3.200   1st Qu.: 2.600   1st Qu.:1.715  
    ##  Median : 2.150   Median : 3.400   Median : 3.550   Median :2.200  
    ##  Mean   : 2.598   Mean   : 3.857   Mean   : 4.628   Mean   :2.603  
    ##  3rd Qu.: 2.870   3rd Qu.: 4.000   3rd Qu.: 5.250   3rd Qu.:2.900  
    ##  Max.   :11.000   Max.   :10.000   Max.   :26.000   Max.   :9.750  
    ##                                                                    
    ##       BWCD             BWCA            IWCH             IWCD      
    ##  Min.   : 2.750   Min.   : 1.28   Min.   : 1.120   Min.   :2.700  
    ##  1st Qu.: 3.200   1st Qu.: 2.60   1st Qu.: 1.730   1st Qu.:3.150  
    ##  Median : 3.400   Median : 3.50   Median : 2.225   Median :3.400  
    ##  Mean   : 3.817   Mean   : 4.55   Mean   : 2.609   Mean   :3.747  
    ##  3rd Qu.: 4.000   3rd Qu.: 5.25   3rd Qu.: 2.900   3rd Qu.:4.000  
    ##  Max.   :10.000   Max.   :23.00   Max.   :11.000   Max.   :9.000  
    ##                                                                   
    ##       IWCA             PSCH             PSCD             PSCA       
    ##  Min.   : 1.250   Min.   : 1.100   Min.   : 2.710   Min.   : 1.270  
    ##  1st Qu.: 2.600   1st Qu.: 1.720   1st Qu.: 3.188   1st Qu.: 2.688  
    ##  Median : 3.500   Median : 2.275   Median : 3.480   Median : 3.640  
    ##  Mean   : 4.368   Mean   : 2.672   Mean   : 3.900   Mean   : 4.873  
    ##  3rd Qu.: 5.100   3rd Qu.: 2.975   3rd Qu.: 4.062   3rd Qu.: 5.440  
    ##  Max.   :20.000   Max.   :10.930   Max.   :11.520   Max.   :28.530  
    ##                                                                     
    ##       WHCH             WHCD             WHCA             VCCH       
    ##  Min.   : 1.080   Min.   : 2.620   Min.   : 1.250   Min.   : 1.080  
    ##  1st Qu.: 1.700   1st Qu.: 3.200   1st Qu.: 2.600   1st Qu.: 1.722  
    ##  Median : 2.225   Median : 3.400   Median : 3.600   Median : 2.225  
    ##  Mean   : 2.647   Mean   : 3.827   Mean   : 4.793   Mean   : 2.600  
    ##  3rd Qu.: 2.900   3rd Qu.: 4.000   3rd Qu.: 5.250   3rd Qu.: 2.880  
    ##  Max.   :11.000   Max.   :11.000   Max.   :26.000   Max.   :10.500  
    ##                                                                     
    ##       VCCD             VCCA            MaxCH            MaxCD       
    ##  Min.   : 2.750   Min.   : 1.250   Min.   : 1.130   Min.   : 2.860  
    ##  1st Qu.: 3.200   1st Qu.: 2.600   1st Qu.: 1.788   1st Qu.: 3.320  
    ##  Median : 3.450   Median : 3.400   Median : 2.355   Median : 3.610  
    ##  Mean   : 3.845   Mean   : 4.549   Mean   : 2.836   Mean   : 4.062  
    ##  3rd Qu.: 4.000   3rd Qu.: 5.050   3rd Qu.: 3.105   3rd Qu.: 4.242  
    ##  Max.   :10.500   Max.   :26.000   Max.   :13.000   Max.   :12.400  
    ##                                                                     
    ##      MaxCA            AvgCH            AvgCD            AvgCA       
    ##  Min.   : 1.320   Min.   : 1.100   Min.   : 2.710   Min.   : 1.280  
    ##  1st Qu.: 2.743   1st Qu.: 1.710   1st Qu.: 3.167   1st Qu.: 2.618  
    ##  Median : 3.870   Median : 2.235   Median : 3.430   Median : 3.545  
    ##  Mean   : 5.215   Mean   : 2.625   Mean   : 3.824   Mean   : 4.630  
    ##  3rd Qu.: 5.750   3rd Qu.: 2.908   3rd Qu.: 4.032   3rd Qu.: 5.282  
    ##  Max.   :31.370   Max.   :10.390   Max.   :10.410   Max.   :24.600  
    ##                                                                     
    ##    B365C.2.5      B365C.2.5.1       PC.2.5         PC.2.5.1        MaxC.2.5    
    ##  Min.   :1.220   Min.   :1.30   Min.   :1.220   Min.   :1.320   Min.   :1.260  
    ##  1st Qu.:1.720   1st Qu.:1.53   1st Qu.:1.795   1st Qu.:1.570   1st Qu.:1.857  
    ##  Median :2.100   Median :1.72   Median :2.125   Median :1.790   Median :2.190  
    ##  Mean   :2.142   Mean   :1.87   Mean   :2.188   Mean   :1.922   Mean   :2.241  
    ##  3rd Qu.:2.500   3rd Qu.:2.10   3rd Qu.:2.530   3rd Qu.:2.110   3rd Qu.:2.560  
    ##  Max.   :3.500   Max.   :4.33   Max.   :3.720   Max.   :4.520   Max.   :3.720  
    ##                                                                                
    ##    MaxC.2.5.1       AvgC.2.5       AvgC.2.5.1         AHCh        
    ##  Min.   :1.330   Min.   :1.220   Min.   :1.290   Min.   :-2.7500  
    ##  1st Qu.:1.627   1st Qu.:1.760   1st Qu.:1.550   1st Qu.:-0.7500  
    ##  Median :1.840   Median :2.080   Median :1.750   Median :-0.2500  
    ##  Mean   :1.997   Mean   :2.118   Mean   :1.878   Mean   :-0.3329  
    ##  3rd Qu.:2.223   3rd Qu.:2.440   3rd Qu.:2.062   3rd Qu.: 0.0000  
    ##  Max.   :4.610   Max.   :3.520   Max.   :4.130   Max.   : 1.7500  
    ##                                                                   
    ##     B365CAHH        B365CAHA         PCAHH           PCAHA      
    ##  Min.   :1.700   Min.   :1.670   Min.   :1.750   Min.   :1.750  
    ##  1st Qu.:1.880   1st Qu.:1.880   1st Qu.:1.880   1st Qu.:1.880  
    ##  Median :1.960   Median :1.960   Median :1.960   Median :1.960  
    ##  Mean   :1.959   Mean   :1.956   Mean   :1.962   Mean   :1.959  
    ##  3rd Qu.:2.040   3rd Qu.:2.040   3rd Qu.:2.040   3rd Qu.:2.040  
    ##  Max.   :2.160   Max.   :2.160   Max.   :2.200   Max.   :2.210  
    ##                                                                 
    ##     MaxCAHH         MaxCAHA         AvgCAHH        AvgCAHA     
    ##  Min.   :1.780   Min.   :1.800   Min.   :1.72   Min.   :1.750  
    ##  1st Qu.:1.940   1st Qu.:1.930   1st Qu.:1.86   1st Qu.:1.860  
    ##  Median :2.020   Median :2.020   Median :1.93   Median :1.940  
    ##  Mean   :2.021   Mean   :2.016   Mean   :1.94   Mean   :1.938  
    ##  3rd Qu.:2.100   3rd Qu.:2.100   3rd Qu.:2.02   3rd Qu.:2.010  
    ##  Max.   :2.260   Max.   :2.270   Max.   :2.15   Max.   :2.180  
    ## 

  - Con la funciónn select del paquete dplyr selecciona unicamente las
    columnas Date, HomeTeam, AwayTeam,FTHG, FTAG y FTR; esto para cada
    uno de los data frames. (Hint: también puedes usar lapply).

<!-- end list -->

``` r
library(dplyr)
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
SP1 <- mutate(SP1, Date = as.Date(Date, "%d/%m/%y"))
SP2 <- mutate(SP2, Date = as.Date(Date, "%d/%m/%Y"))
SP3 <- mutate(SP3, Date = as.Date(Date, "%d/%m/%Y"))

SP4 <- list(SP1, SP2, SP3)
SPf <- lapply(SP4, select, Date, HomeTeam, AwayTeam, FTHG, FTAG, FTR)
str(SPf)
```

    ## List of 3
    ##  $ :'data.frame':    380 obs. of  6 variables:
    ##   ..$ Date    : Date[1:380], format: "2017-08-18" "2017-08-18" ...
    ##   ..$ HomeTeam: chr [1:380] "Leganes" "Valencia" "Celta" "Girona" ...
    ##   ..$ AwayTeam: chr [1:380] "Alaves" "Las Palmas" "Sociedad" "Ath Madrid" ...
    ##   ..$ FTHG    : int [1:380] 1 1 2 2 1 0 2 0 1 0 ...
    ##   ..$ FTAG    : int [1:380] 0 0 3 2 1 0 0 3 0 1 ...
    ##   ..$ FTR     : chr [1:380] "H" "H" "A" "D" ...
    ##  $ :'data.frame':    380 obs. of  6 variables:
    ##   ..$ Date    : Date[1:380], format: "2018-08-17" "2018-08-17" ...
    ##   ..$ HomeTeam: chr [1:380] "Betis" "Girona" "Barcelona" "Celta" ...
    ##   ..$ AwayTeam: chr [1:380] "Levante" "Valladolid" "Alaves" "Espanol" ...
    ##   ..$ FTHG    : int [1:380] 0 0 3 1 1 1 2 1 2 1 ...
    ##   ..$ FTAG    : int [1:380] 3 0 0 1 2 2 0 4 1 1 ...
    ##   ..$ FTR     : chr [1:380] "A" "D" "H" "D" ...
    ##  $ :'data.frame':    380 obs. of  6 variables:
    ##   ..$ Date    : Date[1:380], format: "2019-08-16" "2019-08-17" ...
    ##   ..$ HomeTeam: chr [1:380] "Ath Bilbao" "Celta" "Valencia" "Mallorca" ...
    ##   ..$ AwayTeam: chr [1:380] "Barcelona" "Real Madrid" "Sociedad" "Eibar" ...
    ##   ..$ FTHG    : int [1:380] 1 1 1 2 0 4 1 0 1 1 ...
    ##   ..$ FTAG    : int [1:380] 0 3 1 1 1 4 0 2 2 0 ...
    ##   ..$ FTR     : chr [1:380] "H" "A" "D" "H" ...

  - Asegurate de que los elementos de las columnas correspondientes de
    los nuevos data frames sean del mismo tipo (Hint 1: usa as.Date y
    mutate para arreglar las fechas). Con ayuda de la función rbind
    forma un único data frame que contenga las seis columnas mencionadas
    en el punto 3 (Hint 2: la función do.call podría ser utilizada).

<!-- end list -->

``` r
LigaEspañola <- do.call(rbind, SPf)
head(LigaEspañola)
```

    ##         Date   HomeTeam   AwayTeam FTHG FTAG FTR
    ## 1 2017-08-18    Leganes     Alaves    1    0   H
    ## 2 2017-08-18   Valencia Las Palmas    1    0   H
    ## 3 2017-08-19      Celta   Sociedad    2    3   A
    ## 4 2017-08-19     Girona Ath Madrid    2    2   D
    ## 5 2017-08-19    Sevilla    Espanol    1    1   D
    ## 6 2017-08-20 Ath Bilbao     Getafe    0    0   D

``` r
tail(LigaEspañola)
```

    ##            Date HomeTeam    AwayTeam FTHG FTAG FTR
    ## 1135 2020-07-19  Espanol       Celta    0    0   D
    ## 1136 2020-07-19  Granada  Ath Bilbao    4    0   H
    ## 1137 2020-07-19  Leganes Real Madrid    2    2   D
    ## 1138 2020-07-19  Levante      Getafe    1    0   H
    ## 1139 2020-07-19  Osasuna    Mallorca    2    2   D
    ## 1140 2020-07-19  Sevilla    Valencia    1    0   H

``` r
str(LigaEspañola)
```

    ## 'data.frame':    1140 obs. of  6 variables:
    ##  $ Date    : Date, format: "2017-08-18" "2017-08-18" ...
    ##  $ HomeTeam: chr  "Leganes" "Valencia" "Celta" "Girona" ...
    ##  $ AwayTeam: chr  "Alaves" "Las Palmas" "Sociedad" "Ath Madrid" ...
    ##  $ FTHG    : int  1 1 2 2 1 0 2 0 1 0 ...
    ##  $ FTAG    : int  0 0 3 2 1 0 0 3 0 1 ...
    ##  $ FTR     : chr  "H" "H" "A" "D" ...

``` r
#write.csv(LigaEspañola, "LigaEspañola.csv", row.names = FALSE)
```

## Sesión 3

Ahora graficaremos probabilidades (estimadas) marginales y conjuntas
para el número de goles que anotan en un partido el equipo de casa o el
equipo visitante.

Con el último data frame obtenido en el postwork de la sesión 2, elabora
tablas de frecuencias relativas para estimar las siguientes
probabilidades.

``` r
LigaEspañola <- read.csv("./LigaEspañola.csv")
str(LigaEspañola)
```

    ## 'data.frame':    1140 obs. of  6 variables:
    ##  $ Date    : chr  "2017-08-18" "2017-08-18" "2017-08-19" "2017-08-19" ...
    ##  $ HomeTeam: chr  "Leganes" "Valencia" "Celta" "Girona" ...
    ##  $ AwayTeam: chr  "Alaves" "Las Palmas" "Sociedad" "Ath Madrid" ...
    ##  $ FTHG    : int  1 1 2 2 1 0 2 0 1 0 ...
    ##  $ FTAG    : int  0 0 3 2 1 0 0 3 0 1 ...
    ##  $ FTR     : chr  "H" "H" "A" "D" ...

``` r
head(LigaEspañola)
```

    ##         Date   HomeTeam   AwayTeam FTHG FTAG FTR
    ## 1 2017-08-18    Leganes     Alaves    1    0   H
    ## 2 2017-08-18   Valencia Las Palmas    1    0   H
    ## 3 2017-08-19      Celta   Sociedad    2    3   A
    ## 4 2017-08-19     Girona Ath Madrid    2    2   D
    ## 5 2017-08-19    Sevilla    Espanol    1    1   D
    ## 6 2017-08-20 Ath Bilbao     Getafe    0    0   D

``` r
View(LigaEspañola)
```

  - La probabilidad (marginal) de que el equipo que juega en casa anote
    x goles (x=0,1,2,)

<!-- end list -->

``` r
FTHG <- table(LigaEspañola$FTHG)
(FTHG1 <- prop.table(FTHG))
```

    ## 
    ##           0           1           2           3           4           5 
    ## 0.232456140 0.327192982 0.266666667 0.112280702 0.035087719 0.019298246 
    ##           6           7           8 
    ## 0.005263158 0.000877193 0.000877193

``` r
dfH <-
  as.data.frame(FTHG1)
```

Creo los data frames para poder usar ggplot, ya que no puedo usarlo con
una tabla

  - La probabilidad (marginal) de que el equipo que juega como visitante
    anote y goles (y=0,1,2,)

<!-- end list -->

``` r
FTAG <- table(LigaEspañola$FTAG)
FTAG1 <- prop.table(FTAG)

dfA <- as.data.frame(FTAG1)
```

  - La probabilidad (conjunta) de que el equipo que juega en casa anote
    x goles y el equipo que juega como visitante anote y goles
    (x=0,1,2,, y=0,1,2,)

<!-- end list -->

``` r
FTTG <- table(LigaEspañola$FTHG, LigaEspañola$FTAG)
FTTG1 <- prop.table(FTTG)

dfT <- as.data.frame(FTTG1)
```

Realiza lo siguiente:

  - Un gráfico de barras para las probabilidades marginales estimadas
    del número de goles que anota el equipo de casa.

<!-- end list -->

``` r
barplot(
  FTHG1,
  main = "Probabilidad marginal FTHG",
  xlab = "Numero de goles",
  ylab = "Frecuencia relativa",
  col = "Yellow"
)

library(ggplot2)
```

![](postwork-readme_files/figure-gfm/unnamed-chunk-15-1.png)<!-- -->

``` r
ggplot(dfH, aes(x = Var1, y = Freq)) +
  geom_bar(stat = "identity", col = "black", fill = "Yellow") +
  ggtitle("Probabilidad marginal FTHG") +
  xlab("Numero de goles") +
  ylab("Frecuencia relativa") +
  theme_grey()
```

![](postwork-readme_files/figure-gfm/unnamed-chunk-15-2.png)<!-- --> \*
Un gráfico de barras para las probabilidades marginales estimadas del
número de goles que anota el equipo visitante.

``` r
barplot(
  FTAG1,
  main = "Probabilidad marginal FTAG",
  xlab = "Numero de goles",
  ylab = "Frecuencia relativa",
  col = "Orange"
)
```

![](postwork-readme_files/figure-gfm/unnamed-chunk-16-1.png)<!-- -->

``` r
ggplot(dfA, aes(x = Var1, y = Freq)) +
  geom_bar(stat = "identity", col = "Black", fill = "Orange") +
  ggtitle("Probabilidad marginal FTAG") +
  labs(x = "Numero de goles",
       y = "Frecuencia relativa") +
  theme_grey()
```

![](postwork-readme_files/figure-gfm/unnamed-chunk-16-2.png)<!-- -->

  - Un HeatMap para las probabilidades conjuntas estimadas de los
    números de goles que anotan el equipo de casa y el equipo visitante
    en un partido.

<!-- end list -->

``` r
library(scales)

ggplot(dfT, aes(x = Var1, y = Var2, fill = Freq)) +
  ggtitle("Probabilidad conjunta FTTG") +
  labs(x = "Goles casa",
       y = "Goles visitante") +
  geom_tile() +
  scale_fill_gradient2(low = "Black", high = "Blue", mid = "Yellow") +
  theme_dark()
```

![](postwork-readme_files/figure-gfm/unnamed-chunk-17-1.png)<!-- -->

## Sesión 4

Ahora investigarás la dependencia o independencia del úmero de goles
anotados por el equipo de casa y el número de goles anotados por el
equipo visitante mediante un procedimiento denominado bootstrap, revisa
bibliografía en internet para que tengas nociones de este desarrollo.

Ya hemos estimado las probabilidades conjuntas de que el equipo de casa
anote X=x goles(x=0,1,… ,8), y el equipo visitante anote Y=y goles
(y=0,1,… ,6), en un partido.

1.  Obtén una tabla de cocientes al dividir estas probabilidades
    conjuntas por el producto de las probabilidades marginales
    correspondientes.

Llamamos y renombramos a nuestras 3 variables.

``` r
visitante <- FTAG1
local <- FTHG1
conjunta <- FTTG1

cocientes <- apply(conjunta, 2, function(col)
  col / local)
cocientes <- apply(cocientes, 1, function(fila)
  fila / visitante)
cocientes <- t(cocientes)
```

2.  Mediante un procedimiento de boostrap, obtén más cocientes similares
    a los obtenidos en la tabla del punto anterior. Esto para tener una
    idea de las distribuciones de la cual vienen los cocientes en la
    tabla anterior. Menciona en cuáles casos le parece razonable suponer
    que los cocientes de la tabla en el punto 1, son iguales a 1 (en tal
    caso tendríamos independencia de las variables aleatorias X y Y).

<!-- end list -->

``` r
medias <- c()
for (i in 1:10000) {
  set.seed(2 * i)
  medias[i] = mean(sample(cocientes, replace = TRUE))
  
}

head(medias)
```

    ## [1] 0.7903405 0.6673428 0.8366734 0.8373624 0.9553346 1.1302392

``` r
library(ggplot2)

ggplot() +
  geom_histogram(aes(medias), bins = 50) +
  geom_vline(aes(xintercept = mean(medias))) +
  ggtitle("Histograma de distribución de medias muestrales")
```

![](postwork-readme_files/figure-gfm/unnamed-chunk-19-1.png)<!-- -->
Según el Teorema Central del Limite, la media debería ser igual a 1
para suponer que las variables son independientes, y visualmente se
observa en el histograma que la media es inferior a 1. Por lo cual las
variables X y Y no son independientes.

## Sesión 5

  - A partir del conjunto de datos de soccer de la liga espalola de las
    temporadas 2017/2018, 2018/2019 y 2019/2020, crea el data frame
    SmallData, que contenga las columnas date, home.team, home.score,
    away.team y away.score; esto lo puedes hacer con ayuda de la función
    select del paquete dplyr. Luego crea un directorio de trabajo y con
    ayuda de la funci?n write.csv guarde el data frame como un archivo
    csv con nombre soccer.csv. Puedes colocar como argumento row.names =
    FALSE en write.csv.

<!-- end list -->

``` r
library(dplyr)

SP1 <-
  read.csv("https://www.football-data.co.uk/mmz4281/1718/SP1.csv")
SP2 <-
  read.csv("https://www.football-data.co.uk/mmz4281/1819/SP1.csv")
SP3 <-
  read.csv("https://www.football-data.co.uk/mmz4281/1920/SP1.csv")

SP1 <- mutate(SP1, Date = as.Date(Date, "%d/%m/%y"))
SP2 <- mutate(SP2, Date = as.Date(Date, "%d/%m/%Y"))
SP3 <- mutate(SP3, Date = as.Date(Date, "%d/%m/%Y"))

lista <- list(SP1, SP2, SP3)
lista <- lapply(lista, select, Date, HomeTeam, FTHG, AwayTeam, FTAG, )
str(lista)
```

    ## List of 3
    ##  $ :'data.frame':    380 obs. of  5 variables:
    ##   ..$ Date    : Date[1:380], format: "2017-08-18" "2017-08-18" ...
    ##   ..$ HomeTeam: chr [1:380] "Leganes" "Valencia" "Celta" "Girona" ...
    ##   ..$ FTHG    : int [1:380] 1 1 2 2 1 0 2 0 1 0 ...
    ##   ..$ AwayTeam: chr [1:380] "Alaves" "Las Palmas" "Sociedad" "Ath Madrid" ...
    ##   ..$ FTAG    : int [1:380] 0 0 3 2 1 0 0 3 0 1 ...
    ##  $ :'data.frame':    380 obs. of  5 variables:
    ##   ..$ Date    : Date[1:380], format: "2018-08-17" "2018-08-17" ...
    ##   ..$ HomeTeam: chr [1:380] "Betis" "Girona" "Barcelona" "Celta" ...
    ##   ..$ FTHG    : int [1:380] 0 0 3 1 1 1 2 1 2 1 ...
    ##   ..$ AwayTeam: chr [1:380] "Levante" "Valladolid" "Alaves" "Espanol" ...
    ##   ..$ FTAG    : int [1:380] 3 0 0 1 2 2 0 4 1 1 ...
    ##  $ :'data.frame':    380 obs. of  5 variables:
    ##   ..$ Date    : Date[1:380], format: "2019-08-16" "2019-08-17" ...
    ##   ..$ HomeTeam: chr [1:380] "Ath Bilbao" "Celta" "Valencia" "Mallorca" ...
    ##   ..$ FTHG    : int [1:380] 1 1 1 2 0 4 1 0 1 1 ...
    ##   ..$ AwayTeam: chr [1:380] "Barcelona" "Real Madrid" "Sociedad" "Eibar" ...
    ##   ..$ FTAG    : int [1:380] 0 3 1 1 1 4 0 2 2 0 ...

``` r
Data <- do.call(rbind, lista)
SmallData <- select(
  Data,
  date = Date,
  home.team = HomeTeam,
  home.score = FTHG,
  away.team = AwayTeam,
  away.score = FTAG
)


head(SmallData)
```

    ##         date  home.team home.score  away.team away.score
    ## 1 2017-08-18    Leganes          1     Alaves          0
    ## 2 2017-08-18   Valencia          1 Las Palmas          0
    ## 3 2017-08-19      Celta          2   Sociedad          3
    ## 4 2017-08-19     Girona          2 Ath Madrid          2
    ## 5 2017-08-19    Sevilla          1    Espanol          1
    ## 6 2017-08-20 Ath Bilbao          0     Getafe          0

``` r
tail(SmallData)
```

    ##            date home.team home.score   away.team away.score
    ## 1135 2020-07-19   Espanol          0       Celta          0
    ## 1136 2020-07-19   Granada          4  Ath Bilbao          0
    ## 1137 2020-07-19   Leganes          2 Real Madrid          2
    ## 1138 2020-07-19   Levante          1      Getafe          0
    ## 1139 2020-07-19   Osasuna          2    Mallorca          2
    ## 1140 2020-07-19   Sevilla          1    Valencia          0

``` r
class(SmallData)
```

    ## [1] "data.frame"

``` r
#write.csv(SmallData, file = "soccer.csv", row.names = FALSE)
```

  - Con la función create.fbRanks.dataframes del paquete fbRanks importa
    el archivo soccer.csv a R y al mismo tiempo asignarlo a una variable
    llamada listasoccer. Se creará una lista con los elementos scores y
    teams que son data frames listos para la función rank.teams. Asigna
    estos data frames a variables llamadas anotaciones y equipos.

<!-- end list -->

``` r
#install.packages("fbRanks")
library(fbRanks)

listasoccer <- create.fbRanks.dataframes(scores.file = "./soccer.csv")
```

    ## Alert: teams info file was not passed in.
    ## Will construct one from the scores data frame but teams in the scores file must use a unique name.
    ## Alert: teams resolver was not passed in.
    ## Will construct one from the team info data frame.

``` r
anotaciones <- listasoccer$scores
equipos <- listasoccer$teams
```

  - Con ayuda de la función unique crea un vector de fechas (fecha) que
    no se repitan y que correspondan a las fechas en las que se jugaron
    partidos. Crea una variable llamada n que contenga el número de
    fechas diferentes. Posteriormente, con la función rank.teams y
    usando como argumentos los data frames anotaciones y equipos, crea
    un ranking de equipos usando únicamente datos desde la fecha inicial
    y hasta la penúltima fecha en la que se jugaron partidos, estas
    fechas las deberás especificar en max.date y min.date. Guarda los
    resultados con el nombre ranking.

<!-- end list -->

``` r
fecha <- unique(anotaciones$date)
n <- length(fecha)
ranking <- rank.teams(
  scores = anotaciones,
  teams = equipos,
  max.date = fecha[n - 1],
  min.date = fecha[1]
)
```

    ## 
    ## Team Rankings based on matches 2017-08-18 to 2020-07-16
    ##    team        total attack defense n.games.Var1 n.games.Freq
    ## 1  Barcelona    1.51 2.23   1.28    Barcelona    113         
    ## 2  Ath Madrid   1.24 1.33   1.78    Ath Madrid   113         
    ## 3  Real Madrid  1.15 1.86   1.19    Real Madrid  113         
    ## 4  Valencia     0.56 1.34   1.10    Valencia     113         
    ## 5  Getafe       0.55 1.10   1.33    Getafe       113         
    ## 6  Sevilla      0.43 1.37   0.98    Sevilla      113         
    ## 7  Granada      0.37 1.26   1.03    Granada       37         
    ## 8  Villarreal   0.33 1.38   0.91    Villarreal   113         
    ## 9  Sociedad     0.32 1.39   0.90    Sociedad     113         
    ## 10 Ath Bilbao   0.15 1.02   1.09    Ath Bilbao   113         
    ## 11 Osasuna      0.07 1.18   0.89    Osasuna       37         
    ## 12 Betis        0.05 1.28   0.81    Betis        113         
    ## 13 Celta        0.02 1.26   0.81    Celta        113         
    ## 14 Eibar       -0.02 1.08   0.91    Eibar        113         
    ## 15 Levante     -0.03 1.26   0.78    Levante      113         
    ## 16 Girona      -0.18 1.07   0.83    Girona        76         
    ## 17 Espanol     -0.21 0.93   0.93    Espanol      113         
    ## 18 Alaves      -0.23 0.95   0.90    Alaves       113         
    ## 19 Leganes     -0.31 0.82   0.98    Leganes      113         
    ## 20 Valladolid  -0.33 0.79   1.00    Valladolid    75         
    ## 21 Huesca      -0.35 1.09   0.72    Huesca        38         
    ## 22 Mallorca    -0.41 1.02   0.74    Mallorca      37         
    ## 23 Vallecano   -0.51 1.04   0.67    Vallecano     38         
    ## 24 La Coruna   -0.82 0.94   0.60    La Coruna     38         
    ## 25 Malaga      -1.17 0.58   0.76    Malaga        38         
    ## 26 Las Palmas  -1.43 0.59   0.63    Las Palmas    38

  - Finalmente estima las probabilidades de los eventos, el equipo de
    casa gana, el equipo visitante gana o el resultado es un empate para
    los partidos que se jugaron en la ?ltima fecha del vector de fechas
    fecha. Esto lo puedes hacer con ayuda de la función predict y usando
    como argumentos ranking y fecha\[n\] que deberás especificar en
    date.

<!-- end list -->

``` r
pred <- predict(ranking, date = fecha[n])
```

    ## Predicted Match Results for 1900-05-01 to 2100-06-01
    ## Model based on data from 2017-08-18 to 2020-07-16
    ## ---------------------------------------------
    ## 2020-07-19 Alaves vs Barcelona, HW 9%, AW 76%, T 15%, pred score 0.7-2.5  actual: AW (0-5)
    ## 2020-07-19 Valladolid vs Betis, HW 29%, AW 43%, T 28%, pred score 1-1.3  actual: HW (2-0)
    ## 2020-07-19 Villarreal vs Eibar, HW 45%, AW 30%, T 25%, pred score 1.5-1.2  actual: HW (4-0)
    ## 2020-07-19 Ath Madrid vs Sociedad, HW 54%, AW 20%, T 27%, pred score 1.5-0.8  actual: T (1-1)
    ## 2020-07-19 Espanol vs Celta, HW 32%, AW 41%, T 27%, pred score 1.2-1.4  actual: T (0-0)
    ## 2020-07-19 Granada vs Ath Bilbao, HW 39%, AW 31%, T 29%, pred score 1.2-1  actual: HW (4-0)
    ## 2020-07-19 Leganes vs Real Madrid, HW 13%, AW 66%, T 21%, pred score 0.7-1.9  actual: T (2-2)
    ## 2020-07-19 Levante vs Getafe, HW 25%, AW 48%, T 27%, pred score 0.9-1.4  actual: HW (1-0)
    ## 2020-07-19 Osasuna vs Mallorca, HW 48%, AW 27%, T 25%, pred score 1.6-1.1  actual: T (2-2)
    ## 2020-07-19 Sevilla vs Valencia, HW 34%, AW 39%, T 26%, pred score 1.2-1.4  actual: HW (1-0)

# Sesión 6

  - Importe el conjunto de datos match.data.csv a R y realice lo
    siguiente:

<!-- end list -->

``` r
library(dplyr)
data <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-con-R-Santander/master/Sesion-06/Postwork/match.data.csv")
str(data)
```

    ## 'data.frame':    3800 obs. of  5 variables:
    ##  $ date      : chr  "2010-08-28" "2010-08-28" "2010-08-28" "2010-08-29" ...
    ##  $ home.team : chr  "Hercules" "Levante" "Malaga" "Espanol" ...
    ##  $ home.score: int  0 1 1 3 0 0 0 0 1 4 ...
    ##  $ away.team : chr  "Ath Bilbao" "Sevilla" "Valencia" "Getafe" ...
    ##  $ away.score: int  1 4 3 1 0 0 0 3 0 0 ...

1.  Agrega una nueva columna sumagoles que contenga la suma de goles por
    partido.

<!-- end list -->

``` r
data1 <- data %>%
  mutate(date = as.Date(date, "%Y-%m-%d"),
         sumagoles = home.score + away.score)
```

2.Obtén el promedio por mes de la suma de goles.

``` r
data1 <- data1 %>%
  mutate(Mes = format(date, "%Y-%m")) %>%
  group_by(Mes) %>%
  summarise(promgoles = mean(sumagoles))
```

    ## `summarise()` ungrouping output (override with `.groups` argument)

``` r
class(data1)
```

    ## [1] "tbl_df"     "tbl"        "data.frame"

``` r
data1 <- as.data.frame(data1)
```

3.  Crea la serie de tiempo del promedio por mes de la suma de goles
    hasta diciembre de 2019.

<!-- end list -->

``` r
data2 <- data1[1:96, ]

GolesPromedio <- ts(data2$promgoles, start = 1,
                    frequency = 10)
```

4.  Grafica la serie de tiempo.

<!-- end list -->

``` r
ts.plot(GolesPromedio)
```

![](postwork-readme_files/figure-gfm/unnamed-chunk-28-1.png)<!-- -->

## Sesión 7

  - Utilizando el manejador de BDD Mongodb Compass (previamente
    instalado), deberás de realizar las siguientes acciones:

<!-- end list -->

``` r
#install.packages("mongolite")
library(mongolite)
```

1.  Alojar el fichero data.csv en una base de datos llamada
    match\_games, nombrando al collection como match.

<!-- end list -->

``` r
match <-
  read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-con-R-Santander/master/Sesion-07/Postwork/data.csv")


Coleccion <- mongo(collection = "match",
                   db = "match_games",
                   url = "mongodb+srv://admin1:wrcbxHRSebevWuJu@cluster0.e93jn.mongodb.net/test")

Coleccion$insert(match)
```

    ## List of 5
    ##  $ nInserted  : num 1140
    ##  $ nMatched   : num 0
    ##  $ nRemoved   : num 0
    ##  $ nUpserted  : num 0
    ##  $ writeErrors: list()

2.  Una vez hecho esto, realizar un count para conocer el número de
    registros que se tiene en la base

<!-- end list -->

``` r
Coleccion$count()
```

    ## [1] 5700

Esta funcion genera un output muy grande, asi que solo se muestran 50 registros
``` r
Coleccion$find()
```

    ##         X       Date    HomeTeam    AwayTeam FTHG FTAG FTR
    ## 1       1 2017-08-18     Leganes      Alaves    1    0   H
    ## 2       2 2017-08-18    Valencia  Las Palmas    1    0   H
    ## 3       3 2017-08-19       Celta    Sociedad    2    3   A
    ## 4       4 2017-08-19      Girona  Ath Madrid    2    2   D
    ## 5       5 2017-08-19     Sevilla     Espanol    1    1   D
    ## 6       6 2017-08-20  Ath Bilbao      Getafe    0    0   D
    ## 7       7 2017-08-20   Barcelona       Betis    2    0   H
    ## 8       8 2017-08-20   La Coruna Real Madrid    0    3   A
    ## 9       9 2017-08-21     Levante  Villarreal    1    0   H
    ## 10     10 2017-08-21      Malaga       Eibar    0    1   A
    ## 11     11 2017-08-25       Betis       Celta    2    1   H
    ## 12     12 2017-08-25    Sociedad  Villarreal    3    0   H
    ## 13     13 2017-08-26      Alaves   Barcelona    0    2   A
    ## 14     14 2017-08-26      Girona      Malaga    1    0   H
    ## 15     15 2017-08-26  Las Palmas  Ath Madrid    1    5   A
    ## 16     16 2017-08-26     Levante   La Coruna    2    2   D
    ## 17     17 2017-08-27       Eibar  Ath Bilbao    0    1   A
    ## 18     18 2017-08-27     Espanol     Leganes    0    1   A
    ## 19     19 2017-08-27      Getafe     Sevilla    0    1   A
    ## 20     20 2017-08-27 Real Madrid    Valencia    2    2   D
    ## 21     21 2017-09-08     Leganes      Getafe    1    2   A
    ## 22     22 2017-09-09   Barcelona     Espanol    5    0   H
    ## 23     23 2017-09-09 Real Madrid     Levante    1    1   D
    ## 24     24 2017-09-09     Sevilla       Eibar    3    0   H
    ## 25     25 2017-09-09    Valencia  Ath Madrid    0    0   D
    ## 26     26 2017-09-10  Ath Bilbao      Girona    2    0   H
    ## 27     27 2017-09-10       Celta      Alaves    1    0   H
    ## 28     28 2017-09-10   La Coruna    Sociedad    2    4   A
    ## 29     29 2017-09-10  Villarreal       Betis    3    1   H
    ## 30     30 2017-09-11      Malaga  Las Palmas    1    3   A
    ## 31     31 2017-09-15       Eibar     Leganes    1    0   H
    ## 32     32 2017-09-16  Ath Madrid      Malaga    1    0   H
    ## 33     33 2017-09-16       Betis   La Coruna    2    1   H
    ## 34     34 2017-09-16      Getafe   Barcelona    1    2   A
    ## 35     35 2017-09-16     Levante    Valencia    1    1   D
    ## 36     36 2017-09-17      Alaves  Villarreal    0    3   A
    ## 37     37 2017-09-17      Girona     Sevilla    0    1   A
    ## 38     38 2017-09-17  Las Palmas  Ath Bilbao    1    0   H
    ## 39     39 2017-09-17    Sociedad Real Madrid    1    3   A
    ## 40     40 2017-09-18     Espanol       Celta    2    1   H
    ## 41     41 2017-09-19   Barcelona       Eibar    6    1   H
    ## 42     42 2017-09-19    Valencia      Malaga    5    0   H
    ## 43     43 2017-09-20  Ath Bilbao  Ath Madrid    1    2   A
    ## 44     44 2017-09-20   La Coruna      Alaves    1    0   H
    ## 45     45 2017-09-20     Leganes      Girona    0    0   D
    ## 46     46 2017-09-20 Real Madrid       Betis    0    1   A
    ## 47     47 2017-09-20     Sevilla  Las Palmas    1    0   H
    ## 48     48 2017-09-21       Celta      Getafe    1    1   D
    ## 49     49 2017-09-21     Levante    Sociedad    3    0   H
    ## 50     50 2017-09-21  Villarreal     Espanol    0    0   D
  


1.  Realiza una consulta utilizando la sintaxis de Mongodb, en la base
    de datos para conocer el número de goles que metió el Real Madrid el
    20 de diciembre de 2015 y contra que equipo jugó, si perdió o si
    fuegoleada

<!-- end list -->

``` r
Coleccion$find('{"date":"2015-12-20", "home_team":"Real Madrid"}')
```

    ## data frame with 0 columns and 0 rows

Dicha fecha no se encuentra en el dataset

4.  Agrega el dataset de mtcars a la misma BDD

<!-- end list -->

``` r
Coleccion <- mongo(collection = "mtcars",
                   db = "match_games",
                   url = "mongodb+srv://admin1:wrcbxHRSebevWuJu@cluster0.e93jn.mongodb.net/test")

Coleccion$insert(mtcars)
```

    ## List of 5
    ##  $ nInserted  : num 32
    ##  $ nMatched   : num 0
    ##  $ nRemoved   : num 0
    ##  $ nUpserted  : num 0
    ##  $ writeErrors: list()

5.  Por último, no olvides cerrar la conexi?n con la BDD.

<!-- end list -->

``` r
rm(Coleccion)
```

## Sesión 8

### Para este postwork genera un dashboard en un solo archivo `app.R`, para esto realiza lo siguiente:

  - Ejecuta el código `momios.R`

  - Almacena los gráficos resultantes en formato `png`

  - Crea un dashboard donde se muestren los resultados con 4 pestañas:

  - Una con las gráficas de barras, donde en el eje de las x se muestren
    los goles de local y visitante con un menu de selección, con una
    geometria de tipo barras además de hacer un facet\_wrap con el
    equipo visitante

  - Realiza una pestaña donde agregues las imágenes de las gráficas del
    postwork 3

  - En otra pestaña coloca el data table del fichero `match.data.csv`

  - Por último en otra pestaña agrega las imágenes de las gráficas de
    los factores de ganancia mínimo y máximo

El siguiente codigo forma parte de un script app.r que depende de
ciertos archivos.

``` r
library(ggplot2)
library(shiny)
library(shinydashboard)
```

    ## 
    ## Attaching package: 'shinydashboard'

    ## The following object is masked from 'package:graphics':
    ## 
    ##     box

``` r
library(shinythemes)

ui <-
    
    fluidPage(dashboardPage(
        dashboardHeader(title = "Postwork 8"),
        
        dashboardSidebar(sidebarMenu(
            menuItem("Gráficos", tabName = "dashboard"),
            menuItem("Goles", tabName = "goles"),
            menuItem("Data Table", tabName = "data_table"),
            menuItem("Imagenes", tabName = "momios")
            
        )),
        
        dashboardBody(tabItems(
            # Histograma
            tabItem(tabName = "dashboard",
                    fluidRow(
                        titlePanel("Goles"),
                        selectInput("x", "Selecciona la variable",
                                    choices = c("FTHG", "FTAG")),
                        
                        
                        
                        plotOutput("plot1", height = 400, width = 700)
                        
                        
                    )),
            
            # imágenes
            tabItem(tabName = "goles",
                    fluidRow(
                        titlePanel(h3("Probabilidad de goles")),
                        
                        img(src = "home_prob.png") ,
                        img(src = "away_prob.png"),
                        img(src = "heatmap.png")
                        
                    )),
            
            
            
            tabItem(tabName = "data_table",
                    fluidRow(
                        titlePanel(h3("Data Table")),
                        dataTableOutput ("data_table")
                    )),
            
            tabItem(tabName = "momios",
                    fluidRow(
                        titlePanel(h3("Imagenes")),
                        h3("Momios Máximo"),
                        img(
                            src = "momios_maximo.png",
                        ),
                        h3("Momios Promedio"),
                        img(
                            src = "momios_promedio.png",
                            
                        )
                    ))
            
        ))
    ))

server <- function(input, output) {
    library(ggplot2)
    
    output$plot1 <- renderPlot({
        data <-
            read.csv(
                "https://raw.githubusercontent.com/beduExpert/Programacion-con-R-2021/main/Sesion-08/Postwork/data.csv",
                header = T
            )
        
        data <-
            mutate(data, FTR = ifelse(FTHG > FTAG, "H", ifelse(FTHG < FTAG, "A", "D")))
        
        x <- data[, input$x]
        
        data %>% ggplot(aes(x, fill = FTR)) +
            geom_bar() +
            facet_wrap("FTAG") +
            labs(x = input$x, y = "Goles") +
            ylim(0, 50)
        
        
    })
    
    
    output$data_table <- renderDataTable({
        data
    },
    options = list(
        aLengthMenu = c(10, 20, 50),
        iDisplayLength = 5
    ))
    
}


shinyApp(ui, server)
```

<div style="width: 100% ; height: 400px ; text-align: center; box-sizing: border-box; -moz-box-sizing: border-box; -webkit-box-sizing: border-box;" class="muted well">Shiny applications not supported in static R Markdown documents</div>
El resultado final deberia verse asi:

![](./images/shiny1.png)
![](./images/shiny2.png)
