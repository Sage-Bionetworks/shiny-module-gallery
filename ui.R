shinydashboard::dashboardPage(
    shinydashboard::dashboardHeader(),
    shinydashboard::dashboardSidebar(
        # This extends the light blue color of the body all the way down the page.
        tags$head(tags$style(HTML('.content-wrapper { overflow: auto; }'))),
        shinydashboard::sidebarMenu(
            shinydashboard::menuItem(
                shinydashboard::menuSubItem(
                    text = "Barplot",
                    tabName = "barplot",
                    icon = shiny::icon("cog")
                ),
                shinydashboard::menuSubItem(
                    text = "Barplot2",
                    tabName = "barplot2",
                    icon = shiny::icon("cog")
                ),
                shinydashboard::menuSubItem(
                    text = "Distributions Plot",
                    tabName = "distributions_plot",
                    icon = shiny::icon("cog")
                ),
                shinydashboard::menuSubItem(
                    text = "Distributions Plot2",
                    tabName = "distributions_plot2",
                    icon = shiny::icon("cog")
                ),
                shinydashboard::menuSubItem(
                    text = "Heatmap",
                    tabName = "heatmap",
                    icon = shiny::icon("cog")
                ),
                shinydashboard::menuSubItem(
                    text = "Heatmap2",
                    tabName = "heatmap2",
                    icon = shiny::icon("cog")
                ),
                text = "iAtlas Modules",
                icon = shiny::icon("chart-bar"),
                startExpanded = TRUE
            ),
            shinydashboard::menuItem(
                text = "Project Live Modules",
                icon = shiny::icon("chart-bar"),
                startExpanded = TRUE
            )
        )
    ),
    shinydashboard::dashboardBody(
        shinydashboard::tabItems(
            module_ui(
                id = "barplot",
                tab_name = "barplot",
                example_module_ids = c("example_1", "example_2"),
                example_names = c("Example1", "Example2")
            ),
            module_ui(
                id = "barplot2",
                tab_name = "barplot2",
                example_module_ids = c("example_1"),
                example_names = c("Example1")
            ),
            module_ui(
                id = "distributions_plot",
                tab_name = "distributions_plot",
                example_module_ids = c("example_1", "example_2", "example_3"),
                example_names = c("Example1", "Example2", "Example3")
            ),
            module_ui(
                id = "distributions_plot2",
                tab_name = "distributions_plot2",
                example_module_ids = c("example_1", "example_2"),
                example_names = c("Example1", "Example2")
            ),
            module_ui(
                id = "heatmap",
                tab_name = "heatmap",
                example_module_ids = c("example_1"),
                example_names = c("Example1")
            ),
            module_ui(
                id = "heatmap2",
                tab_name = "heatmap2",
                example_module_ids = c("example_1"),
                example_names = c("Example1")
            )
        )
    )
)

