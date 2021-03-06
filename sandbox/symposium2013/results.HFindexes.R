# Presentation of results from optimization scripts run prior to this script

op <- par(no.readonly=TRUE)

# --------------------------------------------------------------------
# Plot Ex Ante scatter of RP and ONLY Equal Weight portfolio in StdDev space
# --------------------------------------------------------------------
# Done
CairoPDF(file=paste(resultsdir, dataname, "-RP-EqWgt-MeanSD-ExAnte.pdf", sep=""), height=5.5, width=9)  
par(mar=c(5, 4, 1, 1) + 0.1) #c(bottom, left, top, right)
# Calculate chart bounds to unify with the charts below
xlim.StdDev=c(min(c(xtract[,"StdDev"], buoys.portfmeas[,"StdDev"])), max(c(xtract[,"StdDev"], buoys.portfmeas[,"StdDev"])))
ylim.mean=c(min(c(xtract[,"mean"], buoys.portfmeas[,"Mean"])), max(c(xtract[,"mean"], buoys.portfmeas[,"Mean"])))

plot(xtract[,"StdDev"],xtract[,"mean"], xlab="Ex Ante Std Dev", ylab="Ex Ante Mean", col="darkgray", axes=FALSE, main="", cex=.6, xlim=xlim.StdDev, ylim=ylim.mean) # leave cloud darkgray for this slide
grid(col = "darkgray")
abline(h = 0, col = "darkgray")
# Overplot the equal weight portfolio
points(buoys.portfmeas[8,"StdDev"],buoys.portfmeas[8,"Mean"], col=wb13color[4], pch=16, cex=1.5) # watch the order in portfmeas
axis(1, cex.axis = 0.8, col = "darkgray")
axis(2, cex.axis = 0.8, col = "darkgray")
box(col = "darkgray")
legend("bottomright",legend=results.names[8], col=wb13color[4], pch=16, ncol=1,  border.col="darkgray", y.intersp=1.2, cex=0.8, inset=.02)
par(op)
dev.off()

# --------------------------------------------------------------------
# Plot Ex Ante scatter of RP and ASSET portfolios in StdDev space
# --------------------------------------------------------------------
# @TODO: add the assets to this chart
CairoPDF(file=paste(resultsdir, dataname, "-RP-Assets-MeanSD-ExAnte.pdf", sep=""), height=5.5, width=9)  
xlim.StdDev.assets =c(min(c(xtract[,"StdDev"], assets.portfmeas[,"StdDev"], 0)), max(c(xtract[,"StdDev"], assets.portfmeas[,"StdDev"],0.03)))
ylim.mean.assets =c(min(c(xtract[,"mean"], assets.portfmeas[,"Mean"], 0)), max(c(xtract[,"mean"], assets.portfmeas[,"Mean"])))
par(mar=c(5, 4, 1, 1) + 0.1) #c(bottom, left, top, right)
# Revise the chart bounds to include the asssets
plot(xtract[,"StdDev"],xtract[,"mean"], xlab="Ex Ante mETL", ylab="Ex Ante Mean", col="darkgray", axes=FALSE, main="", cex=.3, xlim=xlim.StdDev.assets, ylim=ylim.mean.assets)
grid(col = "darkgray")
abline(h = 0, col = "darkgray")
abline(v = 0, col = "darkgray")
# Overplot the equal weight portfolio
points(buoys.portfmeas[8,"StdDev"],buoys.portfmeas[8,"Mean"], col=wb13color[4], pch=16, cex=1.5) # watch the order in portfmeas
text(x=buoys.portfmeas[8,"StdDev"], y=buoys.portfmeas[8,"Mean"], labels=rownames(buoys.portfmeas)[8], pos=4, cex=1)
points(assets.portfmeas[,"StdDev"],assets.portfmeas[,"Mean"], col=rich8equal, pch=18, cex=1.5) # watch the order in portfmeas
text(x=assets.portfmeas[,"StdDev"], y=assets.portfmeas[,"Mean"], labels=rownames(assets.portfmeas), pos=4, cex=1)
axis(1, cex.axis = 0.7, col = "darkgray")
axis(2, cex.axis = 0.7, col = "darkgray")
box(col = "darkgray")
#legend("right",legend=rownames(assets.portfmeas), col=rich8equal, pch=16, ncol=1,  border.col="darkgray", y.intersp=1.2, cex=0.8, inset=.02)
par(op)
dev.off()

