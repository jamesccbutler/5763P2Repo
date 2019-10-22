library(shinydashboard)
library(shiny)


dashboardPage(
  #App Header
  dashboardHeader(title = "My app"),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("The Twitter", icon = icon("dashboard"),tabName = "part1"),
      menuItem("Load dataset", icon = icon("th"), tabName = "part2")
    )
  ),
  
  dashboardBody(
    
    tabItems(
      tabItem( tabName ="part1", 
               h3("twitter")
      ),
      
      tabItem( tabName ="part2", 
               sidebarLayout(
                 sidebarPanel(
                   fileInput("file1", "Upload CSV File",
                             multiple = FALSE,
                             accept = c("text/csv",
                                        "text/comma-separated-values,text/plain",
                                        ".csv")),
                   selectInput('col', 'select column', ""),                   tags$hr(),
                   # Input: Checkbox if file has header ----
                   checkboxInput("header", "Header", TRUE),
                   tags$hr()),
                 
                 # Main panel for displaying outputs ----
                 mainPanel(
                   dataTableOutput("selected")
                 ))
      )
    )
  ))

