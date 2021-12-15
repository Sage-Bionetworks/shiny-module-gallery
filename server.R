
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
}
