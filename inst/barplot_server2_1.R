iatlas.modules::barplot_server2(
  "barplot1",

  barplot_data = shiny::reactive(
    iris %>%
      dplyr::as_tibble() %>%
      dplyr::rename("group_name" = .data$Species) %>%
      dplyr::mutate(
        "sample_name" = as.character(1:dplyr::n()),
        "group_name"   = as.character(.data$group_name),
      ) %>%
      tidyr::pivot_longer(
        !c("group_name", "sample_name"),
        names_to = "feature_display",
        values_to = "feature_value"
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
