##�Ĥ@���^���N�W��G�P�@�}�L�R�i�x�n�q�A�P�����L��X

install.packages("quantmod")
library(quantmod)

STK=get(getSymbols("2330.tw"))

head(STK)
tail(STK,10)
chartSeries(STK)

STK=as.matrix(to.weekly(STK))	##�PK

profit=setNames(numeric(length(rownames(STK))), rownames(STK))	## profit vector

for (m in rownames(STK)) {	
	profit[m]=STK[m,4]-STK[m,1]
}

plot(cumsum(profit),type="l",col="red",lwd=2)

paste("Profit:",sum(profit))
paste("WinRate:",length(profit[profit>0])*100/length(profit[profit!=0]),"%")
paste("Profit Factor:",sum(profit[profit>0])/-sum(profit[profit<0]))