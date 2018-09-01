# paa25 is the problem

ids <- citec_allids()
allids <- head(ids, 12)
#allids <- citec_allids()
tempurl <- paste("http://citec.repec.org/", allids, sep = "")
htmldata <- lapply(tempurl, function(x) read_html(x))
data <- lapply(htmldata, function(x) idpaperlist(x))


for (i in 1:length(allids)){
    if (nrow(data[[i]])!=0){
        data[[i]]$name <- lapply(htmldata, function(x) idname(x))[[i]]
        data[[i]]$activesince <- lapply(htmldata, function(x) idactiveyr(x))[[i]]
        data[[i]]$affiliation <- lapply(htmldata, function(x) idaffil(x))[[i]]
        data[[i]]$hindex <- lapply(htmldata, function(x) idhic(x))[[i]][[1]]
        data[[i]]$i10index <- lapply(htmldata, function(x) idhic(x))[[i]][[2]]
        data[[i]]$totalcitations <- lapply(htmldata, function(x) idhic(x))[[i]][[3]]
        data[[i]]$narticles <- lapply(htmldata, function(x) idoutput(x))[[i]][[1]]
        data[[i]]$npapers <- lapply(htmldata, function(x) idoutput(x))[[i]][[2]]
        data[[i]]$nselfcite <- lapply(htmldata, function(x) idselfcite(x))[[i]]
    } else {
        data[[i]]$name <- character(0)
        data[[i]]$activesince <- numeric(0)
        data[[i]]$affiliation <- character(0)
        data[[i]]$hindex <- numeric(0)
        data[[i]]$i10index <- numeric(0)
        data[[i]]$totalcitations <- numeric(0)
        data[[i]]$narticles <- numeric(0)
        data[[i]]$npapers <- numeric(0)
        data[[i]]$nselfcite <- numeric(0)
    }
}



glimpse(data[[3]])
class(data[[1]]$nselfcite)






