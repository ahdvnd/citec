## the return for some of the ids is problematic
#' Returns people who frequently work with the author,
#' people who cite the author frequently and people who
#' are cieted by the author frequently.
#'
#' @param id The RePEc id of the author. RePEc id for
#' each author can be found here: https://ideas.repec.org/cgi-bin/shortid.cgi
#' @return A list with three elements: vector of people who work
#' with the author, vector of people who are cited by the author, vector of
#' people who have cited the author
#' @example citec_otherpeople("pal24")
#' @export citec_otherpeople
#' @importFrom dplyr %>%
#' @importFrom rvest html_nodes html_text
#' @importFrom xml2 read_html
citec_otherpeople <- function(id){
    tempurl <- paste("http://citec.repec.org/", id, sep = "")
    htmldata <- read_html(tempurl)
    tls <- idotherpeople(htmldata)
    return(tls)
}

