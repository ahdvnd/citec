#' Returns a dataframe of authors' information for a given vector of author ids.
#' @param ids A vector of RePEc ids. RePEc id for
#' each author can be found here: https://ideas.repec.org/cgi-bin/shortid.cgi
#' @return A dataframe containing author's id, name, affiliation, number of papers, number of
#' citations, and years of being active.
#' @example citec_df(c("pal24", "pac16"))
#' @export citec_authors_df
#' @importFrom dplyr %>% bind_rows
#' @importFrom rvest html_nodes html_text
#' @importFrom xml2 read_html

citec_authors_df <- function(ids){
    tempurl <- paste("http://citec.repec.org/", ids, sep = "")
    htmldata <- lapply(tempurl, function(x) read_html(x))
    data <- data.frame(id = integer(1),
                       name <- character(1),
                       activesince = numeric(1),
                       affiliation = character(1),
                       hindex = numeric(1),
                       i10index = numeric(1),
                       totalcitations = numeric(1),
                       narticles = numeric(1),
                       npapers = numeric(1),
                       nselfcite = numeric(1),
                       stringsAsFactors=FALSE)
    for (i in 1:length(ids)){
        data[i, "id"] <- ids[i]
        data[i, "name"] <- idname(htmldata[[i]])
        data[i, "activesince"] <- idactiveyr(htmldata[[i]])
        data[i, "affiliation"] <- idaffil(htmldata[[i]])
        data[i, "hindex"] <- idhic(htmldata[[i]])[[1]]
        data[i, "i10index"] <- idhic(htmldata[[i]])[[2]]
        data[i, "totalcitations"] <- idhic(htmldata[[i]])[[3]]
        data[i, "narticles"] <- idoutput(htmldata[[i]])[[1]]
        data[i, "npapers"] <- idoutput(htmldata[[i]])[[2]]
        data[i, "nselfcite"] <- idselfcite(htmldata[[i]])
    }
    return(data)
}
