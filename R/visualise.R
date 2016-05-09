#' FUNCTION: visualise_mutation_score_time_constrained
#'
#' Produces a visualisation shows the number of mutants in total and killed for the virtual mutation method and for the
#' time-constrained original approach
#' @export

visualise_mutation_score_time_constrained <- function(data) {
  p <- ggplot2::ggplot(data,ggplot2::aes(x = schema, y = score)) +
    ggplot2::facet_grid(dbms~score_type, labeller = ggplot2::label_parsed) +
    ggplot2::geom_boxplot(outlier.size = 0.75, lwd = 0.25) +
    ggplot2::theme_grey(base_size = 6) +
    ggplot2::theme(title = ggplot2::element_text(size=6)) +
    ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 45, hjust = 1, size = 5)) +
    ggplot2::theme(axis.text.y = ggplot2::element_text(angle = 45, hjust = 1, size = 5)) +
    ggplot2::xlab("Database Schema") +
    ggplot2::ylab("Mutation Score") +
    ggplot2::stat_summary(fun.y = mean, fill = "white", colour = "black", geom = "point", shape = 23, size = 1, show.legend = FALSE)
  return(p)
}

#' FUNCTION: visualise_mutation_score_time_constrained_color
#'
#' Produces a visualisation shows the number of mutants in total and killed for the virtual mutation method and for the
#' time-constrained original approach. Color version of the graph.
#' @export

visualise_mutation_score_time_constrained_color <- function(data) {
  p <- ggplot2::ggplot(data,ggplot2::aes(x = schema, y = score, fill = score_type, color=score_type)) +
    ggplot2::facet_grid(dbms~score_type, labeller = ggplot2::label_parsed) +
    ggplot2::geom_boxplot(outlier.size = 0.75, lwd = 0.25) +
    ggplot2::theme_bw(base_size = 8) +
    ggplot2::theme(title = ggplot2::element_text(size=6)) +
    ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 45, hjust = 1, size = 6)) +
    ggplot2::theme(axis.text.y = ggplot2::element_text(angle = 45, hjust = 1, size = 6)) +
    ggplot2::theme(strip.background = element_blank(), panel.border = element_rect(colour = "black")) +
    ggplot2::scale_fill_brewer(palette="Set2", guide=FALSE) +
    ggplot2::scale_color_brewer(palette="Set2", guide=FALSE) +
    ggplot2::xlab("Database Schema") +
    ggplot2::ylab("Mutation Score")
  return(p)
}

#' FUNCTION: visualise_mutation_totals_time_constrained
#'
#' Produces a visualisation shows the number of mutants in total and killed for the virtual mutation method and for the
#' time-constrained original approach
#' @export

visualise_mutation_totals_time_constrained <- function(data) {
  p <- ggplot2::ggplot(data,ggplot2::aes(x = schema, y = total, fill=total_type)) +
    ggplot2::facet_grid(~dbms, labeller = ggplot2::label_parsed) +
    ggplot2::geom_bar(stat="identity", position="dodge") +
    ggplot2::theme_grey(base_size = 6) +
    ggplot2::scale_fill_grey(start = .2, end = .5, name="") +
    ggplot2::theme(title = ggplot2::element_text(size=6), legend.position = "top") +
    ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 45, hjust = 1, size = 5)) +
    ggplot2::theme(axis.text.y = ggplot2::element_text(angle = 45, hjust = 1, size = 5)) +
    ggplot2::xlab("Database Schema") +
    ggplot2::ylab("Total Number of Mutants")
  return(p)
}

#' FUNCTION: visualise_mutation_time_original
#'
#' Visualize the execution time of the original mutation analysis technique.
#' @export

visualise_mutation_time_original_virtual <- function(data) {
  p <- ggplot2::ggplot(data,ggplot2::aes(x = schema, y = mutationanalysistime)) +
    ggplot2::facet_grid(dbms~technique, labeller = ggplot2::label_parsed) +
    ggplot2::geom_boxplot(outlier.size = 0.75, lwd = 0.25) +
    ggplot2::scale_y_log10() +
    ggplot2::theme_grey(base_size = 6) +
    ggplot2::theme(title = ggplot2::element_text(size=6)) +
    ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 45, hjust = 1, size = 5)) +
    ggplot2::theme(axis.text.y = ggplot2::element_text(angle = 45, hjust = 1, size = 5)) +
    ggplot2::xlab("Database Schema") +
    ggplot2::ylab("Mutation Analysis Time (Log Transformed)") +
    ggplot2::stat_summary(fun.y = mean, fill = "white", colour = "black", geom = "point", shape = 23, size = 1, show.legend = FALSE)
  return(p)
}

#' FUNCTION: visualise_savings_and_mutants
#'
#' Visualize the time savings with respect to the total number of mutants analysed.
#' @export

visualise_savings_and_mutants <- function(data) {
  p <- ggplot2::ggplot(data, ggplot2::aes(x = mutantcount, y = saving_percent*100, shape = dbms)) +
    ggplot2::geom_point(size = 2) +
    ggplot2::ylab("Percentage of Mean Time Saved") +
    ggplot2::xlab("Number of Mutants") +
    ggplot2::scale_shape(guide = ggplot2::guide_legend(title = ""), solid = FALSE) +
    ggplot2::theme_grey(base_size = 6) +
    ggplot2::theme(title = ggplot2::element_text(size=6), legend.position = "top")
  return(p)
}

#' FUNCTION: visualise_savings_and_mutants_color
#'
#' Visualize the time savings with respect to the total number of mutants analysed, color version.
#' @export

visualise_savings_and_mutants_color <- function(data) {
  p <- ggplot2::ggplot(data, ggplot2::aes(x = mutantcount, y = saving_percent*100, shape = dbms)) +
    ggplot2::geom_point(size = 2) +
    ggplot2::ylab("Percentage of Mean Time Saved") +
    ggplot2::xlab("Number of Mutants") +
    ggplot2::scale_shape(guide = ggplot2::guide_legend(title = ""), solid = FALSE) +
    ggplot2::theme_grey(base_size = 6) +
    ggplot2::theme(title = ggplot2::element_text(size=6), legend.position = "top")
  return(p)
}

#' FUNCTION: visualise_savings_and_tests
#'
#' Visualize the time savings with respect to the total number of tests that must be run.
#' @export

visualise_savings_and_tests <- function(data) {
  p <- ggplot2::ggplot(data, ggplot2::aes(x = testcount, y = saving_percent*100, shape = dbms)) +
    ggplot2::geom_point(size = 2) +
    ggplot2::ylab("Percentage of Mean Time Saved") +
    ggplot2::xlab("Number of Tests") +
    ggplot2::scale_shape(guide = ggplot2::guide_legend(title = ""), solid = FALSE) +
    ggplot2::theme_grey(base_size = 6) +
    ggplot2::theme(title = ggplot2::element_text(size=6), legend.position = "top")
    # since there are a smaller number of data points, it is acceptable to have a single graph
    # ggplot2::facet_wrap(~dbms, scales = "free_y")
  return(p)
}

#' FUNCTION: visualise_save_graphic
#'
#' Saves the provided graphic to the provided name.
#' @export

visualise_save_graphic <- function(save_name, save_plot) {
  ggplot2::ggsave(save_name, save_plot, height=5, width=8)
}

