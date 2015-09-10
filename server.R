# server.R for Bekera Resilience Factor
library(shiny)
library(ggplot2)
# This is a calculation for the Bekera resilience metric rho
rho <- function(slackTime, tStar, tF, a, Fi, Fd, Fr){
    if (tF >= tStar){
        speedFactor <- (slackTime/tStar)*exp(a * (tF - tStar))
    } else {
        speedFactor <- (slackTime/tStar)
    }
    speedFactor * Fr * Fd / (Fi)^2
}
shinyServer(function(input, output){
    output$Fd.v.rho <- renderPlot({
        p <- ggplot(data.frame(x=c(0, 1.5)), aes(x)) +
            stat_function(fun=function(x)rho(slackTime=input$slackTime,
                              tStar=input$tStar,
                              tF=input$tF,
                              a=input$a,
                              Fd=x,
                              Fi=input$Fi,
                              Fr=input$Fr))
        p <- p + scale_x_continuous("Functionality after Disturbance") +
            scale_y_continuous("Resilience Factor")
        print(p)
    })
#    output$a.v.rho <- renderPlot({
#        q <- ggplot(data.frame(x=c(0,1.5)), aes(x)) +
#            stat_function(fun=function(x)rho(slackTime=input$slackTime,
#                              tStar=input$tStar,
#                              tF=input$tF,
#                              a=x,
#                              Fd=input$Fd,
#                              Fi=input$Fi,
#                              Fr=input$Fr))
#        q <- q + scale_x_continuous("Degradation Factor") +
#            scale_y_continuous("Rho")
#        print(q)
#    })
    }
            )
