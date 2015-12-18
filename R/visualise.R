#' FUNCTION: visualise_mutation_score_time_constrained
#'
#' Produces a visualisation shows the number of mutants in total and killed for the virtual mutation method and for the
#' time-constrained original approach
#' @export

visualise_mutation_score_time_constrained <- function(data) {
  p = ggplot2::ggplot(data,ggplot2::aes(x = schema, y = score)) +
    ggplot2::facet_grid(score_type~dbms, labeller = ggplot2::label_parsed) +
    ggplot2::geom_boxplot(outlier.size = 0.75, lwd = 0.25) +
    ggplot2::theme_grey(base_size = 6) +
    ggplot2::theme(title = ggplot2::element_text(size=6)) +
    ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 45, hjust = 1, size = 4)) +
    ggplot2::theme(axis.text.y = ggplot2::element_text(angle = 45, hjust = 1, size = 4)) +
    ggplot2::xlab("Database Schema") +
    ggplot2::ylab("Mutation Testing Score") +
    ggplot2::stat_summary(fun.y = mean, fill = "white", colour = "black", geom = "point", shape = 23, size = 1, show.legend = FALSE)
  return(p)
}

#' FUNCTION: visualise_save_graphic
#'
#' Saves the provided graphic to the provided name.
#' @export

visualise_save_graphic <- function(save_name, save_plot) {
  ggplot2::ggsave(save_name, save_plot, height=5, width=8)
}

