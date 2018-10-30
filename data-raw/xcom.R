library(dplyr)
library(googlesheets)
library(stringr)

docker$left %>% cat(sep='\n',file = 'data-raw/docker/1_left')
docker$right %>% cat(sep='\n',file = 'data-raw/docker/2_right')

sheet=gs_key('13ClWJBZogkRhz6OTli97pLXKcTiOHlQS4IEgDm0VKXU')

sheet =googlesheets::gs_key(x = '13ClWJBZogkRhz6OTli97pLXKcTiOHlQS4IEgDm0VKXU')

xcomnames = googlesheets::gs_read(sheet,ws = 2)


names = xcomnames %>% unlist %>% unique


firstname = names[grepl('FirstOpName',names)] %>% str_extract('(?<=\\=).*')
secondname = names[grepl('SecondOpName',names)] %>% str_extract('(?<=\\=).*')

firstword = names[grepl('FirstOpWord',names)] %>% str_extract('(?<=\\=).*')
secondword = names[grepl('SecondOpWord',names)] %>% str_extract('(?<=\\=).*')

dir.create("data-raw/xcom2_names")
dir.create("data-raw/xcom2_words")


writeLines(firstword,'data-raw/xcom2_words/1_first',sep = '\n')
writeLines(secondword,'data-raw/xcom2_words/1_second',sep = '\n')


writeLines(firstname,'data-raw/xcom2_names/1_first',sep = '\n')
writeLines(secondname,'data-raw/xcom2_names/1_second',sep = '\n')
