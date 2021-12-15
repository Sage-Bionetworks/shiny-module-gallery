iatlas.modules::barplot_server(
  "barplot2",

  plot_data_function = shiny::reactive(
    function(.feature_class){
      iris %>%
        dplyr::as_tibble() %>%
        dplyr::mutate("sample" = as.character(1:dplyr::n())) %>%
        tidyr::pivot_longer(
          !c("Species", "sample"),
          names_to = "feature",
          values_to = "feature_value"
        ) %>%
        dplyr::rename("group" = "Species") %>%
        dplyr::mutate(
          "group_description" = stringr::str_c("Iris Species: ", .data$group),
        ) %>%
        dplyr::inner_join(
          dplyr::tribble(
            ~feature_class, ~feature_name,
            "Length",       "Sepal.Length",
            "Width",        "Sepal.Width",
            "Length",       "Petal.Length",
            "Width",        "Petal.Width",
          ),
          by = c("feature" = "feature_name")
        ) %>%
        dplyr::filter(.data$feature_class == .feature_class)

    }
  ),

  feature_classes = shiny::reactive(c("Length", "Width")),
  barplot_xlab = shiny::reactive("Species"),
  drilldown = shiny::reactive(T)
)
