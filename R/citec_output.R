#' Returns the productivity measures of the author
#'
#' @param id The RePEc id of the author. RePEc id for
#' each author can be found here: https://ideas.repec.org/cgi-bin/shortid.cgi
#' @return A list with two elements: the number of articles and
#' the number of papers published by an author
#' @example citec_output("pal24")
#' @export citec_output
#' @importFrom dplyr %>%
#' @importFrom rvest html_nodes html_text
#' @importFrom xml2 read_html
citec_output <- function(id){
    tempurl <- paste("http://citec.repec.org/", id, sep = "")
    htmldata <- read_html(tempurl)
    tls <- idoutput(htmldata)
    return(tls)
}
