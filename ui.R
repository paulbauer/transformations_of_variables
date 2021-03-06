library(markdown)
library(car)



  shinyUI(fluidPage(
    

  titlePanel("Transformations of variables/data"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("transformation", label = "Transformation:",
                  choices = c("none", "center", "divided by 10", "mininum to 0", "reverse", "standardize"), selected = 1),
      selectInput("original.scale", label = "Keep original X-scale:",
                  choices = c("no", "yes (-50 to 170)"), selected = 1),
      br(), br(),
      
      div("Shiny app by", 
          a(href="http://paulcbauer.eu/",target="_blank", 
            "Paul C. Bauer"),align="right", style = "font-size: 8pt"),
      
      
      div("Shiny/R code:",
          a(href="https://github.com/paulbauer/transformations_of_variables/",
            target="_blank","GitHub"),align="right", style = "font-size: 8pt")

  ),

 mainPanel(
      tabsetPanel(type = "tabs", 
        tabPanel("Plot", plotOutput("plot")),
        tabPanel("Data", h4("Summary statistics of weight"), verbatimTextOutput("summary"), h4("Original data"), verbatimTextOutput("originaldata"), h4("Transformed data"), verbatimTextOutput("transformeddata")),
               tabPanel("Instructions", includeMarkdown("instruction.md")),
        tabPanel("About", includeMarkdown("about.md"))
      
      )
    )
  )
))