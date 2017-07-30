#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(stringr)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("MATLIB"),
  
   sidebarLayout(
     sidebarPanel(
         textInput("1NOUN", "Noun:"),
         textInput("2NOUN", "Noun:"),
         textInput("3NOUN", "Noun:"),
         textInput("4VERB", "Verb:"),
         textInput("5VERB", "Verb:"),
         textInput("6NOUN", "Noun:"),
         textInput("7NOUN", "Noun:"),
         textInput("8ADJ", "Adjective:"),
         textInput("9NOUNPL", "Plural Noun:"),
         textInput("10ADJ", "Adjective:"),
         textInput("11NOUN", "Noun:"),
         textInput("12ADJ", "Adjective:"),
         textInput("13NOUN", "Noun:"),
         submitButton("Go!")
     ),
     mainPanel(
       textOutput("matlib")
     )
   )
)


# Define server logic required to draw a histogram
server <- function(input, output) {
  matlab <- "Millions of $1NOUN and $2NOUN worldwide use MAT$3NOUN to 
  $4VERB and $5VERB the systems and $6NOUN transforming our world. 
  The matrix-based MAT$7NOUN language is the world's most $8ADJ way to express 
  computational $9NOUNPL. $10ADJ graphics make it easy to visualize and 
  gain insights from $11NOUN The $12ADJ environment invites experimentation, 
  exploration, and $13NOUN"

  # this is terrible, i'm sorry
  output$matlib <- renderText({
    acc <- ""
    textinputs <- names(input)
    for (i in 1:length(textinputs)){
      matlab <- str_replace(matlab, paste0("\\$", textinputs[i]), input[[textinputs[i]]])
    }
    paste0(matlab)
  })
}

# Run the application 
shinyApp(ui = ui, server = server)

