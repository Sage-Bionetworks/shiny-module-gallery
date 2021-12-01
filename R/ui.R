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
            shinydashboard::tabItem(
                tabName = "distplot",
                shiny::fluidRow(
                    shinydashboard::box(
                        shiny::htmlOutput("text1"),
                        title = "Server Documentation"
                    ),
                    shinydashboard::box(
                        shiny::htmlOutput("text2"),
                        title = "UI Documentation"
                    )
                ),
                example_ui("distributions_plot_1")
            ),
            shinydashboard::tabItem(
                tabName = "barchart",
                shiny::fluidRow()
            )
        )
    )
)

