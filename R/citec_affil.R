#' Returns the affiliation of the author
#'
#' @param id The RePEc id of the author. RePEc id for
#' each author can be found here: https://ideas.repec.org/cgi-bin/shortid.cgi
#' @return A string indicating institution the author is affiliated with.
#' @example citec_affil("pal24")
#' @export citec_affil
citec_affil <- function(id){
    tempurl <- paste("http://citec.repec.org/", id, sep = "")
    tls <- read_html(tempurl) %>%
        html_nodes("p span") %>%
        html_text() %>%
        trimws()
    return(tls)
}
