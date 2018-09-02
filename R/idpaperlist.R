idpaperlist <- function(x){
    a <- x %>%
        html_nodes("tr td") %>%
        html_text()
    lmin <- min(which(a %in% c("paper", "article", "chapter"))) - 2
    lmax <- max(which(a %in% c("paper", "article", "chapter"))) + 1
    amod <- a[lmin:lmax]
    # tmp <- data.frame(
    #     X=amod,
    #     ind=rep(1:4, length(amod)/4)
    # )
    # at <- unstack(tmp, X~ind)
    at <- as.data.frame(matrix(amod,ncol=4, byrow=TRUE))
    colnames(at) <- c("publicationyear", "publicationtitle", "publicationtype", "publicationcitations")
    repind <- grep("This paper has another version", at$publicationtitle)
    if (length(repind)!=0) at <- at[-repind, ]
    # at$publicationyear <- as.numeric(at$publicationyear)
    at$publicationcitations <- as.numeric(at$publicationcitations)
    return(at)
}
