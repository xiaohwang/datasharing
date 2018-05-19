
library(shiny)
data(mtcars)

shinyServer(function(input,output){
  output$plot1<-renderPlot({
    set.seed(88888888)
    number_of_points<-input$numeric
    
    minY<-input$sliderY[1]
    maxY<-input$sliderY[2]
    
    submtcars<-mtcars[c(1:number_of_points),] # subset data according to input of points to be plotted
    submtcars<-subset(submtcars,submtcars$mpg<=maxY&submtcars$mpg>=minY) # subset data according to slider
    
    dataY<-submtcars$mpg
    dataX<-submtcars$wt
   
    xlab<-ifelse(input$show_xlab,"Weight (x1000lbs)","")
    ylab<-ifelse(input$show_ylab,"Miles Per Gallon (MPG)","")
    main<-ifelse(input$show_title,"MPG and Weight Relationship","")
    plot(dataX,dataY,xlab=xlab,ylab=ylab,main=main,xlim=c(min(mtcars$wt),max(mtcars$wt)),ylim=c(min(mtcars$mpg),max(mtcars$mpg)))
  })
})
  
    
