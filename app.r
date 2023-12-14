library(shiny)

ui <- fluidPage(
  titlePanel(paste(
    "Eu não tenho servidor!!",
    emo::ji("surprised")
  )),
  sidebarLayout(
    sidebarPanel(
      selectInput("x", "Eixo x", choices = names(mtcars)),
      selectInput("y", "Eixo y", choices = names(mtcars))
    ),
    mainPanel(
      plotOutput("plot")
    )
  )
)

server <- function(input, output) {
  output$plot <- renderPlot({
    plot(mtcars[, input$x], mtcars[, input$y])
  })
}

shinyApp(ui = ui, server = server)