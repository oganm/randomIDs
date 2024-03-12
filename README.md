
## randomNames

This is a pakcage for generating random names possibly to replace
nameless identifiers returned from clustering algorithms

### Installation

``` r
devtools::install_github('oganm/randomIDs')
```

### Use

Pick an available name list or or make up your own. To see available
name lists do `?namelists` or

``` r
namelists
```

    ## [1] "docker"                "helldivers_destroyers" "occidental_companies" 
    ## [4] "xcom2_names"           "xcom2_words"

To generate names simply do

``` r
random_names(10,namelist = 'docker')
```

    ##  [1] "vigorous_kalam"      "recursing_gauss"     "inspiring_galois"   
    ##  [4] "naughty_brahmagupta" "ecstatic_mendel"     "thirsty_gauss"      
    ##  [7] "romantic_saha"       "admiring_montalcini" "flamboyant_brown"   
    ## [10] "affectionate_fermi"

If you want edgier names try

``` r
random_names(10,namelist = 'xcom2_names')
```

    ##  [1] "Massive_Sword"      "Glass_Apollo"       "Poisoned_Dawn"     
    ##  [4] "Half-dead_Laughter" "Heavy_Doom"         "Glass_Engine"      
    ##  [7] "Brutal_Heart"       "Vengeful_Gasp"      "Lost_Ring"         
    ## [10] "Bleeding_Stranger"

You can also make your own name lists. Names of the list elements aren’t
important. Random words will be selected from each element in order.
Generated names are guaranteed to be unique. If the name list doesnt
allow enough permutations, an integer will be added to the end of the
name to ensure unique names

``` r
mynames = list(first = c('shiny','red','tasty'),
               second = c('apple','gummy-bear','strawberry'),
               finally = c('yum','mmm'))

random_names(20,namelist = mynames)
```

    ##  [1] "red_gummy-bear_mmm"    "shiny_gummy-bear_yum"  "shiny_strawberry_yum" 
    ##  [4] "tasty_strawberry_mmm"  "shiny_apple_mmm"       "tasty_gummy-bear_yum" 
    ##  [7] "tasty_apple_yum"       "red_strawberry_yum"    "red_strawberry_mmm"   
    ## [10] "shiny_apple_yum"       "shiny_strawberry_mmm"  "shiny_gummy-bear_mmm" 
    ## [13] "tasty_gummy-bear_mmm"  "red_apple_mmm"         "tasty_apple_mmm"      
    ## [16] "red_gummy-bear_yum"    "red_apple_yum"         "tasty_strawberry_yum" 
    ## [19] "tasty_apple_yum1"      "tasty_gummy-bear_yum1"
