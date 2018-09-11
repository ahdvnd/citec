# only takes the first affiliation
idaffil <- function(x){
    tls <- x %>%
        html_nodes("p span") %>%
        html_text() %>%
        trimws()
    if (identical(tls, character(0))) {
        tls <- NA
    }
    return(tls[1])
}
