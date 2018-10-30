library(dplyr)
library(googlesheets)
library(stringr)


# sheet=gs_key('13ClWJBZogkRhz6OTli97pLXKcTiOHlQS4IEgDm0VKXU')

# sheet =googlesheets::gs_key(x = '13ClWJBZogkRhz6OTli97pLXKcTiOHlQS4IEgDm0VKXU')

# xcomnames = googlesheets::gs_read(sheet,ws = 2)
# XComInt = xcomnames %>% unlist %>% unique


XComInt = readLines('E:/SteamLibrary/steamapps/common/XCOM 2/XComGame/Localization/INT/XComGame.int',
                    skipNul= TRUE)




firstname = XComInt[grepl('FirstOpName',XComInt) & !grepl('XGParam',XComInt)] %>%
    str_extract('(?<=\\=).*')
secondname = XComInt[grepl('SecondOpName',XComInt) & !grepl('XGParam',XComInt)] %>%
    str_extract('(?<=\\=).*')
firstword = XComInt[grepl('FirstOpWord',XComInt) & !grepl('XGParam',XComInt)] %>%
    str_extract('(?<=\\=).*')
secondword = XComInt[grepl('SecondOpWord',XComInt)& !grepl('XGParam',XComInt)] %>%
    str_extract('(?<=\\=).*')

dir.create("data-raw/xcom2_names")
dir.create("data-raw/xcom2_words")


writeLines(firstword,'data-raw/xcom2_words/1_first',sep = '\n')
writeLines(secondword,'data-raw/xcom2_words/1_second',sep = '\n')


writeLines(firstname,'data-raw/xcom2_names/1_first',sep = '\n')
writeLines(secondname,'data-raw/xcom2_names/1_second',sep = '\n')
