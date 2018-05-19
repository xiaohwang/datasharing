
#install.packages("shiny")

library(shiny)
data(mtcars) # loanding data

shinyUI(fluidPage(
  titlePanel("Car Data Exploration"),
  sidebarLayout(
    sidebarPanel(
      
      numericInput("numeric","How Many Points Should be Plotted?",
                   value=50,min=1,max=50,step=1),
     
      sliderInput("sliderY","Pick Minimum and Maximum MPG Values",
                  min(mtcars$mpg),max(mtcars$mpg),value=c(min(mtcars$mpg),max(mtcars$mpg))),
      
      checkboxInput("show_xlab","Show/Hide X Axis Label",value=TRUE),
      checkboxInput("show_ylab","Show/Hide Y Axis Label",value=TRUE),
      checkboxInput("show_title","Show/Hide Title",value=TRUE)
    ),
    
    mainPanel(
     # h4("Car MPG Data Plot"),
      plotOutput("plot1")
    )
  )
))
      
      
