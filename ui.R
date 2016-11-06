source("extRa/startup.R")

shinyUI(
    navbarPage(
        HTML("<img src='harvard-logo.png'/>"),
        tabPanel("Visualize",
                 fluidPage(
                         mainPanel(
                             selectInput('xcol', 'X Variable', names(df)[c(-1,-22)],
                                         selected=names(df)[[2]], selectize = TRUE),
                             selectInput('ycol', 'Y Variable', names(df)[c(-1,-22)],
                                         selected=names(df)[[3]], selectize = TRUE),
                             selectInput('zcol', 'Z Variable', names(df)[c(-1,-22)],
                                         selected=names(df)[[4]], selectize = TRUE),
                             plotlyOutput('plot1', height = "1000", width = "150%")
                         )
                     
                 )
        ),
                     
        tabPanel("Guide",
            includeMarkdown("www/guide.Rmd")
        ),
        
        ##########
        # FOOTER
        ##########
        
        theme = shinytheme("flatly"),
        footer = HTML(paste0('<P ALIGN=Center>repr &copy; <A HREF="mailto:caleblareau@g.harvard.edu">Caleb Lareau</A>')),
        collapsible = TRUE, 
        fluid = TRUE,
        windowTitle = "repr_scRNAseq"
))
        