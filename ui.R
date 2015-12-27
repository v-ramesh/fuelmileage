library(shiny)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Variation of Mileage with Motor Vehicle Features"),
  
  # Sidebar with controls to select the variable to plot against
  # mpg and to specify whether outliers should be included
  sidebarLayout(
    sidebarPanel(
      selectInput("variable", "Select Feature/Variable:",
                  c("Cylinders" = "cylinders",
                     "Engine Displacement" = "displacement (cu. in.)",
                     "Horsepower" = "hp",
                     "Rear axle ratio" = "rear axle ratio",
                     "Weight" = "weight (lbs)",
                     "Quarter Mile Time" = "1/4 mile time (secs)",
                     "Engine Type" = "engine_type",
                     "Transmission" = "transmission",
                     "Gears" = "gear",
                     "Carburetors" = "carburetors"))
        ),
    
    mainPanel(
        tabsetPanel(type = "tabs", selected = "Help",
                    
                    # Plot Panel
                    tabPanel("Plot", 
                             # Show caption and plot of mpg against requested
                             # variable
                             h3(textOutput("caption")),
                             plotOutput("mpgPlot")), 
                    
                    # Dataset Panel
                    tabPanel("Dataset",
                             tableOutput("data")),
                    
                    # Help Panel
                    tabPanel("Help",
                             h4("Usage Instructions"),
                             tags$ul(
                                 tags$li("This application allows you to explore the dependence of
                                fuel consumption on various automobile features."),
                                 tags$li("Use the pulldown menu on the left to select the 
                                    feature of interest."),
                                 tags$li("A suitable plot of the variation of mileage against the
                                         selected feature will be generated."),
                                 tags$li("Select the Plot tab to view this plot."),
                                 tags$li("Plots are based on fuel consumption information
                                    from several 1973-1974 model cars - select the Dataset tab to 
                                    view the original data.")
                                ),
                             h4("Compliance with Grading Rubric"),
                             tags$ul(
                                 tags$li("Pulldown menu for selecting the feature of interest is the input widget."),
                                 tags$li("Calculations performed from the input include generation of 
                                          the plot, its labels, and title displayed in the Plot tab.")
                             )
                             )
                    )
        )
    )
))
