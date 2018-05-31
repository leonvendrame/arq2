acertos <- matrix(c(96.054,	94.392,	94.814,	94.652, 
                    99.486, 96.889,	96.467,	95.472, 
                    99.982,	99.738, 99.744,	99.381, 
                    99.996,	99.994,	99.996, 99.996, 
                    98.287,	95.771,	95.287,	95.190), ncol=4, byrow=TRUE)

colnames(acertos) <- c("LTAGE","BiMode","Tournament", "Local")
rownames(acertos) <- c("nbench","dijkstra","floyd-warshall", "flops-8", "mpeg2enc")
ac_data <- as.table(t(acertos))

ac_data 

par(xpd = TRUE, mar=c(3, 5, 2, 6), oma=c(0,0,0,0))
barplot(as.matrix(ac_data),
        ylab="Taxa de Acertos", cex.lab=0.8,
        cex.axis = 0.8,
        beside=TRUE, ylim=c(94, 100), xpd = FALSE,
        cex.names = 0.8,
        col=grey.colors(n = 4, start = 0.1, end = 0.8))

legend(25.5, 99, colnames(acertos), cex=0.8, title="Algoritmos", bty="n", fill=grey.colors(n = 4, start = 0.1, end = 0.8));

