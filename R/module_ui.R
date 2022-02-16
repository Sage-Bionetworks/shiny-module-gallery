module_ui <- function(id, tab_name, example_module_ids, example_names){

  ns <- shiny::NS(id)

  shinydashboard::tabItem(
    tabName = tab_name,
    shiny::fluidRow(
      shinydashboard::box(
        shiny::htmlOutput(ns("text1")),
        title = "Server Documentation",
        solidHeader = TRUE,
        status = "primary",
        collapsible = TRUE
      ),
      shinydashboard::box(
        shiny::htmlOutput(ns("text2")),
        title = "UI Documentation",
        solidHeader = TRUE,
        status = "primary",
        collapsible = TRUE
      )
    ),
    purrr::map2(example_module_ids, example_names, ~example_ui(ns(.x), .y))
  )
}