# --------------------------------------------------------------------
# Plot Ex Ante scatter of RP and BUOY portfolios in StdDev space
# --------------------------------------------------------------------
# Done
CairoPDF(file=paste(resultsdir, dataname, "-RP-BUOY-MeanSD-ExAnte.pdf", sep=""), height=5.5, width=9)  
par(mar=c(5, 4, 1, 1) + 0.1) #c(bottom, left, top, right)
plot(xtract[,"StdDev"],xtract[,"mean"], xlab="Ex Ante Std Dev", ylab="Ex Ante Mean", col="gray", axes=FALSE, main="", cex=.6, xlim=xlim.StdDev, ylim=ylim.mean, cex.lab=1)
grid(col = "darkgray")
abline(h = 0, col = "darkgray")
# Overplot the buoy portfolios
points(buoys.portfmeas[,"StdDev"],buoys.portfmeas[,"Mean"], col=wb13color[c(3,9,13,6,7,11,8,4)], pch=16, cex=1.5) # watch the order in portfmeas
axis(1, cex.axis = 0.6, col = "darkgray")
axis(2, cex.axis = 0.6, col = "darkgray")
box(col = "darkgray")
legend("bottomright",legend=results.names, col=wb13color[c(3,9,13,6,7,11,8,4)], pch=16, ncol=1,  border.col="darkgray", y.intersp=1.2, cex=0.8, inset=.02)
par(op)
dev.off()

# --------------------------------------------------------------------
# Plot Ex Ante scatter of RP and BUOY portfolios in mETL space
# --------------------------------------------------------------------
# Done
CairoPDF(file=paste(resultsdir, dataname, "-RP-BUOYS-mETL-ExAnte.pdf", sep=""), height=5.5, width=9)  
par(mar=c(5, 4, 1, 1) + 0.1) #c(bottom, left, top, right)
xlim.ES=c(min(c(xtract[,"ES"], buoys.portfmeas[,"mETL"])), max(c(xtract[,"ES"], buoys.portfmeas[,"mETL"])))
plot(xtract[,"ES"],xtract[,"mean"], xlab="Ex Ante mETL", ylab="Ex Ante Mean", col="gray", axes=FALSE, main="", cex=.6, xlim=xlim.ES, ylim=ylim.mean, cex.lab=1)
grid(col = "darkgray")
# Overplot the buoy portfolios
points(buoys.portfmeas[,"mETL"],buoys.portfmeas[,"Mean"], col=wb13color[c(3,9,13,6,7,11,8,4)], pch=16, cex=1.5) # watch the order in portfmeas
axis(1, cex.axis = 0.6, col = "darkgray")
axis(2, cex.axis = 0.6, col = "darkgray")
box(col = "darkgray")
legend("bottomright",legend=results.names, col=wb13color[c(3,9,13,6,7,11,8,4)], pch=16, ncol=1,  border.col="darkgray", y.intersp=1.2, cex=0.8, inset=.02)
par(op)
dev.off()

# --------------------------------------------------------------------
# Plot weights of Buoy portfolios
# --------------------------------------------------------------------
# Done
source('./R/chart.UnStackedBar.R')
# Wgts = extractWeights(buoys)
CairoPDF(file=paste(resultsdir, dataname, "-Weights-Buoys.png", sep=""), height=5.5, width=9)
chart.UnStackedBar(t(Wgts), colorset=wb13color[c(3,9,13,6,7,11,8,4)], equal.line=TRUE)
dev.off()

# --------------------------------------------------------------------
# Plot contribution to risk of Buoy portfolios
# --------------------------------------------------------------------
# @TODO: revise for this result set
# @TODO: add contribution to risk to portfmeas
source('./R/chart.UnStackedBar.R')
CairoPDF(file=paste(resultsdir, dataname, "-mETL-Perc-Contrib-Buoys.pdf", sep=""), height=5.5, width=9) 
chart.UnStackedBar(t(buoys.perc.es), colorset=wb13color[c(3,9,13,6,7,11,8,4)], equal.line=TRUE)
dev.off()
# Alternatively, use table function for ES

