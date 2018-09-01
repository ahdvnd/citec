idactiveyr <- function(x){
    d <- x %>%
        html_nodes("td div") %>%
        html_text()
    r1 <- grep("RESEARCH ACTIVITY", d)
    tls <- d %>%
        .[r1+1] %>%
        strsplit("[(]") %>%
        unlist() %>%
        .[2] %>%
        substr(1,4) %>%
        as.numeric()
    return(tls)
}
