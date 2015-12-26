
# file: ui.R
# Title: Developing Data Products - Course Project
# Author: Sean Miller

library(shiny)
require(shinyBS)

shinyUI(fluidPage(

  # Application title
  titlePanel("Predicting Iris Species"),
  
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      h2("Introduction"),
      p("Predict the species of an iris by adjusting the predictors/axis variables
        and inputting a new xy-coordinate and expected iris species."),
      
      h3("Controls"), 
      selectInput("x_var", "X-Axis Variable", variables, selected = "Sepal.Length"),
      selectInput("y_var", "Y-Axis Variable", variables, selected = "Sepal.Width"),
      bsTooltip("x_var", "Set the X-Axis variable of the plot", "right"),
      bsTooltip("y_var", "Set the Y-Axis variable of the plot", "right"),
      
      h3("Prediction"),
      selectInput("spec_pred", "Species Prediction", predictions, selected = "setosa"),
      sliderInput("x_pred", "X Prediction",0, 8, 6.0, step = .2),
      sliderInput("y_pred", "Y Prediction",0, 8, 3.0, step = .2),
      bsTooltip("spec_pred", "Set the species prediction (setosa, versicolor, virginica)", "down"),
      bsTooltip("x_pred", "Set the X-Axis prediction", "right"),
      bsTooltip("y_pred", "Set the Y-Axis prediction", "right"),
      
      submitButton("Submit")
    ),

    # Show a plot of the generated distribution
    mainPanel(
        h2("Scatterplot of Predictors"),
        plotOutput("distPlot"),
        h2("Prediction vs Model Prediction"),
        h4("Prediction"),
        textOutput("spec_pred"),
        h4("Model Prediction"),
        textOutput("prediction")
    )
  )
))
