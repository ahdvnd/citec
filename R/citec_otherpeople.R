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
#' @importFrom rvest html_nodes html_text read_html
citec_otherpeople <- function(id){
    tempurl <- paste("http://citec.repec.org/", id, sep = "")
    tls <- read_html(tempurl) %>%
        html_nodes("p b") %>%
        html_text()
    r1 <- grep("Works with", tls)
    r2 <- grep("Is cited by", tls)
    r3 <- grep("Cites to", tls)
    splits <- c(r1, r1+1, r2, r2+1, r3, r3+1)
    splitter2 <- function(x, pos) {
        out <- list()
        pos2 <- c(1, pos, length(x)+1)
        for (i in seq_along(pos2[-1])) {
            out[[i]] <- x[pos2[i]:(pos2[i+1]-1)]
        }
        return(out)
    }
    l1 <- splitter2(tls, splits)
    l <- list(workswith = l1[[3]], citedby = l1[[5]], citesto = l1[[7]])
    return(l)
}
