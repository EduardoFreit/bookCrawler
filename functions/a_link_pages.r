# 
# Função usada para listar todos os links das páginas do site
# 
listPages <- function() {    
    url <- "http://books.toscrape.com"
    page_base <- 'http://books.toscrape.com/catalogue/page-1.html'
    selector <- 'li.current'

    num_pages <- read_html(url) %>% 
     html_node(selector) %>% 
     html_text() %>% 
     str_remove_all("  ") %>% 
     str_remove_all("\n") %>% 
     str_split(fixed(' ')) %>% 
     {tail(.[[1]], n=1)}

    page_list  <- c(1:num_pages)
    all_pages <- str_replace(page_base, 'page-1', paste0("page-", page_list))
    all_pages
}