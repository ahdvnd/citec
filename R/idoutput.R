idoutput <- function(x){
    tls <- x %>%
        html_nodes("p.mainAutDatN") %>%
        html_text() %>%
        as.numeric()
    l <- list(narticles = tls[1],
              npapers = tls[2])
    return(l)
}
