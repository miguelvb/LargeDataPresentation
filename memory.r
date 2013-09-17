
# WHAT IS LARGE DATA ? 

# memory? 

memory.limit()
memory.limit(size=4000)
memory.size()
gc()

pr <- function(x){ print(object.size(x), units = "auto") }

x <- 0L # 32 bytes
pr(x)
class(x)

x <- 23.123 ; pr(x) # 32 bytes
class(x)


N <- 1e6
x <- rep(23L,N); pr(x)# 3.8 Mb
x <- rep(0.23,N); pr(x)# 7.6 Mb
x <- as.Date("2000-01-01") + 1:N; pr(x)# 7.6 Mb
x <- as.factor(1:N); pr(x)# 38.1 Mb
x <- as.factor(rep(23L,N));pr(x)# 3.8 Mb , it depends on the content !!!
x <- as.character(1:N); pr(x)# 34.3 Mb
x <- as.character(rep(23L,N));pr(x)# 38.1 Mb , it depends on the content !!!!

# so we have : 

memo.1e6 <- data.frame(
       class = c("integer","numeric", "date","character", "factor"), 
       size = c(3.8,7.6,7.6,34.3,38.1))

memo.1e6

#       class size
# 1   integer  3.8
# 2   numeric  7.6
# 3      date  7.6
# 4 character 34.3
# 5    factor 38.1



gc()

#             used (Mb) gc trigger  (Mb)  max used  (Mb)
# Ncells  1262338 33.8   19253475 514.2  20260836 541.1
# Vcells 10102233 77.1   84503002 644.8 105378516 804.0


require(googleVis)