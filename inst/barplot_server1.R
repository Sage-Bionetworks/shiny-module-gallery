iatlas.modules::barplot_server(
  "barplot1",

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
        )
    }
  ),

  drilldown = shiny::reactive(T),
  barplot_xlab = shiny::reactive("Species"),
  barplot_ylab = shiny::reactive("Height")
)
