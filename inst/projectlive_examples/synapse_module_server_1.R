data <- projectliveModules::synapse_module_server(
  id = "synapse_module1",
  syn = syn,
  config = shiny::reactive(
    list(
      "text" =  "Example text.",
      "data_files" = list(
        "files" = list(
          "synapse_id" = "syn24172462"
        ),
        "datasets" = (
          "synapse_id" = "syn24173640"
        ),
        "publications" = (
          "synapse_id" = "syn24172464"
        ),
        "studies" = (
          "synapse_id" = "syn24172465"
        ),
        "tools" = (
          "synapse_id" = "syn24172466"
        )
      )
    )
  )
)
