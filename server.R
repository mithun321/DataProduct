library(shiny)
hinches <- function(hft,hin)hft*12+hin
bmi <- function(h,w) round((w/h^2)*1549.84786,3)
bmistatus <- function(bmi){
  if(bmi<18.5){
    status = "Underweight, so eat more."
  } else if(bmi<25){
    status = "Normal, Congrats !"
  } else if(bmi< 30){
    status = "Overweight, so Exercise."
  } else{
    status = "Obese, see the Doctor."
  }
  return(status)
}
# Define server logic required to calculate BMI
shinyServer(function(input, output) {
  output$heightop <- renderText({paste0("Height: ",input$hf," feets and ",input$hin, " inches.")
  })
  output$weightop <- renderText({paste0("Weight: ",input$wkgs," Kgs")
  })
  output$bmi <- renderText({
    bmical<-bmi(hinches(input$hf,input$hin),input$wkgs)
    paste0("Based on the input, your BMI is: ",bmical," and you are considered ",bmistatus(bmical))
  })
  output$bmitable <- renderTable({
    data.frame(BMI=c("Below 18.5",">= 18.5 & < 25",">= 25.0 & < 30","Over 30"),
               Status=c("Underweight","Normal","Overweight","Obese"))
  },include.rownames=FALSE)
})