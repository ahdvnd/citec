idselfcite <- function(x){
    tls <- x %>%
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
