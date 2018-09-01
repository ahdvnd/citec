idhic <- function(x){
    tls <- x %>%
        html_nodes("p.indData") %>%
        html_text() %>%
        as.numeric()
    l <- list(hindex = tls[1],
              i10index = tls[2],
              totalcitations = tls[3])
    return(l)
}
