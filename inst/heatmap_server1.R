iatlas.modules::heatmap_server(
  "heatmap1",
  feature_classes = shiny::reactive(c("Length", "Width")),
  response_features = shiny::reactive(
    c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width")
  ),

  feature_data_function = shiny::reactive(
    function(.feature_class){
      print(.feature_class)
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
        dplyr::inner_join(
          dplyr::tribble(
            ~feature_class, ~feature_name,   ~feature_order,
            "Length",       "Sepal.Length",  1,
            "Width",        "Sepal.Width",   2,
            "Length",       "Petal.Length",  3,
            "Width",        "Petal.Width",   4
          ),
          by = "feature_name"
        ) %>%
        dplyr::filter(.data$feature_class == .feature_class) %>%
        dplyr::select("sample_name", "feature_name", "feature_display", "feature_value", "feature_order", "group_name", "group_color", "group_description") %>%
        print()
    }
  ),

  response_data_function = shiny::reactive(
    function(.feature){
      print(.feature)
      iris %>%
        dplyr::as_tibble() %>%
        dplyr::mutate("sample_name" = as.character(1:dplyr::n())) %>%
        tidyr::pivot_longer(
          !c("Species", "sample_name"),
          names_to = "feature_name",
          values_to = "feature_value"
        ) %>%
        dplyr::mutate("feature_display" = .data$feature_name) %>%
        dplyr::filter(.data$feature_name == .feature) %>%
        dplyr::select("sample_name", "feature_name", "feature_display", "feature_value") %>%
        print()
    }
  ),

  drilldown = shiny::reactive(T)
)
