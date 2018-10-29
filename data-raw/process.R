library(here)
library(glue)
devtools::load_all()
setwd(here())

namelists = list.files('data-raw/',full.names = TRUE)

namelists = namelists[!grepl('\\.R',namelists)]

for (x in namelists){
    listname = basename(x)
    files = list.files(x,full.names = TRUE)

    names = stringr::str_extract(files,'(?<=_).*')

    teval(glue('{listname}<<-list()'))

    for(i in seq_along(files)){
        words = readLines(files[i])
        teval(glue('{listname}${names[i]}<<-words'))
    }
    teval(glue('devtools::use_data({listname},overwrite = TRUE)'))
}
