% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/modMedStr2.R
\name{run_MedStrII}
\alias{run_MedStrII}
\title{Run Structured E-Prescription Data}
\usage{
run_MedStrII(
  file,
  select = c("GRID", "MED_NAME", "RX_DOSE", "FREQUENCY", "ENTRY_DATE",
    "STRENGTH_AMOUNT", "DESCRIPTION"),
  rename = c("ID", "MED_NAME", "RX_DOSE", "FREQUENCY", "ENTRY_DATE", "STRENGTH_AMOUNT",
    "DESCRIPTION")
)
}
\arguments{
\item{file}{filename of prescription data}

\item{select}{columns to select}

\item{rename}{new column names}
}
\value{
str data set
}
\description{
This module will load and modify structured e-prescription data.
}
