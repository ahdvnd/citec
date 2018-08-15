#' Returns the name of the author
#'
#' @param id The RePEc id of the author. RePEc id for
#' each author can be found here: https://ideas.repec.org/cgi-bin/shortid.cgi
#' @return A string indicating the name of the author
#' @example citec_name("pal24")
#' @export citec_name
citec_name <- function(id){
    tempurl <- paste("http://citec.repec.org/", id, sep = "")
    tls <- read_html(tempurl) %>%
        html_nodes("h3") %>%
        html_text() %>%
        .[1] %>%
        str_sub(1, -20)
    return(tls)
}
