#' Returns the h-index, the i10-index, and the number of citations of the author
#'
#' @param id The RePEc id of the author. RePEc id for
#' each author can be found here: https://ideas.repec.org/cgi-bin/shortid.cgi
#' @return A list containing the h-index, the i10-index, and the number of citation for each author
#' @example citec_hic("pal24")
#' @export citec_hic
#' @importFrom dplyr %>%
#' @importFrom rvest html_nodes html_text read_html
citec_hic <- function(id){
    tempurl <- paste("http://citec.repec.org/", id, sep = "")
    htmldata <- read_html(tempurl)
    tls <- idhic(htmldata)
    return(tls)
}
