# virtualmutationanalysis

This repository contains the replication package for a research paper that was accepted for publication at the [Eleventh
International Workshop on Automation of Software Test](http://tech.brookes.ac.uk/AST2016/) (AST 2016). In particular,
this repository contains an R package that was implemented with the [devtools](http://github.com/hadley/devtools)
package development framework.

This R package contains all of the data sets that are presented in a polished form in our AST 2016 paper.  It also
provides all of the R source code to read in and summarize the data sets, perform the necessary data manipulations,
statistically analyze the results, and create the final summary tables and data visualizations. As a way to mitigate the
threats to the validity of the experimental results presented in the AST 2016 paper, the R package comes with a test
suite for all of these functions.

You are invited to use this repository to replicate the experimental results presented in the AST 2016 paper. In
addition, you can use the provide data and functions to conduct new analyses and experiments.  If you find this
replication package useful, could I trouble you to star this repository and then acknowledge it in your own research
efforts?  If you would like to learn more about my research program and cite the AST 2016 paper, then you can view my
[gkapfham/research-bibliography](https://github.com/gkapfham/research-bibliography) repository.

Here is a reference for the paper:

> Phil McMinn, Gregory M. Kapfhammer, and Chris J. Wright.
> Virtual Mutation Analysis for Relational Database Schemas.
> 11th International Workshop on Automation of Software Test (AST 2016).

## Installation Instructions

Please note that these instructions have been tested on an Ubuntu 15.04 workstation running the following version of R:

```shell
R version 3.2.3 (2015-12-10) -- "Wooden Christmas-Tree"
Copyright (C) 2015 The R Foundation for Statistical Computing
Platform: x86_64-pc-linux-gnu (64-bit)
```

You can type the next command in your R development environment if you want to want to install and then use this R
package. This method is ideal if you plan to leverage, without modification, our existing functions and data sets in
your own work. The following line is also the code that we use in the RMarkdown file found in the
[gkapfham/ast2016-paper](http://github.com/gkapfham/ast2016-paper) repository.

```shell
devtools::install_github("gkapfham/virtualmutationanalysis")
```

If you are interested in extending this package with new data sets and your own functions, then you can run the
following command to first clone this repository:

```shell
git clone git@github.com:gkapfham/virtualmutationanalysis.git
```

In an R shell you can run each of the following commands to build and test the R packages using `devtools`:

```shell
devtools::document()
devtools::install()
devtools::load_all()
devtools::test()
```

Running the test suite with the aforementioned commands should produce the following output:

```shell
combine-original-dbmss : .......
time-constrained-correlation : ......
create-virtual-data : ..
create-original-virtual-data : ..
read-time-constrained-mutation : .....
read-virtual-mutation : ....
read-original-mutation : .....
read-original-mutation-postgres : ..
read-original-mutation-hypersql : ..
read-original-mutation-sqlite : ..
rename-original-attributes : ..
replace-mutation-technique : ....
subset-original-and-virtual : ........
subset-original-dbmss : ...
subset-virtual : .
summarise-original-postgres : ...
summarise-original-hypersql : ...
summarise-original-sqlite : ...
summarise-original-and-virtual : ...
transform-mutation-scores : ......
transform-totals : .......
transform-mutation-times : ..
transform-mutationtime-thresholding : ............
```

## Troubleshooting

If you are unable to install the R package with `devtools` and your version of R and your execution environment, then
please open a new issue and I will attempt to resolve your concerns. Of course, your feedback is welcomed and
appreciated!
