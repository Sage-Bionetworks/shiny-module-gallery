data <- projectliveModules::summary_snapshot_module_server(
  id = "summary_snapshot_module1",
  data = shiny::reactive(
    list(
      "tables" = list(
        "files"        = readRDS("inst/projectlive_rds/csbc_files.rds"),
        "publications" = readRDS("inst/projectlive_rds/csbc_publications.rds"),
        "studies"      = readRDS("inst/projectlive_rds/csbc_studies.rds"),
        "tools"        = readRDS("inst/projectlive_rds/csbc_tools.rds")
      )
    )
  ),
  config = shiny::reactive(
    jsonlite::read_json("inst/projectlive_json/csbc_summary_snapshot_module.json")
  )
)
