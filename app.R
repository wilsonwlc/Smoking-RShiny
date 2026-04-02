library(shiny)

ui <- NULL
server <- NULL

source("data_processing.R")
source("ui.R")
source("server.R")

shinyApp(ui = ui, server = server)
