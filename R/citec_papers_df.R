#' Returns a dataframe of all the publications of a given vector of ids
#' including author's name.
#' @param ids A vector of RePEc ids. RePEc id for
#' each author can be found here: https://ideas.repec.org/cgi-bin/shortid.cgi
#' @return A dataframe containing the title of each publication, its type,
#' its publication year, the number of citations received, the publishing
#' journal and the author of the publicaiton.
#' @example citec_df(c("pal24", "pac16"))
#' @export citec_papers_df
#' @importFrom dplyr %>% bind_rows
#' @importFrom rvest html_nodes html_text
#' @importFrom xml2 read_html

citec_papers_df <- function(ids){
    tempurl <- paste("http://citec.repec.org/", ids, sep = "")
    htmldata <- lapply(tempurl, function(x) read_html(x))
    data <- lapply(htmldata, function(x) idpaperlist(x))
    for (i in 1:length(ids)){
        if (nrow(data[[i]])!=0){
            data[[i]]$id <- ids[i]
            data[[i]]$name <- idname(htmldata[[i]])
        } else {
            data[[i]]$id <- ids[i]
            data[[i]]$name <- character(0)
        }
    }
    d <- bind_rows(data)
    return(d)
}
