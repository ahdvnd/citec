#' Returns the year the author started publishing
#'
#' @param id The RePEc id of the author. RePEc id for
#' each author can be found here: https://ideas.repec.org/cgi-bin/shortid.cgi
#' @return A number indicating the author started actiity.
#' @example citec_activeyr("pal24")
#' @export citec_activeyr
citec_activeyr <- function(id){
    tempurl <- paste("http://citec.repec.org/", id, sep = "")
    tls <- read_html(tempurl) %>%
        html_nodes("td div") %>%
        html_text()
    r1 <- grep("RESEARCH ACTIVITY", tls)
    tls <- tls %>%
        .[r1+1] %>%
        strsplit("[(]") %>%
        unlist() %>%
        .[2] %>%
        substr(1,4) %>%
        as.numeric()
    return(tls)
}
