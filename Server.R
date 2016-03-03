
require(shiny)
require(plotly)
require(dplyr)

#Store the data frame in a new data frame.
iris_df <- data.frame(iris)

shinyServer(function(input, output) {
  #Create an adjustable graph that depends on user input
  output$barchart <- renderPlotly({
    
    #filter the data based on user input for species
    species <- switch(input$species, 
                           "setosa" = iris_df %>% filter(Species == "setosa"),
                           "versicolor" = iris_df %>% filter(Species == "versicolor"),
                           "virginica" = iris_df %>% filter(Species == "virginica"))
    
    
    #select which width column
    x_axis <- switch(input$x, 
                    "Sepal Width" = species$Sepal.Width,
                    "Petal Width" = iris_df$Petal.Width)
    
    #select which length column
    y_axis <- switch(input$y, 
                    "Sepal Length" = species$Sepal.Length,
                    "Petal Length" = iris_df$Petal.Length)
    
    area <- x_axis * y_axis
    #basic plotly graph that swaps axis labels and displays area. 
    plot_ly(
      x = x_axis,
      y = y_axis,
      text = paste('Area: ', y_axis * x_axis),
      name = "Flower Graph",
      mode = "markers",
      size = (area / 2), #I couldn't figure out how to get this to not display in the hover...
      color = "red"
      #marker = list(color = toRGB("seagreen1"))
    ) %>%  
      layout(title = paste(input$x, "and", input$y), 
                  xaxis = list(title = paste(input$x )),
                  yaxis = list(title = paste(input$y)))
    
  })
}
)
