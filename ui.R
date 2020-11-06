library(shiny)

shinyUI(
  navbarPage("Shiny Application for Coursera ",
             tabPanel("Analysis",
                      fluidPage(
                        titlePanel("The relationship between the variables and miles per gallon (MPG)"),
                        sidebarLayout(
                          sidebarPanel(
                            selectInput("variable", "Variable:",
                                        c("Number of cylinders" = "cyl",
                                          "Displacement (cu.in.)" = "disp",
                                          "Gross horsepower" = "hp",
                                          "Rear axle ratio" = "drat",
                                          "Weight (lb/1000)" = "wt",
                                          "1/4 mile time" = "qsec",
                                          "V/S" = "vs",
                                          "Transmission" = "am",
                                          "Number of forward gears" = "gear",
                                          "Number of carburetors" = "carb"
                                        )),
                            
                            checkboxInput("outliers", "Show BoxPlot's outliers", FALSE)
                          ),
                          
                          mainPanel(
                            h3(textOutput("caption")),
                            
                            tabsetPanel(type = "tabs", 
                                        tabPanel("BoxPlot", plotOutput("mpgBoxPlot")),
                                        tabPanel("Regression model", 
                                                 plotOutput("mpgPlot"),
                                                 verbatimTextOutput("fit")
                                        )
                            )
                          )
                        )
                      )
             ),
             tabPanel("Information about the Dataset",
                      
                      h3("Regression Models Project (Coursera)"),
                      helpText("The aim of the project is to decide which gear transmission is better, manual or automatic in terms of Miles per Gallon.",
                               "We also want to quantify the MPG difference between manual and automatic transmissions"),
                      h3("Important!"),
                      p("A data frame with 11 variables and 32 observations."),
                      
                      a("https://class.coursera.org/regmods-008")
             ),
             tabPanel("Delving into the Details",
                      h2("Motor Trend Car Road Tests"),
                      hr(),
                      h3("Detailed Description"),
                      helpText("This data was obtained from the 1974 Hemmings Motor US magazine,",
                               " It comprises the fuel consumption and 10 aspects of automobile design and performance",
                               " for 32 automobiles (1973-74 models)."),
                      h3("Format"),
                      p("A data frame with 11 variables and 32 observations."),
                      
                      p("  [, 1]   mpg         Miles/(US) gallon"),
                      p("  [, 2]	 cyl	 Number of cylinders"),
                      p("  [, 3]	 disp	 Displacement (cu.in.)"),
                      p("  [, 4]	 hp	 Gross horsepower"),
                      p("  [, 5]	 drat	 Rear axle ratio"),
                      p("  [, 6]	 wt	 Weight (lb/1000)"),
                      p("  [, 7]	 qsec	 1/4 mile time"),
                      p("  [, 8]	 vs	 V/S"),
                      p("  [, 9]	 am	 Transmission (0 = automatic, 1 = manual)"),
                      p("  [,10]	 gear	 Number of forward gears"),
                      p("  [,11]	 carb	 Number of carburetors"),
                      
                      h3("Sources Cited"),
                      
                      p("Velleman and Henderson (1981), Building multiple regression models interactively. Biometrics, 37, 391-411.")
             ),
             tabPanel("Visit my Github Repository",
                      a("https://github.com/adithyaa98/Developing-Data-Products-PGA3"),
                      hr(),
                      h4("Hope you like it!"),
                     )
  )
)