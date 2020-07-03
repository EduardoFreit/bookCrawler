library(rvest)
library(stringr)

source('functions/b_link_books.r')
source('functions/c_get_details.r')

# EXTRAINDO DADOS DOS LIVROS
all_books <- readLines('data/books.txt')
print("Extraindo dados dos livros. Aguarde...")
scraping_results = sapply(all_books, getDetails)
print("Extração Completa!")

# CRIANDO DATAFRAME
scraping_results = t(scraping_results)
colnames(scraping_results) = c("Book Name", "Price",  "Rating", "Availability")
rownames(scraping_results) = c(1:length(all_books))

# EXPORTANDO DATAFRAME PARA O ARQUIVO
write.csv(scraping_results, file="bookScrapingResults")