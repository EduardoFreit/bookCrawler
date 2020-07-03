# Função que retorna os detalhes de cada livro
getDetails <- function(url) {
    book_html <- read_html(url)

    #Nome do Livro
    name_selector <- 'h1'
    book_name <- book_html %>% 
     html_nodes(name_selector) %>% html_text()

    #Preço do Livro
    price_selector <- '.product_main > .price_color'
    book_price <- book_html %>% 
     html_nodes(price_selector) %>% html_text() %>% 
     substring(2) %>% as.numeric()

    #Rating do livro
    rating_selector <- '.product_main > .star-rating'
    book_rating <- book_html %>% html_nodes(rating_selector) %>% 
     html_attr('class') %>% str_split(fixed(' ')) %>% 
     {tail(.[[1]], n=1)} %>% 
     switch("Zero" = 0,"One" = 1, "Two" = 2, "Three" = 3, "Four" = 4, "Five" = 5,)

    #Availability do livro
    availability_selector <- '.product_main> .instock.availability'
    book_aviability <- book_html %>% 
     html_nodes(availability_selector) %>% html_text() %>% 
     str_remove_all("  ") %>% str_remove_all("\n")

    #Retornando dados do livro
    book_details <- c(book_name, book_price, book_rating, book_aviability)
    book_details
}

# all_books <- readLines('data/test.txt')
# scraping_results = sapply(all_books, getDetails)
# scraping_results = t(scraping_results)
# colnames(scraping_results)  <- c("Book Name", "Price",  "Rating", "Availability")
# rownames(scraping_results)  <-  c(1:12)
# write.csv(scraping_results, file="bookScrapingResults")
# print(length(all_booksx))