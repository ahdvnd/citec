library(httr)
library(rvest)
library(stringr)
library(xml2)
library(dplyr)
library(scholar)


ids <- citec_allids()
n = length(ids)
breaks = 500
for (i in 0:floor(n/breaks)){
    df <- paste("authors", i, sep = "_")
    min <- i*breaks+1
    max <- (i+1)*breaks
    if (max >= n) {max = n}
    assign(df, citec_authors_df(ids[min:max]))
}


# nchapters


# allids <- head(ids, 1000)

#ptm <- proc.time()

#proc.time() - ptm


papers <- citec_papers_df(allids)


GET()
http://citec.repec.org/api/[plain|amf|citedby]/us925
plain: http://citec.repec.org/api/plain/author:pra12
    imf:imfwpa:01/191/us925


# pac16 Acemoglu
# production by year
citec_paperlist("pal34") %>%
    group_by(year) %>%
    summarise(cite = sum(citations)) %>%
    arrange(-cite)


# page=read_html("https://ideas.repec.org/i/eall.html")
# names <- page %>% html_nodes("td") %>% html_text() %>% as.data.frame() %>%  .[-c(1:10), ]
# nn <- page %>% html_nodes("td") %>% replace_html()


## there is paper and article but there is also chapter



## Google Scholar

google <- read_html("https://scholar.google.com/citations?user=UB0oDI0AAAAJ&hl=en&oi=ao")
google %>% #other info
    html_nodes("tr td") %>%
    html_text()




get_article_cite_history("MQtSXSAAAAAJ", "11838926018351997494")
get_coauthors("MQtSXSAAAAAJ", n_coauthors = 5, n_deep = 1)
get_num_articles("MQtSXSAAAAAJ")
get_num_distinct_journals("MQtSXSAAAAAJ")
get_num_top_journals("MQtSXSAAAAAJ")
get_oldest_article("MQtSXSAAAAAJ")
get_profile("MQtSXSAAAAAJ")


