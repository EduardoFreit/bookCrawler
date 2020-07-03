source("functions/a_link_pages.r")
 
# Função que retorna todos os links dos livros de uma página
books_page <- function(url) {
    page_base <- 'http://books.toscrape.com/catalogue/'
    selector <- 'article.product_pod > h3 > a'

    link_book <- read_html(url) %>% 
     html_nodes(selector) %>% 
     html_attr('href') %>% 
     paste0(page_base, .)
    
    link_book
}

# Função que retorna os links de todos livro do site
listBook <- function() {
    all_pages <- listPages()

    if (file.exists('data/books.txt')) 
       file.remove('data/books.txt')    
    
    print("Escrevendo o arquivo 'data/books.txt'. Aguarde...")
    # Escrevendo Cada link de livro em um arquivo Texto
    for (pages in all_pages) {
        books <- books_page(pages)
        write(books, file = "data/books.txt", append = TRUE)
    }
    print("Arquivo 'data/books.txt criado!")
}

listBook()
