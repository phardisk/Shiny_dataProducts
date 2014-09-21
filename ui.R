library(shiny)
shinyUI(navbarPage("My ShinyApp",
                   tabPanel("About",
                            fluidRow(
                                    
                                    column(5,
                                           strong("Introduction"),
                                           p("Putting an interactive data analysis in the web 
                                             is very valuable. In our case, we make some exploratory data analysis
                                             and create an algorithm that predicts the weight based on the height. 
                                             Our application comprises three panels: About, Exploratory Data and Predict your weight"),
                                           strong("Methodology"),
                                           p("we use Shiny library to devlop this application.The dataset 
                                             used for the prediction is provided by R. It's the dataset called women. 
                                             It gives the weight and the height for 15 women."),
                                           strong("How to use the Exploratory Data panel"),
                                           p("The Exploratory Data panel counts two control widgets: radio button and submit button. This part is able to show two kinds of plot
                                             : scatterplot and a histogram. To see these plots, you have click 
                                             in the radio button wanted and after that click on the submit button."),
                                           strong("How to use the Predict your weight panel"),
                                           p("The Predict your weight panel counts two control widgets: submit button and field to enter numbers. It is made for predicting women weight.
                                             This algorithm is a regression relationship with height as predictor and weight as outcome.
                                              For using this application, you have to choose your height in inch and click on submit button after that.
                                             In the right side, the application gives you 
                                             the predicted weight in pounds.When you use the down or the up narrow, the minimal height you can choose is 
                                             30 in and the maximal height is 100 in.")
                                          
                                    )
                            
                            
                   )
                   ),
                   

                   tabPanel("Exploratory Data",
                            sidebarLayout(
                                    sidebarPanel(
                                            radioButtons("plotType", "Plot type",
                                                         c ("Scatter"="p","Histogram"="h")
                                            ),
                                            
                                            submitButton('Submit'),
                                            br(),
                                            strong("Remark"),
                                            p("We observe a fairly well correlation between weight and height.")
                                            ),
                                    
                                    mainPanel(
                                            plotOutput("plot")
                                            
                                    )
                            )
                   ),
                   
                   tabPanel("Predict your Weight",
                            fluidRow(
                                    
                                    
                                    column(5,
                                           numericInput('height','Enter your height in inch',30,min=30,max=100
                                           ),
                                           
                                           submitButton('Submit')
                                           
                                    ),
                                    column(5,
                                           h3('Weight predictions in lbs'),
                                           h4('You entered'),
                                           verbatimTextOutput("inputvalue"),
                                           h4('Here is the prediction'),
                                           verbatimTextOutput("prediction")
                                          
                                           
                                    )
                            )     
                            
                   )
                  
                   
                   
))
