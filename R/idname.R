idname <- function(x){
    names <- x %>%
        html_nodes("h3") %>%
        html_text() %>%
        .[1] %>%
        str_sub(1, -20)
    if (names == "") {
        names <- NA
    }
    return(names)
}
