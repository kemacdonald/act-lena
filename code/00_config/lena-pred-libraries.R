## Knitr Chunk options
knitr::opts_chunk$set(echo = T, warning = F, message = F, fig.asp = 0.8, 
                      fig.width = 8, fig.align = 'center', out.width = "80%")

# specify the packages of interest
packages = c("pracma", "mvtnorm", "soundgen", "R.matlab",
             "here", "furrr", "janitor", "glue", 
             "tidyboot", "ggthemes", "ggrepel", "cowplot", 
             "knitr", "brms", "tidybayes", "devtools",
             "tidyverse")

# use this function to check if each package is on the local machine
# if a package is installed, it will be loaded
# if any are not, the missing package(s) will be installed and loaded
package_check <- lapply(packages, FUN = function(x) {
  if (!require(x, character.only = TRUE)) {
    install.packages(x, dependencies = TRUE, repos = "https://cran.cnr.berkeley.edu/")
    library(x, character.only = TRUE)
  }
})

# Install keras rpkg from github\ -----------------------------------------

if (!require("keras", character.only = TRUE) ) {
  devtools::install_github("rstudio/keras")
  library(keras)
  reticulate::use_virtualenv(virtualenv = "~/.virtualenvs/lena-pred/")
} else {
  library(keras)
}

# TODO check if ffmpeg-normalize is installed, if not install

# Set plot theme ----------------------------------------------------------

source(here("code/00_helper_functions/plotting-h.R"))
theme_set(kyle_theme())

# Load local helper functions for running experiment ----------------------

source(here("code/00_helper_functions/run-experiment-h.R"))
source(here("code/00_helper_functions/lstm-train-h.R"))
source(here("code/00_helper_functions/lstm-data-gen-h.R"))
source(here("code/00_helper_functions/pitch-extraction-h.R"))

# Load local helpers for analysis -----------------------------------------

source(here("code/00_helper_functions/analysis-h.R"))
source(here("code/00_helper_functions/plotting-h.R"))