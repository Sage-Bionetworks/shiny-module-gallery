iatlas.modules::distributions_plot_server(
  "distplot1",

  plot_data_function = shiny::reactive(
    function(.feature){
      iris %>%
        dplyr::as_tibble() %>%
        dplyr::mutate("sample_name" = as.character(1:dplyr::n())) %>%
        tidyr::pivot_longer(
          !c("Species", "sample_name"),
          names_to = "feature_name",
          values_to = "feature_value"
        ) %>%
        dplyr::rename("group_name" = "Species") %>%
        dplyr::inner_join(
          dplyr::tribble(
            ~group_name,  ~group_color,
            "setosa",     "#FF0000",
            "versicolor", "#0000FF",
            "virginica",  "#FFFF00"
          ),
          by = "group_name"
        ) %>%
        dplyr::mutate(
          "group_description" = stringr::str_c("Iris Species: ", .data$group_name),
          "feature_display" = .data$feature_name
        ) %>%
        dplyr::select("sample_name", "feature_name", "feature_display", "feature_value", "group_name", "group_color", "group_description")
    }
  ),


  drilldown = shiny::reactive(T),
  distplot_xlab = shiny::reactive("Species")
)
