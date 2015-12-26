
# file: server.R
# Title: Developing Data Products - Course Project
# Author: Sean Miller

library(shiny)
require(datasets)
require(caret)
library(AppliedPredictiveModeling)

iris_dataset = iris

shinyServer(function(input, output) {
    
    output$distPlot = renderPlot({
        # Create variables to plot
        x = iris_dataset[, input$x_var]
        y = iris_dataset[, input$y_var]
        s = iris_dataset[, "Species"]
        
        title = paste(input$x_var, "vs", input$y_var, sep = " ")
        
        # Concat x, y, and s together to create dataset for our model
        iris_data = cbind(s, x, y)
        
        # Draw the base scatter plot
        plot(x, y, type = "n", xlab = input$x_var, ylab = input$y_var, 
             main = title)
        
        # Draw each of the points
        points(x[s == "setosa"], y[s == "setosa"], col="darkgreen", pch=1)
        points(x[s == "versicolor"], y[s == "versicolor"], col="red", pch=2)
        points(x[s == "virginica"], y[s == "virginica"], col="dodgerblue4", pch=3)
        points(as.numeric(input$x_pred), as.numeric(input$y_pred), pch=16)
        
        # Draw the legend
        legend("topright", 
               legend = c("setosa", "versicolor", "virginica"), 
               col=c("darkgreen","red","dodgerblue4"),
               pch = c(1,2,3))
    })
    
    output$prediction = renderText({
        # Create variables to plot
        x = iris_dataset[, input$x_var]
        y = iris_dataset[, input$y_var]
        s = as.factor(iris_dataset[, "Species"])
        
        # Concat x, y, and s together to create dataset for our model
        iris_data = as.data.frame(cbind(s, x, y))
        
        # Reuse x and y to make our prediction
        x = as.double(input$x_pred)
        y = as.double(input$y_pred)
        iris_predict = as.data.frame(cbind(x, y))
        
        # Fit an rpart model
        modFit = train(s ~ ., method = "rpart", data=iris_data)
        
        # Round the prediction to the nearest factor values
        prediction = round(predict(modFit, iris_predict))
        
        levels(iris_dataset$Species)[prediction]
    })
    
    output$spec_pred = renderText({input$spec_pred})
})
