iatlas.modules::barplot_server(
  "barplot1",

  plot_data_function = shiny::reactive(
    function(.feature_class){
      iris %>%
        dplyr::as_tibble() %>%
        dplyr::mutate("sample_name" = as.character(1:dplyr::n())) %>%
        tidyr::pivot_longer(
          !c("Species", "sample_name"),
          names_to = "feature_name",
          values_to = "feature_value"
        ) %>%
        dplyr::rename("group_name" = "Species") %>%
        dplyr::mutate(
          "group_description" = stringr::str_c("Iris Species: ", .data$group_name),
          "feature_display" = .data$feature_name
        ) %>%
        dplyr::select("sample_name", "feature_name", "feature_display", "feature_value", "group_name", "group_description")
    }
  ),

  drilldown = shiny::reactive(T),
  barplot_xlab = shiny::reactive("Species"),
  barplot_ylab = shiny::reactive("Height")
)
