iatlas.modules::distributions_plot_server2(
  "distplot2",

  distplot_data = shiny::reactive(
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
        "dataset_name" = dplyr::if_else(
          (as.integer(.data$sample_name) %% 2) == 1,
          "iris1",
          "iris2"
        )
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

  dataset_data <- shiny::reactive(
    dplyr::tribble(
      ~dataset_name, ~dataset_display,
      "iris1",       "Iris 1",
      "iris2",       "Iris 2"
    )
  ),

  drilldown = shiny::reactive(T),
  distplot_xlab = shiny::reactive("Species")
)
