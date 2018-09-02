# only takes the first affiliation
idaffil <- function(x){
    tls <- x %>%
        html_nodes("p span") %>%
        html_text() %>%
        trimws()
    return(tls[1])
}