# --------------------------------------------------------------------
# Plot cumulative contribution to risk of Buoy portfolios
# --------------------------------------------------------------------
cumRisk=NULL
for(i in 1:NROW(buoys.contrib.es)) {
  y = cumsum(buoys.contrib.es[i,order(buoys.contrib.es[i,], decreasing=TRUE)])
  cumRisk=rbind(cumRisk,y)
}
colnames(cumRisk)=c("Most",2:6,"Least")
rownames(cumRisk)= rownames(buoys.contrib.es)

CairoPDF(file=paste(resultsdir, dataname, "-mETL-CumulPerc-Contrib-Buoys.pdf", sep=""), height=5.5, width=9) 
par(mar=c(5, 4, 1, 4) + 0.1) #c(bottom, left, top, right)
plot(cumRisk[8,], ylim=c(0,max(cumRisk)), col=wb13color[8], type="l", lwd=2, axes=FALSE, main="", xlab="Rank of Contribution to Risk", ylab="Portfolio Risk")
grid(col = "darkgray")
abline(h = 0, col = "darkgray")
axis(1, cex.axis = 0.7, col = "darkgray")
axis(2, cex.axis = 0.7, col = "darkgray")
box(col = "darkgray")
for(i in 1:8) {
  lines(cumRisk[i,], col=wb13color[c(3,9,13,6,7,11,8,4)][i], lwd=3)
  # put the values of the rightmost dot on the plot; that's the portfolio risk 
  points(7, cumRisk[i,7], col = wb13color[c(3,9,13,6,7,11,8,4)][i], pch=20, cex=1)
	mtext(paste(round(100*cumRisk[i,7],2),"%", sep=""), line=.5, side = 4, at=cumRisk[i,7], adj=0, las=2, cex = 0.9, col = wb13color[c(3,9,13,6,7,11,8,4)][i])
}
# Add legend
legend("bottomright",legend=rownames(cumRisk), col=wb13color[c(3,9,13,6,7,11,8,4)], pch=16, ncol=1,  border.col="darkgray", y.intersp=1.2, cex=.9, lwd=3, inset=.02)
par(op)
dev.off()

# --------------------------------------------------------------------
# Scatter chart with DE trail
# --------------------------------------------------------------------
CairoPDF(file=paste(resultsdir, dataname, "-DE-MeanSD-ExAnte.pdf", sep=""), height=5.5, width=9)
# chart in same coordinates as RP; will leave some of the dots outside the chart bounds
chart.RiskReward(RiskBudget.DE, risk.col="StdDev", return.col="mean", xlim=xlim.StdDev, ylim=ylim.mean, las=1)
par(op)
dev.off()
# convert -density 300 DE-MeanSD-ExAnte.pdf -quality 100 -sharpen 0x1.0 ../docs/symposium-slides-2013-figure/DE-MeanSD-ExAnte.png

# --------------------------------------------------------------------
# Plot contribution of risk in EqWgt portfolio
# --------------------------------------------------------------------
CairoPDF(file=paste(resultsdir, dataname, "-Weights-Risk-Comparison.pdf", sep=""), height=5.5, width=9)
y=rbind(t(Wgts[8,]), t(buoys.perc.es[8,]), t(Wgts[6,]), t(buoys.perc.es[6,]))
rownames(y)=c("Weight","Risk", "Weight", "Risk")
# Break this into two charts
chart.UnStackedBar(y, rotate="horizontal", colorset=c(wb13color[4],wb13color[7]), las=1, density=c(-1,25,-1,25))
#chart.UnStackedBar(y, rotate="vertical", colorset=wb13color, equal.line=TRUE)
par(op)
dev.off()

# For equal ES contribution
colorset=c(wb13color[4],wb13color[4],wb13color[11],wb13color[11])
w=rbind(t(Wgts[8,]), t(buoys.perc.es[8,]), t(Wgts[6,]), t(buoys.perc.es[6,]))
rownames(w)=c("Weight","% of Risk", "Weight", "% of Risk")

# For equal Volatility contribution
colorset=c(wb13color[4],wb13color[4],wb13color[7],wb13color[7])
w=rbind(t(Wgts[8,]), t(buoys.perc.sd[8,]), t(Wgts[5,]), t(buoys.perc.sd[5,]))
rownames(w)=c("Weight","% of Volatility", "Weight", "% of Volatility")

