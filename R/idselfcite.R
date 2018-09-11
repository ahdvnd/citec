idselfcite <- function(x){
    tls <- x %>%
        html_nodes("td div") %>%
        html_text() %>%
        .[grep("RESEARCH ACTIVITY", .)+1]
    if (identical(tls, character(0))) {
        tls <- NA
    } else {
        tls <- tls %>%
            strsplit("[.]") %>%
            unlist() %>%
            .[grep("Total self citations", .)] %>%
            strsplit(":")
        tls <- tls[[1]][2] %>%
            strsplit("\\(")
        tls <- tls[[1]][1] %>%
            as.numeric()
    }
    return(tls)
}
