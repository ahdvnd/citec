#' Returns the productivity measures of the author
#'
#' @param id The RePEc id of the author. RePEc id for
#' each author can be found here: https://ideas.repec.org/cgi-bin/shortid.cgi
#' @return A list with two elements: the number of articles and
#' the number of papers published by an author
#' @example citec_output("pal24")
#' @export citec_output
#' @importFrom dplyr %>%
#' @importFrom xml2 read_html
#' @importFrom rvest html_nodes html_text
citec_output <- function(id){
    tempurl <- paste("http://citec.repec.org/", id, sep = "")
    tls <- read_html(tempurl) %>%
        html_nodes("p.mainAutDatN") %>%
        html_text() %>%
        as.numeric()
    l <- list(articles = tls[1], papers = tls[2])
    return(l)
}
