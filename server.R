
function(input, output) {

    library(magrittr)

    # documentation

    output$text1 <- shiny::renderText ({

        temp = tools::Rd2HTML(
            gbRd::Rd_fun("distributions_plot_server"),
            out = tempfile("docs")
        )
        content = readr::read_file(temp)
        file.remove(temp)
        content
    })

    output$text2 <- shiny::renderText ({

        temp = tools::Rd2HTML(
            gbRd::Rd_fun("distributions_plot_ui"),
            out = tempfile("docs")
        )
        content = readr::read_file(temp)
        file.remove(temp)
        content
    })

    example_server(
        "distributions_plot_1",
        "inst/distributions_plot_server1.R",
        "inst/distributions_plot_ui1.R"
    )

}