# Chart either of the above data sets
CairoPDF(file=paste(resultsdir, dataname, "-Weights-Risk-Comparison.pdf", sep=""), height=5.5, width=9)
par(oma = c(2,4,4,1), mar=c(1,0,.5,1)) # c(bottom, left, top, right)
layout(matrix(c(1:(NCOL(w))), nr = NCOL(w), byrow = FALSE), height=c(rep(1/7,7)))
for(i in 1:NCOL(w)){
  if(i==NCOL(w)){
    barplot(w[,i], col=colorset, horiz=FALSE, ylim=c(0,max(w)), axes=FALSE, names.arg=rownames(w), cex.names=1.5, density=c(-1,25,-1,25))
    abline(h=0, col="darkgray")
    abline(h=1/7, col="darkgray", lty=2)
    axis(2, cex.axis = 0.7, col = "darkgray", las=1)
    mtext(colnames(w)[i], side= 3, cex=1, adj=0)
  } 
  else{
    barplot(w[,i], col=colorset, horiz=FALSE, ylim=c(0,max(w)), axes=FALSE, names.arg="", ylab=colnames(w)[i], las=1, density=c(-1,25,-1,25))
    abline(h=0, col="darkgray")
    abline(h=1/7, col="darkgray", lty=2)
    axis(2, cex.axis = 0.7, col = "darkgray", las=1)
    mtext(colnames(w)[i], side= 3, cex=1, adj=0)
  }
}
par(op)
dev.off()

# --------------------------------------------------------------------
# Show CONCENTRATION of the RP portfolios
# --------------------------------------------------------------------
# Use HHI

CairoPDF(file=paste(resultsdir, dataname, "-ConcPercESContrib.pdf", sep=""), height=5.5, width=9) 
WB20 = c(colorpanel(1, "#008566","#E1E56D"), colorpanel(20, "#E1E56D", "#742414")[-1])
op <- par(no.readonly=TRUE)
layout(matrix(c(1,2)),height=c(4,1.25),width=1)
par(mar=c(5,4,1,2)+.1, cex=1) # c(bottom, left, top, right)
## Draw the Scatter chart of combined results
### Get the random portfolios from one of the result sets
x.hhi=apply(xtract[,10:16], FUN='HHI', MARGIN=1)
y=(x.hhi-min(x.hhi))/(max(x.hhi)-min(x.hhi)) # normalized HHI between 0 and 1
plot(xtract[order(y,decreasing=TRUE),"StdDev"],xtract[order(y,decreasing=TRUE),"mean"], xlab="Ex Ante StdDev", ylab="Ex Ante Mean", col=WB20[floor(y[order(y,decreasing=TRUE)]*19)+1], axes=FALSE, main="", cex=.5, pch=16)
grid(col = "darkgray")
# points(RND.objectives[1,2],RND.objectives[1,1], col="blue", pch=19, cex=1.5)
axis(1, cex.axis = 0.7, col = "darkgray")
axis(2, cex.axis = 0.7, col = "darkgray")
box(col = "darkgray")

# Add legend to bottom panel
par(mar=c(5,5.5,1,3)+.1, cex=0.7)
## Create a histogramed legend for sequential colorsets
## this next bit of code is based on heatmap.2 in gplots package
x=x.hhi
scale01 <- function(x, low = min(x), high = max(x)) {
  return((x - low)/(high - low))
}
breaks <- seq(min(x, na.rm = TRUE), max(x, na.rm = TRUE), length = length(WB20)+1)
min.raw <- min(x, na.rm = TRUE)
max.raw <- max(x, na.rm = TRUE)
z <- seq(min.raw, max.raw, length = length(WB20))
image(z = matrix(z, ncol = 1), col = WB20, breaks = breaks, xaxt = "n", yaxt = "n")
par(usr = c(0, 1, 0, 1)) # needed to draw the histogram correctly
lv <- pretty(breaks)
xv <- scale01(as.numeric(lv), min.raw, max.raw)
axis(1, at = xv, labels=sprintf("%s%%", pretty(lv)))
h <- hist(x, plot = FALSE, breaks=breaks)
hx <- scale01(breaks, min(x), max(x))
hy <- c(h$counts, h$counts[length(h$counts)])
lines(hx, hy/max(hy)*.95, lwd = 2, type = "s", col = "blue")
axis(2, at = pretty(hy)/max(hy)*.95, pretty(hy))
title(ylab="Count")
title(xlab="Degree of Portfolio Concentration")
par(op)
dev.off()

