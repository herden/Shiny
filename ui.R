library(shiny)
library(markdown)
load(url("http://s3.amazonaws.com/assets.datacamp.com/course/dasi/nc.Rdata"))
# Define newborn weight
shinyUI(navbarPage("App Title",
                   tabPanel("Plot",
                            
                            sidebarLayout(
                              
                              # Application title
                              headerPanel("Newborn weight"),
                              
                              sidebarPanel(
                                selectInput("variable", "Variable:",
                                            list("Habit " = "habit", 
                                                 "Gender" = "gender", 
                                                 "Whitemom" = "whitemom",
                                                 "Mature" = "mature")),
                                
                                checkboxInput("outliers", "Show outliers", FALSE)
                              )
                            )
                            
                   ),
                   
                   mainPanel(
                     h3(textOutput("caption")),
                     plotOutput("weightPlot")
                   ),

                   navbarMenu("More",
                   tabPanel("About",
    fluidRow(
      column(6,
          includeMarkdown("about.txt")
      )
                  )
             )
          )

))