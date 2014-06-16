library(shiny)

shinyUI(fluidPage(
  # Application title
  titlePanel("Calculate your BMI and understand what it means for you"),
  p("Instructions:  To calculate your Body Mass Index (BMI), enter your height 
and weight in the right hand side panel.  There are three input fields, two for your 
height in feet and inches, and another for your weight in Kgs.  After entering 
the required information, press the 'Calculate your BMI' button at the bottom. 
You will get your BMI as well as what does it mean for you.
The calculator comes with pre-set values of height of 5 feets 10 inches and 
weight of 70 Kgs."),
  br(),
  # Sidebar with a three text inputs
  sidebarLayout(position = "right",
      sidebarPanel(
      h2('Enter your Height and Weight:'),
      h3('Weight'),
      numericInput("wkgs", label = h4("Kgs"),max=150,min=2, value = 70),
      h3('Height'),
      numericInput("hf", label = h4("feet"),max=8,min=1, value = 5),
      numericInput("hin", label = h4("inches"),max=11,min=0, value = 10),
     
      submitButton('Calculate your BMI')
),
mainPanel(
  h3('You entered the following information:'),
  h5(textOutput("heightop")),
  h5(textOutput("weightop")),
  br(),
  h3('Calculated Body Mass Index:'),
  h4(textOutput("bmi")),
  br(),
  h4('Table to interpret BMI:'),
  tableOutput("bmitable")
  )
 )
))