#' Returns information on the publications published by the author
#'
#' @param id The RePEc id of the author. RePEc id for
#' each author can be found here: https://ideas.repec.org/cgi-bin/shortid.cgi
#' @return A dataframe containing the title of each publication, its type,
#' its publicaiton year, and the number of citations received.
#' @example citec_paperlist("pal24")
#' @export citec_paperlist
#' @importFrom dplyr %>%
#' @importFrom rvest html_nodes html_text read_html
citec_paperlist <- function(id){
    tempurl <- paste("http://citec.repec.org/", id, sep = "")
    htmldata <- read_html(tempurl)
    tls <- idpaperlist(htmldata)
    return(tls)
}
