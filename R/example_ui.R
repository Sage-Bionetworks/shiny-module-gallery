example_ui <- function(id, example_name){

  ns <- shiny::NS(id)

  shinydashboard::box(
    shiny::fluidRow(
      shinydashboard::box(
        shiny::verbatimTextOutput(ns("server_text")),
        title = "Server Function Call"
      ),
      shinydashboard::box(
        shiny::verbatimTextOutput(ns("ui_text")),
        title = "UI Function Call"
      )
    ),
    shiny::fluidRow(
      shinydashboard::box(
        shiny::uiOutput(ns("ui_element")),
        width = 12,
        title = "Module Output"
      )
    ),
    width = 12,
    title = example_name,
    solidHeader = TRUE,
    status = "success",
    collapsible = TRUE
  )

}
