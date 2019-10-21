
server <- function(input, output, session) { 
  
  dataset <- reactive({
    req(input$file1)
    tryCatch(
      {
        df <- read.csv(input$file1$datapath,
                       header = input$header)
      },
      error = function(e) {
        # return a safeError if a parsing error occurs
        stop(safeError(e))
      }
    )
    df
  })
  
  output$contents <- renderDataTable({
    dataset()
  })
  
}
