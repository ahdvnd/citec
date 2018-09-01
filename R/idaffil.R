idaffil <- function(x){
    tls <- x %>%
        html_nodes("p span") %>%
        html_text() %>%
        trimws()
    return(tls)
}
