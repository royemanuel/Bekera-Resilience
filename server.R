# server.R for Bekera Resilience Factor
library(shiny)
library(ggplot2)
# This is a calculation for the Bekera resilience metric rho
rho <- function(slackTime, tStar, tF, Fi, Fd, Fr){
    if (tF >= tStar){
        speedFactor <- (slackTime/tStar)*
    }
}
