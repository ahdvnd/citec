#' Returns the name of the author
#'
#' @param id The RePEc id of the author. RePEc id for
#' each author can be found here: https://ideas.repec.org/cgi-bin/shortid.cgi
#' @return A string indicating the name of the author
#' @example citec_name("pal24")
#' @export citec_name
#' @importFrom dplyr %>%
#' @importFrom stringr str_sub
#' @importFrom rvest html_nodes html_text
citec_name <- function(id){
    tempurl <- paste("http://citec.repec.org/", id, sep = "")
    htmldata <- read_html(tempurl)
    tls <- idname(htmldata)
    return(tls)
}
