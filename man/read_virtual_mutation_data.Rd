% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/read.R
\name{read_virtual_mutation_data}
\alias{read_virtual_mutation_data}
\title{FUNCTION: read_virtual_mutation_data}
\usage{
read_virtual_mutation_data()
}
\description{
Read the data file that contains the "virtual mutation" data. This is the data file that contains the data about
virtual mutation (i.e., mutation using a model of the DBMS). Note that it contains data for more schemas than can
actually be used in the AST 2016 paper submission; this is due to both the fact that we do not have time constrained
mutation for many of the schemas and because some schemas use multiple mutation pipelines.
}

