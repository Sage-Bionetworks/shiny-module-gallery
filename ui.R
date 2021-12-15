shinydashboard::dashboardPage(
    shinydashboard::dashboardHeader(),
    shinydashboard::dashboardSidebar(
        shinydashboard::sidebarMenu(
            shinydashboard::menuItem(
                shinydashboard::menuSubItem(
                    text = "Distributions Plot",
                    tabName = "distplot",
                    icon = shiny::icon("cog")
                ),
                shinydashboard::menuSubItem(
                    text = "Barchart",
                    tabName = "barchart",
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
                tab_name = "distplot",
                example_module_ids = c("example_1", "example_2"),
                example_names = c("Example1", "Example2")
            ),
            shinydashboard::tabItem(
                tabName = "barchart",
                shiny::fluidRow()
            )
        )
    )
)

