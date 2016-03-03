
require(shiny)
require(plotly)

shinyUI(fluidPage(
  titlePanel("Iris Data Visualization"),
  
  #Sidepanel with 3 widgets
  sidebarLayout(
    sidebarPanel(
      
      #Create 3 buttons that filters the data by species
      radioButtons("species", "Select Which Species of Flower",
                   c("Setosa" = "setosa",
                     "Versicolor" = "versicolor",
                     "Virginica" = "virginica")),
      
      #Filter the x axis of the graph by widths of species
      selectInput("x", 
                  label = "Select Which Width Filter",
                  choices = list("Sepal Width", "Petal Width"),
                  selected = "Sepal Width"),
      
      #Filter the y axis of the graph by lengths of species
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