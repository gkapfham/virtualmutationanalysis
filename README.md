# virtualmutationanalysis

This repository contains the replication package for a research paper that was accepted for publication at the [Eleventh
International Workshop on Automation of Software Test](http://tech.brookes.ac.uk/AST2016/) (AST 2016). In particular,
the repository contains an R package, written with the [devtools](http://github.com/hadley/devtools) package development
framework. The R package contains all of the data sets that are presented in a polished form in our AST 2016 paper.
Furthermore, the package provides all of the R source code to read in and summarize the data sets, perform data
the necessary manipulation, statistically analyze the results, and produce create the final summary tables and data
visualizations. Finally, the R packages comes with a test suite to mitigate the threats to the validity of the
experimental results presented in the AST 2016 paper.

You are invited to use this repository 

If you find this example useful, could I trouble you to star this repository and then acknowledge it in your own
research efforts?  If you would like to learn more about my research program, then you can checkout my
[gkapfham/research-bibliography](https://github.com/gkapfham/research-bibliography).

Here is a reference for the paper:

> Phil McMinn, Gregory M. Kapfhammer, and Chris J. Wright.
> Virtual Mutation Analysis for Relational Database Schemas.
> 11th International Workshop on Automation of Software Test (AST 2016).

## Installation Instructions

You can type the following command in your R development environment if you want to install and then use this R package:

```shell
devtools::install_github("gkapfham/virtualmutationanalysis")
```

Please note that this has been tested on an Ubuntu 15.04 workstation running the following version of R. 

```shell
R version 3.2.3 (2015-12-10) -- "Wooden Christmas-Tree"
Copyright (C) 2015 The R Foundation for Statistical Computing
Platform: x86_64-pc-linux-gnu (64-bit)
```

```shell
devtools::document()
devtools::install()
devtools::load_all()
devtools::test()
```

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

If you are unable to compile the paper with your development tools and your
execution environment, then please open a new issue and I will attempt to resolve your concerns.
