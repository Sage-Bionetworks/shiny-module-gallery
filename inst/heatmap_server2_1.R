iatlas.modules::heatmap_server2(
  "heatmap1",

  heatmap_data = shiny::reactive(
    dplyr::inner_join(

      iris %>%
        dplyr::as_tibble() %>%
        dplyr::rename("group_name" = .data$Species) %>%
        dplyr::mutate("sample_name"  = as.character(1:dplyr::n())) %>%
        tidyr::pivot_longer(
          !c("group_name", "sample_name"),
          names_to = "feature_display",
          values_to = "feature_value"
        ) %>%
        dplyr::mutate(
          "group_name"   = as.character(.data$group_name),
          "dataset_name" = "Iris"
        ),

      iris %>%
        dplyr::as_tibble() %>%
        dplyr::select("response_value" = "Sepal.Length") %>%
        dplyr::mutate(
          "sample_name"  = as.character(1:dplyr::n()),
          "response_display" = "Sepal.Length"
        ),

      by = "sample_name"
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
        "group_description" = stringr::str_c("Iris Species: ", .data$group_name)
      )
  ),
  drilldown = shiny::reactive(T)
)

