example_server <- function(
  id,
  server_file,
  ui_file
) {
  shiny::moduleServer(
    id,
    function(input, output, session) {
      ns <- session$ns

      output$ui_text <- shiny::renderText(readr::read_file(ui_file))
      output$ui_element <- shiny::renderUI(source(ui_file, echo = F, local = T))

      output$server_text <- shiny::renderText(readr::read_file(server_file))
      source(server_file, echo = F, local = T)
    }
)}



