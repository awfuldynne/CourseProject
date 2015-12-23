
# file: server.R
# Title: Developing Data Products - Course Project
# Author: Sean Miller

library(shiny)
library(dplyr)
library(datasets)

iris_dataset = iris

shinyServer(function(input, output) {

  output$distPlot = renderPlot({
      x = iris_dataset[, input$x_var]
      y = iris_dataset[, input$y_var]
      s = iris_dataset[, "Species"]
    # Draw the base scatter plot
    plot(x, y, type = "n", xlab = input$x_var, ylab = input$y_var)
    points(x[s == "setosa"], y[s == "setosa"], col="darkgreen", pch=1)
    points(x[s == "versicolor"], y[s == "versicolor"], col="red", pch=2)
    points(x[s == "virginica"], y[s == "virginica"], col="dodgerblue4", pch=3)
  })
})
