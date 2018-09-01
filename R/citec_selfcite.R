#' Returns the number of self-cites ny the author
#'
#' @param id The RePEc id of the author. RePEc id for
#' each author can be found here: https://ideas.repec.org/cgi-bin/shortid.cgi
#' @return A number indicating the number of times an author has cited themselves
#' @example citec_selfcite("pal24")
#' @export citec_selfcite
#' @importFrom dplyr %>%
#' @importFrom xml2 read_html
#' @importFrom rvest html_nodes html_text
citec_selfcite <- function(id){
    tempurl <- paste("http://citec.repec.org/", id, sep = "")
    htmldata <- read_html(tempurl)
    tls <- idselfcite(htmldata)
    return(tls)
}
