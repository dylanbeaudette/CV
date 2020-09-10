msg <- 'pedologic pioneer'
msg.vect.space <- strsplit(msg, split=' ')[[1]]
msg.vect.full <- unlist(strsplit(msg.vect.space, split=''))
word.length <- nchar(msg.vect.space)

l <- list()
for(i in seq_along(word.length)) {
  l[[i]] <- cbind(rnorm(n=word.length[i], mean=i),
		rnorm(n=word.length[i], mean=i),
		rnorm(n=word.length[i], mean=i),
		rnorm(n=word.length[i], mean=i)
		)
  }

x <- do.call('rbind', l)
h <- hclust(dist(x))

pdf(file='logo-dend.pdf', width=12, height=2)
par(mar=c(1,0,0,0), xpd=FALSE)
plot(h, hang=-1, labels=FALSE,  axes=FALSE, xlab='', ylab='', main='', sub='', col=grey(0.45))
mtext(text=msg.vect.full, side=1, at=1:length(msg.vect.full), line=-0.6, font=2, cex=1.25)
dev.off()
