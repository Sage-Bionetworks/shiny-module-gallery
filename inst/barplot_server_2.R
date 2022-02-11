iatlas.modules::barplot_server(
  "barplot2",

  sample_data_function = shiny::reactive(
    function(.feature_class){
      iris %>%
        dplyr::as_tibble() %>%
        dplyr::rename("group_name" = .data$Species) %>%
        dplyr::mutate(
          "sample_name" = as.character(1:dplyr::n()),
          "group_name"   = as.character(.data$group_name),
        ) %>%
        tidyr::pivot_longer(
          !c("group_name", "sample_name"),
          names_to = "feature_name",
          values_to = "feature_value"
        ) %>%
        dplyr::mutate(
          "feature_display" = stringr::str_replace(.data$feature_name, "\\.", " "),
          "feature_class" = stringr::str_extract(.data$feature_name, "([[:alpha:]]+)"),
        ) %>%
        dplyr::filter(.data$feature_class == .feature_class) %>%
        dplyr::select(
          "group_name", "sample_name", "feature_name", "feature_value"
        )
    }
  ),

  feature_data = shiny::reactive(
    iris %>%
      dplyr::as_tibble() %>%
      dplyr::mutate("sample_name" = as.character(1:dplyr::n())) %>%
      tidyr::pivot_longer(
        !c("Species", "sample_name"),
        names_to = "feature_name",
        values_to = "feature_value"
      ) %>%
      dplyr::select("feature_name") %>%
      dplyr::distinct() %>%
      dplyr::mutate(
        "feature_display" = stringr::str_replace(.data$feature_name, "\\.", " "),
        "feature_class" = stringr::str_extract(.data$feature_name, "([[:alpha:]]+)"),
      )
  ),

  group_data = shiny::reactive(
    iris %>%
      dplyr::as_tibble() %>%
      dplyr::select("group_name" = "Species") %>%
      dplyr::distinct() %>%
      dplyr::mutate(
        "group_name" = as.character(.data$group_name),
        "group_display" = stringr::str_to_title(.data$group_name),
        "group_description" = stringr::str_c("Iris Species: ", .data$group_name),
      )
  ),

  drilldown = shiny::reactive(T),
  barplot_xlab = shiny::reactive("Species"),
  barplot_ylab = shiny::reactive("Height")
)

