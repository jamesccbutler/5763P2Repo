
server <- function(input, output, session) { 
  
  observe({
    # Run whenever reset button is pressed
    input$reset
    output$twitter <- renderDT({
      tweets <- userTimeline("realDonaldTrump", n = 50)
      tweets.df <- twListToDF(tweets)
      tweets.df[1,c(1,3,5,10,11)]
    })
  })
  
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
