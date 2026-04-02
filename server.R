library(shiny)
library(ggplot2)
library(dplyr)

theme_custom <- theme(
  axis.text.x = element_text(size = 12),
  axis.text.y = element_text(size = 12),
  axis.title = element_text(size = 14),
  plot.title = element_text(size = 16),
  legend.text = element_text(size = 12),
  legend.title = element_text(size = 14)
)

server <- function(input, output){
  output$plot1 <- renderPlot({
    df %>%
      filter(year >= input$year1[1], year <= input$year1[2],
             sex %in% input$sex1,
             age == input$age1) %>%
      ggplot() +
      aes(x = year, y = prop_cigarette_smokers,
          group = sex, color = sex) + geom_line(size = 1) +
      geom_point(size = 3) +
      labs(
        # title = "Proportion of Cigarette Smokers Over Years",
        title = paste(
          "Smoking Trends | Age:", input$age1,
          "| Sex:", paste(input$sex1, collapse = ", "),
          "| Years:", input$year1[1], "-", input$year1[2]),
        x = "Year",
        y = "Proportion of Cigarette Smokers",
        color = "Sex") +
      theme_custom
  })

  output$plot2 <- renderPlot({
    df %>%
      filter(year >= input$year2[1], year <= input$year2[2],
             sex == input$sex2,
             age %in% input$age2) %>%
      ggplot() +
      aes(x = year, y = prop_cigarette_smokers,
          group = age, color=age) + geom_line(size = 1) +
      geom_point(size = 3) +
      labs(
        # title = "Proportion of Cigarette Smokers Over Years",
        title = paste(
          "Smoking Trends | Sex:", input$sex2,
          "| Age:", paste(input$age2, collapse = ", "),
          "| Years:", input$year2[1], "-", input$year2[2]
        ),
        x = "Year",
        y = "Proportion of Cigarette Smokers",
        color = "Age group") +
      theme_custom
  })
}
