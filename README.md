
<!-- README.md is generated from README.Rmd. Please edit that file -->

# countrrry

<!-- badges: start -->
<!-- badges: end -->

The goal of countrrry is to …

## Installation

You can install the development version of countrrry from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("curso-r/202208-pacotes")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(countrrry)
## basic example code
```

Mostrar as dez primeiras linhas da base de dados

``` r
head(partidas_brasileirao)
#>   temporada       data    time_casa gols time_visitante gols_casa
#> 1      2003 2003-03-29 Athletico PR  2x0         Grêmio         2
#> 2      2003 2003-03-29      Guarani  4x2          Vasco         4
#> 3      2003 2003-03-30  Corinthians  0x3    Atlético MG         0
#> 4      2003 2003-03-30        Goiás  2x2       Paysandu         2
#> 5      2003 2003-03-30     Criciúma  2x0     Fluminense         2
#> 6      2003 2003-03-30     Cruzeiro  2x2    São Caetano         2
#>   gols_visitante  quem_ganhou
#> 1              0 Athletico PR
#> 2              2      Guarani
#> 3              3  Atlético MG
#> 4              2       Empate
#> 5              0     Criciúma
#> 6              2       Empate
```

Encontra o pior ano do time:

``` r
encontrar_pior_ano_time("Corinthians")
#> # A tibble: 1 × 3
#>   temporada time        n_vitorias
#>       <dbl> <chr>            <int>
#> 1      2007 Corinthians         10
```
