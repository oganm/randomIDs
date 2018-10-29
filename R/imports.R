#' @importFrom magrittr %>%
#' @export
magrittr::`%>%`


#' @importFrom magrittr %<>%
#' @export
magrittr::`%<>%`


#' @importFrom magrittr %$%
#' @export
magrittr::`%$%`


teval = function(chr,...){
    eval(parse(text=chr),...)
}
