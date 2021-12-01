iatlas.modules::distributions_plot_server(
  "distplot",
  plot_data_function = shiny::reactive({
    function(.feature){
      iatlas.modules2::pcawg_immune_subtype_cohort_obj$get_gene_values(entrez = as.integer(.feature)) %>%
        dplyr::select(
          "sample" = "sample_name",
          "group" = "group_short_name",
          "feature" = "hgnc",
          "feature_value" = "rna_seq_expr",
          "group_description" = "group_characteristics",
          "color" = "group_color"
        )
    }
  }),
  features = shiny::reactive({
    iatlas.api.client::query_immunomodulators() %>%
      dplyr::select(
        "feature_name" = "entrez",
        "feature_display" = "hgnc",
        "Gene Family" = "gene_family",
        "Gene Function" = "gene_function",
        "Immune Checkpoint" = "immune_checkpoint",
        "Super Category" = "super_category"
      )
  }),
  drilldown = shiny::reactive(T),
  distplot_xlab = shiny::reactive("Immune_Subtype"),
  scale_method_default = shiny::reactive("Log10"),
  feature_default = shiny::reactive("Petal.Length")
)
