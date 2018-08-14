plot.barplot <- function (x, xname = NULL, fillname = NULL, prop = F){
  require(ggplot2)
  t <- table(x[[xname]], x[[fillname]])
  if(prop)   t <- prop.table(t)
  df <- data.table::data.table(t)
  colnames(df) <- c(paste(xname), paste(fillname), "Frequency")
  if( is.null(names(x)  ) ){
    mname = substitute(x)  
    hist(x, main = paste("Histogram of", xname ), xlab = paste( xname ))
  }else{
    g <- ggplot(df, aes(x = df[[xname]], y = Frequency, fill = df[[fillname]])) + 
      geom_bar(stat = "identity", position = "dodge") + ylab("Frequency") + 
      xlab(paste(xname) )+ guides(fill=guide_legend(title=paste(fillname)))
    print(g)
  }
}

