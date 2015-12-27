library(ggplot2)
library(shiny)
library(datasets)

# Convert appropriate variables of mpg dataset to be categorical and 
# variable names and levels to be more readable when possible.
# To prevent modifying mpg directly, we first copy the dataframe.

mpgData <- mtcars
mpgData$cylinders <- factor(mpgData$cyl)
mpgData$"displacement (cu. in.)" <- mpgData$disp
mpgData$"rear axle ratio" <- mpgData$drat
mpgData$"weight (lbs)" <- mpgData$wt * 1000
mpgData$"1/4 mile time (secs)" <- mpgData$qsec
mpgData$engine_type <- factor(mpgData$vs, labels = c("Straight", "V"))
mpgData$transmission <- factor(mpgData$am, labels = c("Automatic", "Manual"))
mpgData$gear <- factor(mpgData$gear)
mpgData$carburetors <- factor(mpgData$carb)

# Server Logic

shinyServer(function(input, output) {

  # Return the title for printing as a caption
  output$caption <- renderText({paste("Plot of mpg vs", input$variable)})

  # Generate suitable plot of mpg with respect to input variable
  output$mpgPlot <- renderPlot({
     if (is.factor(mpgData[, input$variable])) {
         # Boxplot for categorical variables
         qplot(mpgData[, input$variable], mpgData$mpg, geom = c("boxplot"),
               fill = mpgData[, input$variable]) + 
             labs(title = "", x = input$variable, y = "mpg", fill = input$variable)
         }
     else {
         # Scatterplot with best fit curve for numerical variables
         qplot(mpgData[, input$variable], mpgData$mpg,
               geom = c ("point", "smooth"), method = "loess") + 
             labs(title = "", x = input$variable, y = "mpg")
         }
  })
  
  # Original dataset
  output$data <- renderTable({mtcars})
})
