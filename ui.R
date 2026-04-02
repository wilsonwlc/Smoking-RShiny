library(shiny)

ui <- fluidPage(
  tabsetPanel(
    tabPanel("", title = "By sex",
             sidebarLayout(
               sidebarPanel(
                 h4("Instructions"),
                 tags$ul(
                   tags$li("Select one or more sexes"),
                   tags$li("Select one age group"),
                   tags$li("Adjust the year range")
                 ),
                 checkboxGroupInput(inputId = "sex1",
                                    label = "Sex",
                                    choices = unique(df$sex),
                                    selected = "all persons",
                                    inline=FALSE),
                 selectInput(inputId = "age1",
                             label = "Filter: Age group",
                             choices = unique(df$age),
                             selected = "16 and over"),
                 sliderInput(inputId = "year1",
                             label = "Year",
                             min = 2000, max = 2022,
                             value = c(2005, 2015), step = 1)),
               mainPanel(
                 h4("Overview"),
                 p("This chart shows the proportion of cigarette smokers over time by sex."),
                 plotOutput("plot1"))
             ))
    ,
    tabPanel("", title = "By age group",
             sidebarLayout(
               sidebarPanel(
                 h4("Instructions"),
                 tags$ul(
                   tags$li("Select a single sex"),
                   tags$li("Select one or more age groups"),
                   tags$li("Adjust the year range")
                 ),
                 selectInput(inputId = "sex2",
                             label = "Filter: Sex",
                             choices = unique(df$sex),
                             selected = "all persons"),
                 checkboxGroupInput(inputId = "age2",
                                    label = "Age group",
                                    choices = unique(df$age),
                                    selected = "16 and over",
                                    inline=FALSE),
                 sliderInput(inputId = "year2",
                             label = "Year",
                             min = 2000, max = 2022,
                             value = c(2005, 2015), step = 1)),
               mainPanel(
                 h4("Overview"),
                 p("This chart shows the proportion of cigarette smokers over time by age group."),
                 plotOutput("plot2"))
             ))
  )
)
