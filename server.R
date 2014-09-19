library(UsingR)
data(women)

Woweight<-function(wheight)
{
        weight_Women<-lm(weight~height,data=women)
        new.height<-data.frame(height=wheight)
weightPredict<-predict(weight_Women,newdata=new.height)
weightPredict<-as.data.frame(weightPredict)
weightPredict[1,1]
if (weightPredict[1,1]<40)
{
       print (paste("Your weight is probably", as.integer(weightPredict[1,1]),"lbs."))
}

if (weightPredict[1,1]>40)
{
        print(paste("Your weight is probably", as.integer(weightPredict[1,1]),"lbs."))
}

}
       
        
shinyServer(
        function(input, output) 
        { 
               
                output$inputvalue<-renderPrint(input$height)
                output$prediction<-renderPrint({Woweight(input$height)})
          output$plot <- renderPlot({
                  plot(women,type=input$plotType, col="blue")
                
                })
        }
)
