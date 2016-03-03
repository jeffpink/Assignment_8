
require(shiny)
require(plotly)

shinyUI(fluidPage(
  titlePanel("Iris Data Visualization"),
  
  #Create the side panel with 3 widgets the filter which information is being shown
  sidebarLayout(
    sidebarPanel(
      
      #Create 3 buttons that filter the data by species
      radioButtons("species", "Select Which Species of Flower",
                   c("Setosa" = "setosa",
                     "Versicolor" = "versicolor",
                     "Virginica" = "virginica")),
      
      #Filter the x axis of the graph by widths by the filtered species
      selectInput("x", 
                  label = "Select Which Width Filter",
                  choices = list("Sepal Width", "Petal Width"),
                  selected = "Sepal Width"),
      
      #Filter the y axis of the graph by legnths of the filtered species
      selectInput("y", 
                  label = "Select Which Length Filter",
                  choices = list("Sepal Length", "Petal Length"),
                  selected = "Sepal Length")
    ),
    
    #Plot graph in the main panel
    mainPanel(
      plotlyOutput('barchart')
    )
  )
))