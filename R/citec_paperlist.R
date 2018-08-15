#' Returns information on the publications published by the author
#'
#' @param id The RePEc id of the author. RePEc id for
#' each author can be found here: https://ideas.repec.org/cgi-bin/shortid.cgi
#' @return A dataframe containing the title of each publication, its type,
#' its publicaiton year, and the number of citations received.
#' @example citec_paperlist("pal24")
#' @export citec_paperlist

citec_paperlist <- function(id){
    tempurl <- paste("http://citec.repec.org/", id, sep = "")
    a <- read_html(tempurl) %>%
        html_nodes("tr td") %>%
        html_text()
    lmin <- min(which(a %in% c("paper", "article", "chapter"))) - 2
    lmax <- max(which(a %in% c("paper", "article", "chapter"))) + 1
    amod <- a[lmin:lmax]
    tmp <- data.frame(
        X=amod,
        ind=rep(1:4, length(amod)/4)
    )
    at <- unstack(tmp, X~ind)
    colnames(at) <- c("year", "title", "type", "citations")
    repind <- grep("This paper has another version", at$title)
    at <- at[-repind, ]
    at$year <- as.numeric(at$year)
    at$citations <- as.numeric(at$citations)
    return(at)
}
