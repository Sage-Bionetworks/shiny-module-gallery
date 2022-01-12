
function(input, output) {

    library(magrittr)

    module_server(
        id = "distributions_plot",
        server_function_name = "distributions_plot_server",
        ui_function_name = "distributions_plot_ui",
        example_module_ids = c("example_1", "example_2"),
        example_server_files = c(
            "inst/distributions_plot_server1.R",
            "inst/distributions_plot_server2.R"
        ),
        example_ui_files = c(
            "inst/distributions_plot_ui1.R",
            "inst/distributions_plot_ui2.R"
        )
    )

    module_server(
        id = "barplot",
        server_function_name = "barplot_server",
        ui_function_name = "barplot_ui",
        example_module_ids = c("example_1", "example_2"),
        example_server_files = c(
            "inst/barplot_server1.R",
            "inst/barplot_server2.R"
        ),
        example_ui_files = c(
            "inst/barplot_ui1.R",
            "inst/barplot_ui2.R"
        )
    )

    module_server(
        id = "heatmap",
        server_function_name = "heatmap_server",
        ui_function_name = "heatmap_ui",
        example_module_ids = c("example_1"),
        example_server_files = c(
            "inst/heatmap_server1.R"
        ),
        example_ui_files = c(
            "inst/heatmap_ui1.R"
        )
    )
}
