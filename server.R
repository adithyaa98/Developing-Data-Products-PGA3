#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

## Importing the necessary libraries

library(ggpubr) 
library(shiny)
library(datasets) 

## Reading the Data

mpgCarsData <- mtcars
mpgCarsData$am <- factor(mpgCarsData$am, labels = c("Automatic", "Manual"))

## Shiny Server

shinyServer(function(input, output) {
    
    formulaText <- reactive({
        paste("mpg ~", input$variable)
    }) ### Formula Text
    
    formulaTextPoint <- reactive({
        paste("mpg ~", "as.integer(", input$variable, ")")
    }) ### Formula Text Point
    
    fit <- reactive({
        lm(as.formula(formulaTextPoint()), data=mpgCarsData)
    }) ### Fitting
    
    output$caption <- renderText({
        formulaText()
    }) ### Output Caption
    
    output$mpgBoxPlot <- renderPlot({
        boxplot(as.formula(formulaText()), 
                data = mpgCarsData,
                outline = input$outliers)
    }) ### Box Plot
    
    output$fit <- renderPrint({
        summary(fit())
    }) ### Summary
    
    output$mpgPlot <- renderPlot({
        with(mpgCarsData, {
            plot(as.formula(formulaTextPoint()))
            abline(fit(), col=2)
        }) ### Render Plot
    })
    
})