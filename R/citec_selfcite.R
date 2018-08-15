#' Returns the number of self-cites ny the author
#'
#' @param id The RePEc id of the author. RePEc id for
#' each author can be found here: https://ideas.repec.org/cgi-bin/shortid.cgi
#' @return A number indicating the number of times an author has cited themselves
#' @example citec_selfcite("pal24")
#' @export citec_selfcite
#'
citec_selfcite <- function(id){
    tempurl <- paste("http://citec.repec.org/", id, sep = "")
    tls <- read_html(tempurl) %>%
        html_nodes("td div") %>%
        html_text() %>%
        .[grep("RESEARCH ACTIVITY", .)+1] %>%
        strsplit("[.]") %>%
        unlist() %>%
        .[grep("Total self citations", .)] %>%
        strsplit(":")
    tls <- tls[[1]][2] %>%
        strsplit("\\(")
    tls <- tls[[1]][1] %>%
        as.numeric()
    return(tls)
}
