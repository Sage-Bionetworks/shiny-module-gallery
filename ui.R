shinydashboard::dashboardPage(
    shinydashboard::dashboardHeader(),
    shinydashboard::dashboardSidebar(
        shinydashboard::sidebarMenu(
            shinydashboard::menuItem(
                shinydashboard::menuSubItem(
                    text = "Distributions Plot",
                    tabName = "distributions_plot",
                    icon = shiny::icon("cog")
                ),
                shinydashboard::menuSubItem(
                    text = "Barplot",
                    tabName = "barplot",
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
                id = "distributions_plot",
                tab_name = "distributions_plot",
                example_module_ids = c("example_1", "example_2"),
                example_names = c("Example1", "Example2")
            ),
            module_ui(
                id = "barplot",
                tab_name = "barplot",
                example_module_ids = c("example_1", "example_2"),
                example_names = c("Example1", "Example2")
            )
        )
    )
)

