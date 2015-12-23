
# file: ui.R
# Title: Developing Data Products - Course Project
# Author: Sean Miller

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Predicting Iris Species"),
  
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      selectInput("x_var", "X-Axis Variable", variables, selected = "Sepal.Length"),
      selectInput("y_var", "Y-Axis Variable", variables, selected = "Sepal.Width"),
      submitButton("Submit")
    ),

    # Show a plot of the generated distribution
    mainPanel(
        plotOutput("distPlot")
    )
  )
))
