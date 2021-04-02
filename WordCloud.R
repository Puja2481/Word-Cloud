install.packages('tm')
library(tm)
install.packages("wordcloud")
library(wordcloud)
install.packages("pdftools")
library(pdftools)
install.packages(c("RColorBrewer", "RCurl", "XML"))
library("RColorBrewer")
library("RCurl")
library("XML")

txt=pdf_text(file.choose()) #state of aging
head(txt)
str(txt)
class(txt)
cat(txt[121])

#corpus is a collection of text document
txt_corpus =Corpus(VectorSource(txt)) #it is present in tm package

#type Vcorpus and Pcorpus
# v= volatile , p = permanent
#VectorSource() is a reader function to create a source object from existing text

cat(txt[1:2])
as.character(txt[[10]])
lapply(txt[1:5], as.character)

txt_corpus = tm_map(txt_corpus, tolower) #converting text in lower case
lapply(txt_corpus[1:5], as.character)

#Data Cleaning
txt_corpus = tm_map(txt_corpus, removeNumbers) #removing numbers from text
lapply(txt_corpus[101], as.character)

txt_corpus = tm_map(txt_corpus, removePunctuation)  #removing punctuation from text
lapply(txt_corpus[1], as.character)


txt_corpus = tm_map(txt_corpus, removeWords,stopwords('en'))  #removing extra spaces from text
lapply(txt_corpus[101], as.character)

#document Term matrix
#data preparation
#tokenization
dtm = DocumentTermMatrix(txt_corpus)
dtm= as.matrix(dtm)
View(dtm)
#head(dtm)
dtm=t(dtm)

occu= rowSums(dtm)
occu
no_occ = sort(occu, decreasing = T)
head(no_occ)
wordcloud(txt_corpus,min.freq = 50, random.order = F, rot.per =0.40, color=brewer.pal(4, "Dark2"))
#rquery.wordcloud
