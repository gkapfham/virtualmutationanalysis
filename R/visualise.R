#' FUNCTION: visualise_mutation_score
#'
#' Produces a visualisation shows the number of mutants in total and killed for the virtual mutation method and for the
#' time-constrained original approach
#' @export

visualise_mutation_score <- function(data) {
  p = ggplot2::ggplot(data,ggplot2::aes(x = score_type, y = score)) +
    ggplot2::geom_boxplot(outlier.size = 0.75, lwd=0.25) +
    ggplot2::theme_grey(base_size = 12) +
    ggplot2::theme(title = ggplot2::element_text(size=12)) +
    ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 45, hjust = 1, size=12)) +
    ggplot2::theme(axis.text.y = ggplot2::element_text(angle = 45, hjust = 1, size=12)) +
    ggplot2::xlab("Mutation Testing Technique") +
    ggplot2::ylab("Mutation Testing Score") +
    ggplot2::stat_summary(fun.y = mean, fill = "white", colour = "black", geom = "point", shape = 23, size = 1, show_guide = FALSE)
  return(p)
}