# --------------------------------------------------------------------
# Show CONCENTRATION of the RP portfolios in HHI space
# --------------------------------------------------------------------
CairoPDF(file=paste(resultsdir, dataname, "-ConcPercESContrib-HHI-wHull.pdf", sep=""), height=5.5, width=9) 
WB20 = c(colorpanel(1, "#008566","#E1E56D"), colorpanel(20, "#E1E56D", "#742414")[-1])
op <- par(no.readonly=TRUE)
layout(matrix(c(1,2)),height=c(4,1.25),width=1)
par(mar=c(5,4,1,2)+.1, cex=1) # c(bottom, left, top, right)
seq.col = heat.colors(11)
## Draw the Scatter chart of combined results
### Get the random portfolios from one of the result sets
x.hhi=apply(xtract[,10:16], FUN='HHI', MARGIN=1)
y=(x.hhi-min(x.hhi))/(max(x.hhi)-min(x.hhi)) # normalized HHI between 0 and 1
plot(x.hhi[order(y,decreasing=TRUE)],xtract[order(y,decreasing=TRUE),"mean"], xlab="Degree of ex ante Risk Contribution", ylab="Ex Ante Mean", col=WB20[floor(y[order(y,decreasing=TRUE)]*19)+1], axes=FALSE, main="", cex=.5, pch=16)
grid(col = "darkgray")
# points(RND.objectives[1,2],RND.objectives[1,1], col="blue", pch=19, cex=1.5)
axis(1, cex.axis = 0.7, col = "darkgray")
axis(2, cex.axis = 0.7, col = "darkgray")
box(col = "darkgray")

# HOWTO add a hull to this diagram
# Make a data.frame out of your vectors
dat <- data.frame(X = x.hhi[order(y,decreasing=TRUE)], Y = xtract[order(y,decreasing=TRUE),"mean"])
dat <- data.frame(X = x.hhi, Y = xtract[,"mean"])
# Compute the convex hull. This returns the index for the X and Y coordinates
c.hull <- chull(dat)
#Extract the coordinate points from the convex hull with the index.
z=dat[c.hull,]
# Plot the full hull
# with(dat, plot(X,Y))
# lines(z, col = "pink", lwd = 3)

# Or just do the ascending hull in Y
z[,3] <- c(diff(as.numeric(z[,1])),z[1,1]-tail(z[,1],1)) # calculate whether the line segment is ascending in X
z[,4] <- c(tail(z[,2],1)-z[1,2],diff(as.numeric(z[,2]))) # calculate whether the line segment is ascending in Y
lines(z[z[,3]>0 & z[,4]>0,1:2], col = wb13color[1], lwd = 2, type="b")
z=cbind(z,c.hull)
# Here are the portfolios on the hull
hull.portfolios=z[which(z[,3]>0 & z[,4]>0),5]

# Add legend to bottom panel
par(mar=c(5,5.5,1,3)+.1, cex=0.7)
## Create a histogramed legend for sequential colorsets
## this next bit of code is based on heatmap.2 in gplots package
x=x.hhi
scale01 <- function(x, low = min(x), high = max(x)) {
  return((x - low)/(high - low))
}
breaks <- seq(min(x, na.rm = TRUE), max(x, na.rm = TRUE), length = length(WB20)+1)
min.raw <- min(x, na.rm = TRUE)
max.raw <- max(x, na.rm = TRUE)
z <- seq(min.raw, max.raw, length = length(WB20))
image(z = matrix(z, ncol = 1), col = WB20, breaks = breaks, xaxt = "n", yaxt = "n")
par(usr = c(0, 1, 0, 1)) # needed to draw the histogram correctly
lv <- pretty(breaks)
xv <- scale01(as.numeric(lv), min.raw, max.raw)
axis(1, at = xv, labels=pretty(lv))
h <- hist(x, plot = FALSE, breaks=breaks)
hx <- scale01(breaks, min(x), max(x))
hy <- c(h$counts, h$counts[length(h$counts)])
lines(hx, hy/max(hy)*.95, lwd = 2, type = "s", col = wb13color[8])
axis(2, at = pretty(hy)/max(hy)*.95, pretty(hy))
title(ylab="Count")
title(xlab="Degree of Portfolio Concentration")
par(op)
dev.off()


