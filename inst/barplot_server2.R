iatlas.modules::barplot_server(
  "barplot2",

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
        dplyr::inner_join(
          dplyr::tribble(
            ~feature_class, ~feature_name,
            "Length",       "Sepal.Length",
            "Width",        "Sepal.Width",
            "Length",       "Petal.Length",
            "Width",        "Petal.Width",
          ),
          by = "feature_name"
        ) %>%
        dplyr::filter(.data$feature_class == .feature_class) %>%
        dplyr::select("sample_name", "feature_name", "feature_display", "feature_value", "group_name", "group_description")


    }
  ),

  feature_classes = shiny::reactive(c("Length", "Width")),
  barplot_xlab = shiny::reactive("Species"),
  drilldown = shiny::reactive(T)
)
