source("extRa/startup.R")

function(input, output, session) {

  # Plot 1
  output$plot1 <- renderPlotly({
    colr <- as.character(df[,22])
    name  = as.character(df[,1])
    key <- row.names(df)
    cf <- factor(colr, levels = as.character(unique(colr)), ordered = TRUE)
    
    dfp <- data.frame(x     = df[,input$xcol],  
                      y     = df[,input$ycol],  
                      z     = df[,input$zcol],
                      name  = as.character(df[,1]),
                      colidx = as.integer(cf))
    plot_ly(dfp, x = ~x, y = ~y, z = ~z, type="scatter3d", mode="markers", marker = list(size = 3),
            color = ~as.ordered(colidx), colors = as.character(unique(cf)), text = c(paste0("Name: ", name, "<br>")), showscale=FALSE, showlegend = FALSE)
  })
  
}