# --------------------------------------------------------------------
# Show CONCENTRATION of the RP portfolios in STD DEV space WITH HULL 
# --------------------------------------------------------------------
CairoPDF(file=paste(resultsdir, dataname, "-ConcPercESContrib-SD-wHull.pdf", sep=""), height=5.5, width=9) 
WB20 = c(colorpanel(1, "#008566","#E1E56D"), colorpanel(20, "#E1E56D", "#742414")[-1])
op <- par(no.readonly=TRUE)
layout(matrix(c(1,2)),height=c(4,1.25),width=1)
par(mar=c(5,4,1,2)+.1, cex=1) # c(bottom, left, top, right)
plot(xtract[order(y,decreasing=TRUE),"StdDev"],xtract[order(y,decreasing=TRUE),"mean"], xlab="Ex Ante StdDev", ylab="Ex Ante Mean", col=WB20[floor(y[order(y,decreasing=TRUE)]*19)+1], axes=FALSE, main="", cex=.5, pch=16)
# points(xtract[hull.portfolios,"StdDev"], xtract[hull.portfolios,"mean"], col='blue')
lines(xtract[hull.portfolios,"StdDev"], xtract[hull.portfolios,"mean"], type="b", col=wb13color[1], lwd=2)
grid(col = "darkgray")
axis(1, cex.axis = 0.7, col = "darkgray")
axis(2, cex.axis = 0.7, col = "darkgray")
box(col = "darkgray")

# Add legend to bottom panel
par(mar=c(5,5.5,1,3)+.1, cex=0.7)
## Create a histogramed legend for sequential colorsets
## this next bit of code is based on heatmap.2 in gplots package
x=x.hhi
scale01 <- function(x, low = min(x), high = max(x)) {
  return((x - low)/(high - low))
}
breaks <- seq(min(x, na.rm = TRUE), max(x, na.rm = TRUE), length = length(WB20)+1)
min.raw <- min(x, na.rm = TRUE)
max.raw <- max(x, na.rm = TRUE)
z <- seq(min.raw, max.raw, length = length(WB20))
image(z = matrix(z, ncol = 1), col = WB20, breaks = breaks, xaxt = "n", yaxt = "n")
par(usr = c(0, 1, 0, 1)) # needed to draw the histogram correctly
lv <- pretty(breaks)
xv <- scale01(as.numeric(lv), min.raw, max.raw)
axis(1, at = xv, labels=pretty(lv))
h <- hist(x, plot = FALSE, breaks=breaks)
hx <- scale01(breaks, min(x), max(x))
hy <- c(h$counts, h$counts[length(h$counts)])
lines(hx, hy/max(hy)*.95, lwd = 2, type = "s", col = wb13color[8])
axis(2, at = pretty(hy)/max(hy)*.95, pretty(hy))
title(ylab="Count")
title(xlab="Degree of Portfolio Concentration")
par(op)
dev.off()

