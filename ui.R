                                        # ui.R
shinyUI(fluidPage(
    titlePanel("Bekera Resilience Factor (Bekera 2014)"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("Slack Time", "Time in Years:", min=0, max=10,
                        value=1, step=.5),
            sliderInput("Time to Complete Initial Recovery Actions", min=0
                        max=20, value=5, step=0.5),
            sliderInput("Time to Final Recovery", min=0, max=20, value=10,
                        step=0.5),
            sliderInput("Functionality prior to Disturbance", min=0, max=1.5,
                        value=1.0, step=0.05),
            sliderInput("Functionality after Disturbance", min=0, max=1.5,
                        value=0, step=0.05),
            sliderInput("Functionality after Recovery", min=0, max=1.5,
                        value=1.0, step=0.05)
            sliderInput("Functionality after Recovery", min=0, max=1.5,
                        value=1.0, step=0.05)
            sliderInput("Functionality after Recovery", min=0, max=1.5,
                        value=1.0, step=0.05)
        ),
        mainPanel(
            plotOutput("rho")
        )
    )
))
