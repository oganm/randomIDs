#' Get random names
#'
#' @param n Number of names needed
#' @param namelist A name list. Either a character that corresponds to one of
#' the name lists included in the package or a list with character arrays that
#' includes custom words to be combined. Custom word lists can have as many
#' character vectors as desired. A word from each character list will be chose
#' randomly. Name of the elements are not used. See \code{\link{?namelists}} for
#' a list of available name lists.
#' @param wordsep Character to be used when separating the words
#' @param alliterate
#'
#' @return A character vector of length n.
#' @export
#'
#' @examples
#' get_random_names(n=4, namelist = 'docker')
get_random_names = function(n = 1, namelist = 'docker',
                            wordsep = '_',
                            alliterate = FALSE){
    if(is.character(namelist)){
        namelist = teval(namelist, envir = as.environment('package:randomNames'))
    }

    allPossible = do.call(expand.grid,namelist)
    if(alliterate){
        allPossible %>%
            lapply(substr,1,1) %>%
            as.data.frame() %>%
            apply(1,unique) %>%
            sapply(length) %>%
            {.==1} -> alliterated
        allPossible = allPossible[alliterated,]
    }
    nameSet = cut(seq_len(n),breaks = unique(c(seq(0,to = n,by = nrow(allPossible)),n)))
    nameSets = unique(nameSet)
    nameSetSuffix = seq(0,length(nameSets)-1)

    names = seq_along(nameSets) %>% lapply(function(i){
        if(nameSetSuffix[i]==0){
            suffix = ''
        } else{
            suffix = nameSetSuffix[i]
        }

        setN = sum(nameSet %in% nameSets[i])

        paste0(allPossible[sample(nrow(allPossible),setN,replace = FALSE),] %>%
                   apply(1,paste,collapse = wordsep),suffix)
    }) %>% unlist
}
