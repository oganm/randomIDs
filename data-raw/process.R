library(here)
library(glue)
devtools::load_all()
setwd(here())

namelists = list.files('data-raw/',full.names = TRUE)

namelists = namelists[!grepl('\\.R',namelists)]

available_namelists =
    c("#' Available nameslists",
      "#'",
      "#' \\itemize{",
      "#' }",
      "#'",
      "#'",
      "#' @name namelists",
      "NULL"
      )

insert = c()
listnames = c()

for (x in namelists){
    listname = basename(x)
    files = list.files(x,full.names = TRUE)
    description = files[grepl('description',files)]
    files = files[!grepl('description',files)]

    names = stringr::str_extract(basename(files),'(?<=_).*')

    teval(glue('{listname}<<-list()'))

    for(i in seq_along(files)){
        words = readLines(files[i])
        teval(glue('{listname}${names[i]}<<-words'))
    }
    teval(glue('usethis::use_data({listname},overwrite = TRUE)'))

    toInsert = readLines(description)

    toInsert[1] = glue("#'     \\item {listname}: {toInsert[1]}")
    toInsert[-1] = glue("#'     {toInsert[-1]}")
    toInsert = c(toInsert,
                    glue("#'     ",nrow(expand.grid(teval(listname))),' possible combinations'))
    insert = c(insert,toInsert)
    listnames = c(listnames,listname)

}

available_namelists = c(available_namelists[1:3],
                        insert,
                        available_namelists[4:8])

writeLines(available_namelists,'R/available_namelists.R')

namelists = listnames
usethis::use_data(namelists,overwrite = TRUE)

devtools::document()
