library(shiny)

ui <- fluidPage(
  h2("Eu não tenho servidor!!", style = "color: purple;"),
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