# --------------------------------------------------------------------
# Show CONCENTRATION of the RP portfolios in ETL space WITH HULL 
# --------------------------------------------------------------------
CairoPDF(file=paste(resultsdir, dataname, "-ConcPercESContrib-mETL-wHull.pdf", sep=""), height=5.5, width=9) 
WB20 = c(colorpanel(1, "#008566","#E1E56D"), colorpanel(20, "#E1E56D", "#742414")[-1])
op <- par(no.readonly=TRUE)
layout(matrix(c(1,2)),height=c(4,1.25),width=1)
par(mar=c(5,4,1,2)+.1, cex=1) # c(bottom, left, top, right)
plot(xtract[order(y,decreasing=TRUE),"ES"],xtract[order(y,decreasing=TRUE),"mean"], xlab="Ex Ante mETL", ylab="Ex Ante Mean", col=WB20[floor(y[order(y,decreasing=TRUE)]*19)+1], axes=FALSE, main="", cex=.5, pch=16, cex.lab=1.1)
points(xtract[hull.portfolios,"ES"], xtract[hull.portfolios,"mean"], col='blue')
lines(xtract[hull.portfolios,"ES"], xtract[hull.portfolios,"mean"], type="b", col=wb13color[1], lwd=2)
grid(col = "darkgray")
axis(1, cex.axis = .7, col = "darkgray")
axis(2, cex.axis = .7, col = "darkgray")
box(col = "darkgray")
# Add legend to bottom panel
par(mar=c(5,5.5,1,3)+.1, cex=0.7)
## Create a histogramed legend for sequential colorsets
## this next bit of code is based on heatmap.2 in gplots package
x=x.hhi
scale01 <- function(x, low = min(x), high = max(x)) {
  return((x - low)/(high - low))
}
breaks <- seq(min(x, na.rm = TRUE), max(x, na.rm = TRUE), length = length(WB20)+1)
min.raw <- min(x, na.rm = TRUE)
max.raw <- max(x, na.rm = TRUE)
z <- seq(min.raw, max.raw, length = length(WB20))
image(z = matrix(z, ncol = 1), col = WB20, breaks = breaks, xaxt = "n", yaxt = "n")
par(usr = c(0, 1, 0, 1)) # needed to draw the histogram correctly
lv <- pretty(breaks)
xv <- scale01(as.numeric(lv), min.raw, max.raw)
axis(1, at = xv, labels=pretty(lv))
h <- hist(x, plot = FALSE, breaks=breaks)
hx <- scale01(breaks, min(x), max(x))
hy <- c(h$counts, h$counts[length(h$counts)])
lines(hx, hy/max(hy)*.95, lwd = 2, type = "s", col = wb13color[8])
axis(2, at = pretty(hy)/max(hy)*.95, pretty(hy))
title(ylab="Count")
title(xlab="Degree of Portfolio Concentration")
par(op)
dev.off()

  
### APPENDIX SLIDES:
  
# --------------------------------------------------------------------
# Show weights through time for MRC SD portfolio
# --------------------------------------------------------------------
print(load("results/MRCSD.DE.t-2013-10-17-historical.moments.rda"))
MRCSD.w = extractWeights(MRCSD.DE.t)
CairoPDF(file=paste(resultsdir, dataname, "-weights-SD.pdf", sep=""), height=5.5, width=9)
chart.UnStackedBar(MRCSD.w, rotate="horizontal", colorset=wb13color, space=0, las=3, cex.axis=0.7, cex.names=0.8)
dev.off()

# --------------------------------------------------------------------
# Show percent contribution of MRC SD through time
# --------------------------------------------------------------------
# Extract perc contrib of mES from results object
x=NULL
for(i in 1:length(names(MRCSD.DE.t)))  {
  x = rbind(x,MRCSD.DE.t[[i]][["objective_measures"]]$StdDev$pct_contrib_StdDev)
}
x.xts = as.xts(x, order.by=as.POSIXct(names(MRCSD.DE.t)))
  colnames(x.xts)=names(MRCmETL.DE.t[[1]][["objective_measures"]]$StdDev$pct_contrib_StdDev)
CairoPDF(file=paste(resultsdir, dataname, "-contribution-SD.pdf", sep=""), height=5.5, width=9)
chart.UnStackedBar(x.xts, rotate="horizontal", colorset=wb13color, space=0, las=3, cex.axis=0.7, cex.names=0.8)
dev.off()
  
# --------------------------------------------------------------------
# Show weights through time for MRC mETL portfolio
# --------------------------------------------------------------------
print(load("results/MRCmETL.DE.t-2013-10-18-historical.moments.rda"))
MRCmETL.w = extractWeights(MRCmETL.DE.t)
CairoPDF(file=paste(resultsdir, dataname, "-weights-mETL.pdf", sep=""), height=5.5, width=9)
chart.UnStackedBar(MRCmETL.w, rotate="horizontal", colorset=wb13color, space=0, las=3, cex.axis=0.7, cex.names=0.8)
dev.off()

