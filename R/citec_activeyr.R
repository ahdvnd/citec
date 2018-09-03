#' Returns the year the author started publishing
#'
#' @param id The RePEc id of the author. RePEc id for
#' each author can be found here: https://ideas.repec.org/cgi-bin/shortid.cgi
#' @return A number indicating the author started activity.
#' @example citec_activeyr("pal24")
#' @export citec_activeyr
#' @importFrom dplyr %>%
#' @importFrom rvest html_nodes html_text read_html
citec_activeyr <- function(id){
    tempurl <- paste("http://citec.repec.org/", id, sep = "")
    htmldata <- read_html(tempurl)
    tls <- idactiveyr(htmldata)
    return(tls)
}
