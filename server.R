library(shiny)
load(url("http://s3.amazonaws.com/assets.datacamp.com/course/dasi/nc.Rdata"))


# Define server logic required to plot various variables against weight
# Define server logic required to plot various variables against weight
shinyServer(function(input, output) {
  
  # Compute the forumla text in a reactive expression since it is 
  # shared by the output$caption and output$weightPlot expressions
  formulaText <- reactive({
    paste("weight ~", input$variable)
  })
  
  # Return the formula text for printing as a caption
  output$caption <- renderText({
    formulaText()
  })
  
  # Generate a plot of the requested variable against weight and only 
  # include outliers if requested
  output$weightPlot <- renderPlot({
    boxplot(as.formula(formulaText()), 
            data = nc,
            outline = input$outliers)
  })
})