# --------------------------------------------------------------------
# Show percent contribution of mETL through time
# --------------------------------------------------------------------
# Extract perc contrib of mES from results object
x=NULL
for(i in 1:length(names(MRCmETL.DE.t)))  {
  x = rbind(x,MRCmETL.DE.t[[i]][["objective_measures"]]$ES$pct_contrib_MES)
}
x.xts = as.xts(x, order.by=as.POSIXct(names(MRCmETL.DE.t)))
colnames(x.xts)=names(MRCmETL.DE.t[[1]][["objective_measures"]]$ES$pct_contrib_MES)
CairoPDF(file=paste(resultsdir, dataname, "-contribution-mETL.pdf", sep=""), height=5.5, width=9)
chart.UnStackedBar(x.xts, rotate="horizontal", colorset=wb13color, space=0, las=3, cex.axis=0.7, cex.names=0.8)
dev.off()
  
# --------------------------------------------------------------------
# Show out-of-sample performance of buoy portfolios
# --------------------------------------------------------------------
  EqWgt.opt$weights
dates=index(R[endpoints(R, on="years")])
EqWgt.w = xts(matrix(rep(1/NCOL(R),length(dates)*NCOL(R)), ncol=NCOL(R)), order.by=dates)
EqWgt.R = Return.rebalancing(R, EqWgt.w)
MRCSD.R = Return.rebalancing(R, MRCSD.w)  
MRCmETL.R = Return.rebalancing(R, MRCmETL.w)
x.R = cbind(EqWgt.R, VolWgt.R, MRCSD.R, MRCmETL.R)
colnames(x.R)=c("Eq Wgt", "Vol Wgt", "MRC SD", "MRC mETL")
CairoPDF(file=paste(resultsdir, dataname, "-OOS-relative-performance.pdf", sep=""), height=5.5, width=9)
chart.RelativePerformance(x.R["2000::",2:4], x.R["2000::",1], colorset=wb13color[c(8,7,11)], lwd=3, legend.loc="bottomleft", main="Performance Relative to Equal Weight")
dev.off()

table.RiskStats(x.R["2000::"], p=1-1/12)
  
R.boudt=Return.clean(R, method="boudt")
# --------------------------------------------------------------------
# From Inception Mean of constituents
# --------------------------------------------------------------------
x.mean=apply.fromstart(R,FUN="mean")
x.mean=as.xts(x.mean)
CairoPDF(file=paste(resultsdir, dataname, "-from-inception-mean.pdf", sep=""), height=5.5, width=9)
chart.TimeSeries(x.mean["2000-01::",],legend.loc="topright", colorset=wb13color, pch="", lwd=3, main="From-Inception Mean")
dev.off()

# --------------------------------------------------------------------
# From Inception Volatility of constituents
# --------------------------------------------------------------------
x.vol=apply.fromstart(R,FUN="StdDev")
x.vol=as.xts(x.vol)
CairoPDF(file=paste(resultsdir, dataname, "-from-inception-vol.pdf", sep=""), height=5.5, width=9)
chart.TimeSeries(x.vol["2000-01::",],legend.loc="bottomleft", colorset=wb13color, pch="", lwd=3, main="From-Inception Volatility")
dev.off()
  
# --------------------------------------------------------------------
# From Inception Skewness of constituents
# --------------------------------------------------------------------
x.skew=apply.fromstart(R,FUN="skewness")
x.skew=as.xts(x.skew)
CairoPDF(file=paste(resultsdir, dataname, "-from-inception-skew.pdf", sep=""), height=5.5, width=9)
chart.TimeSeries(x.skew["2000-01::",],legend.loc="bottomleft", colorset=wb13color, pch="", lwd=3, main="From-Inception Skewness")
dev.off()
  
# --------------------------------------------------------------------
# From Inception Kurtosis of constituents
# --------------------------------------------------------------------
x.kurt=apply.fromstart(R,FUN="kurtosis")
x.kurt=as.xts(x.kurt)
CairoPDF(file=paste(resultsdir, dataname, "-from-inception-kurt.pdf", sep=""), height=5.5, width=9)
chart.TimeSeries(x.kurt["2000-01::",],legend.loc="topleft", colorset=wb13color, pch="", lwd=3, main="From-Inception Kurtosis")
dev.off()