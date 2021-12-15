module_server <- function(
  id,
  server_function_name,
  ui_function_name,
  example_module_ids,
  example_server_files,
  example_ui_files
) {
  shiny::moduleServer(
    id,
    function(input, output, session) {
      ns <- session$ns

      output$text1 <- shiny::renderText(
        document_to_html(server_function_name)
      )

      output$text2 <- shiny::renderText(
        document_to_html(ui_function_name)
      )

      purrr::pmap(
        list(example_module_ids, example_server_files, example_ui_files),
        example_server
      )

    }
  )}
