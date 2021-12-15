iatlas.modules::distributions_plot_server(
  "distplot2",

  plot_data_function = shiny::reactive(
    function(.feature){
      iris %>%
        dplyr::as_tibble() %>%
        dplyr::mutate("sample" = as.character(1:dplyr::n())) %>%
        tidyr::pivot_longer(
          !c("Species", "sample"),
          names_to = "feature",
          values_to = "feature_value"
        ) %>%
        dplyr::filter(.data$feature == .feature) %>%
        dplyr::rename("group" = "Species") %>%
        dplyr::inner_join(
          dplyr::tribble(
            ~group,       ~color,
            "setosa",     "#FF0000",
            "versicolor", "#0000FF",
            "virginica",  "#FFFF00"
          ),
          by = "group"
        ) %>%
        dplyr::mutate(
          "group_description" = stringr::str_c("Iris Species: ", .data$group),
        )
    }
  ),

  features = shiny::reactive(
    dplyr::tribble(
      ~`Class 1`, ~feature_name,   ~`Class 2`, ~feature_display,
      "Length",   "Sepal.Length",  "Sepal",     "Sepal Length",
      "Width",    "Sepal.Width",   "Sepal",     "Sepal Width",
      "Length",   "Petal.Length",  "Petal",     "Petal Length",
      "Width",    "Petal.Width",   "Petal",     "Petal Width"
    )
  ),
  drilldown = shiny::reactive(T),
  distplot_xlab = shiny::reactive("Species")
)
