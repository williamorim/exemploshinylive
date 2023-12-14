library(shiny)

ui <- fluidPage(
  titlePanel("Eu não tenho servidor!! 🙀"),
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

# httpuv::runStaticServer("docs/")