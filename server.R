
function(input, output) {

  synapseclient <- reticulate::import("synapseclient", delay_load = TRUE)
  syn <- synapseclient$Synapse()
  syn$login()

  library(magrittr)

  module_server(
    id = "barplot",
    server_function_name = "barplot_server",
    ui_function_name = "barplot_ui",
    example_module_ids = c("example_1", "example_2"),
    example_server_files = c(
      "inst/barplot_server_1.R",
      "inst/barplot_server_2.R"
    ),
    example_ui_files = c(
      "inst/barplot_ui_1.R",
      "inst/barplot_ui_2.R"
    )
  )

  module_server(
    id = "barplot2",
    server_function_name = "barplot_server2",
    ui_function_name = "barplot_ui2",
    example_module_ids = c("example_1"),
    example_server_files = c(
      "inst/barplot_server2_1.R"
    ),
    example_ui_files = c(
      "inst/barplot_ui2_1.R"
    )
  )

  module_server(
    id = "distributions_plot",
    server_function_name = "distributions_plot_server",
    ui_function_name = "distributions_plot_ui",
    example_module_ids = c("example_1", "example_2", "example_3"),
    example_server_files = c(
      "inst/distributions_plot_server_1.R",
      "inst/distributions_plot_server_2.R",
      "inst/distributions_plot_server_3.R"
    ),
    example_ui_files = c(
      "inst/distributions_plot_ui_1.R",
      "inst/distributions_plot_ui_2.R",
      "inst/distributions_plot_ui_3.R"
    )
  )

  module_server(
    id = "distributions_plot2",
    server_function_name = "distributions_plot_server2",
    ui_function_name = "distributions_plot_ui2",
    example_module_ids = c("example_1", "example_2"),
    example_server_files = c(
      "inst/distributions_plot_server2_1.R",
      "inst/distributions_plot_server2_2.R"
    ),
    example_ui_files = c(
      "inst/distributions_plot_ui2_1.R",
      "inst/distributions_plot_ui2_2.R"
    )
  )

  module_server(
    id = "heatmap",
    server_function_name = "heatmap_server",
    ui_function_name = "heatmap_ui",
    example_module_ids = c("example_1"),
    example_server_files = c(
      "inst/heatmap_server_1.R"
    ),
    example_ui_files = c(
      "inst/heatmap_ui_1.R"
    )
  )

  module_server(
    id = "heatmap2",
    server_function_name = "heatmap_server2",
    ui_function_name = "heatmap_ui2",
    example_module_ids = c("example_1"),
    example_server_files = c(
      "inst/heatmap_server2_1.R"
    ),
    example_ui_files = c(
      "inst/heatmap_ui2_1.R"
    )
  )
}
