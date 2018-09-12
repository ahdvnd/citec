idotherpeople <- function(x){
    otherpeople <- x %>%
        html_nodes("p b") %>%
        html_text()
    if (identical(otherpeople, character(0))) {
        l <- list(workswith = rep(NA, 30),
                  citedby   = rep(NA, 20),
                  citesto   = rep(NA, 20))
    } else {
    r1 <- grep("Works with", otherpeople)
    r2 <- grep("Is cited by", otherpeople)
    r3 <- grep("Cites to", otherpeople)
    splits <- c(r1, r1+1, r2, r2+1, r3, r3+1)
    splitter2 <- function(y, pos) {
        out <- list()
        pos2 <- c(1, pos, length(y)+1)
        for (i in seq_along(pos2[-1])) {
            out[[i]] <- y[pos2[i]:(pos2[i+1]-1)]
        }
        return(out)
    }
    l1 <- splitter2(otherpeople, splits)
    if (r2 == r1+1) l1[[3]] <- NA
    if (r3 == r2+1) l1[[5]] <- NA
    l <- list(workswith = c(l1[[3]], rep(NA, max(0, 30 - length(l1[[3]])))),
              citedby   = c(l1[[5]], rep(NA, max(0, 20 - length(l1[[5]])))),
              citesto   = c(l1[[7]], rep(NA, max(0, 20 - length(l1[[7]]))))
    )
    }
    return(l)
}
