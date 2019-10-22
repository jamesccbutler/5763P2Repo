
server <- function(input, output, session) { 
  
  data <- reactive({
    inFile <- input$file1
    if (is.null(inFile)) return(NULL)
    read.csv(inFile$datapath)
  })
  
  observeEvent(data(), {
    updateSelectInput(session, "col", choices = names(data()))
  })
  
  output$selected <- renderDataTable({
    a <- data()[input$col]
  })
  
}
