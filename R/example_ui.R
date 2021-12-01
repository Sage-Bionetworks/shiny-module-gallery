example_ui <- function(id){

  ns <- shiny::NS(id)

  shiny::tagList(
    shiny::fluidRow(
      shinydashboard::box(
        width = 12,
        background = "green",
        title = shiny::span(
          shiny::strong("Example 1"), style = "font-size:24px")
      ),
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
    )
  )

}
