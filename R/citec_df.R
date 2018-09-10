#' Returns a dataframe of all the publications of a given vector of ids
#' including information on author's name, affiliations, number of papers
#' and citations, etc.
#' @param ids A vector of RePEc ids. RePEc id for
#' each author can be found here: https://ideas.repec.org/cgi-bin/shortid.cgi
#' @return A dataframe containing the title of each publication, its type,
#' its publication year, the number of citations received, and the publishing
#' journal. For each row, it also contains information on the author of the
#' publicaiton including name, affiliation, number of papers, number of
#' citations, and years of being active.
#' @example citec_df(c("pal24", "pac16"))
#' @importFrom dplyr %>% bind_rows
#' @importFrom rvest html_nodes html_text
#' @importFrom xml2 read_html

citec_df <- function(ids){
    tempurl <- paste("http://citec.repec.org/", ids, sep = "")
    htmldata <- lapply(tempurl, function(x) read_html(x))
    data <- lapply(htmldata, function(x) idpaperlist(x))
    for (i in 1:length(ids)){
        if (nrow(data[[i]])!=0){
            data[[i]]$id <- ids[i]
            data[[i]]$name <- idname(htmldata[[i]])
            data[[i]]$activesince <- idactiveyr(htmldata[[i]])
            data[[i]]$affiliation <- idaffil(htmldata[[i]])
            data[[i]]$hindex <- idhic(htmldata[[i]])[[1]]
            data[[i]]$i10index <- idhic(htmldata[[i]])[[2]]
            data[[i]]$totalcitations <- idhic(htmldata[[i]])[[3]]
            data[[i]]$narticles <- idoutput(htmldata[[i]])[[1]]
            data[[i]]$npapers <- idoutput(htmldata[[i]])[[2]]
            data[[i]]$nselfcite <- idselfcite(htmldata[[i]])[[i]]
        } else {
            data[[i]]$id <- ids[i]
            data[[i]]$name <- character(0)
            data[[i]]$activesince <- numeric(0)
            data[[i]]$affiliation <- character(0)
            data[[i]]$hindex <- numeric(0)
            data[[i]]$i10index <- numeric(0)
            data[[i]]$totalcitations <- numeric(0)
            data[[i]]$narticles <- numeric(0)
            data[[i]]$npapers <- numeric(0)
            data[[i]]$nselfcite <- numeric(0)
        }
    }
    d <- bind_rows(data)
    return(d)
}
