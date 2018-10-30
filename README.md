
randomNames
-----------

This is a pakcage for generating random names possibly to replace nameless identifiers returned from clustering algorithms

### Installation

``` r
devtools::install_github('oganm/randomNames')
```

### Use

Pick an available name list or or make up your own. To see available name lists do `?namelists` or

``` r
namelists
```

    ## [1] "docker"      "xcom2_names" "xcom2_words"

To generate names simply do

``` r
random_names(10,namelist = 'docker')
```

    ##  [1] "distracted_hofstadter" "pedantic_blackwell"   
    ##  [3] "wonderful_poincare"    "sad_stallman"         
    ##  [5] "awesome_mendeleev"     "thirsty_poitras"      
    ##  [7] "infallible_morse"      "sleepy_chaplygin"     
    ##  [9] "charming_goldwasser"   "jovial_chandrasekhar"

If you want edgier names try

``` r
random_names(10,namelist = 'xcom2_names')
```

    ##  [1] "Ancient_Prophet" "Perilous_Gasp"   "Summoned_Skies" 
    ##  [4] "Potent_Grin"     "Iron_Skies"      "Broken_Fog"     
    ##  [7] "Final_Cobra"     "Steely_Rain"     "Northern_Dance" 
    ## [10] "Black_Summer"

You can also make your own name lists. Names of the list elements aren't important. Random words will be selected from each element in order. Generated names are guaranteed to be unique. If the name list doesnt allow enough permutations, an integer will be added to the end of the name to ensure unique names

``` r
mynames = list(first = c('shiny','red','tasty'),
               second = c('apple','gummy-bear','strawberry'),
               finally = c('yum','mmm'))

random_names(20,namelist = mynames)
```

    ##  [1] "shiny_strawberry_yum" "red_strawberry_yum"   "shiny_apple_yum"     
    ##  [4] "red_apple_yum"        "red_gummy-bear_yum"   "shiny_gummy-bear_yum"
    ##  [7] "tasty_gummy-bear_mmm" "red_apple_mmm"        "tasty_apple_mmm"     
    ## [10] "tasty_apple_yum"      "tasty_strawberry_yum" "shiny_gummy-bear_mmm"
    ## [13] "shiny_strawberry_mmm" "red_gummy-bear_mmm"   "tasty_strawberry_mmm"
    ## [16] "red_strawberry_mmm"   "tasty_gummy-bear_yum" "shiny_apple_mmm"     
    ## [19] "red_apple_mmm1"       "tasty_apple_yum1"
