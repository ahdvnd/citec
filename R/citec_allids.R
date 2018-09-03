#' Scrapes RePEc website to find all ids
#'
#' @return A vector of all ids on https://ideas.repec.org/i/eall.html.
#' Alternatively you can find ids based on names
#' here https://ideas.repec.org/cgi-bin/shortid.cgi
#' @example citec_allids()
#' @export citec_allids
#' @importFrom dplyr %>%
#' @importFrom rvest html_nodes html_attr read_html
citec_allids <- function(){
    df <- read_html("https://ideas.repec.org/i/eall.html") %>%
        html_nodes("td a") %>%
        html_attr('href') %>%
        as.data.frame() %>%
        .[-c(1:5), ]
    str.ids <- regmatches(df, regexec('./(.*?)\\.', df))
    ids <- sapply(str.ids, "[[", 2)
    return(ids)
}
