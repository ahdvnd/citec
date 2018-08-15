#' Returns the h-index, the i10-index, and the number of citations of the author
#'
#' @param id The RePEc id of the author. RePEc id for
#' each author can be found here: https://ideas.repec.org/cgi-bin/shortid.cgi
#' @return A list containing the h-index, the i10-index, and the number of citation for each author
#' @example citec_hic("pal24")
#' @export citec_hic
citec_hic <- function(id){
    tempurl <- paste("http://citec.repec.org/", id, sep = "")
    tls <- read_html(tempurl) %>%
        html_nodes("p.indData") %>%
        html_text() %>%
        as.numeric()
    l <- list(hindex = tls[1],
              i10index = tls[2],
              citations = tls[3])
    return(l)
}
