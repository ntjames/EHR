% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/collapseDose.R
\name{collapseDose}
\alias{collapseDose}
\title{Collapse Dose Data}
\usage{
collapseDose(x, noteMetaData, naFreq = "most", ...)
}
\arguments{
\item{x}{data.frame containing the output of \code{\link{buildDose}}, or the output of
\code{\link{addLastDose}} if last dose information is being incorporated.}

\item{noteMetaData}{data.frame containing identifying meta data for each
note, including patient ID, date of the note, and note ID. Column names
should be set to \sQuote{filename}, \sQuote{pid}, \sQuote{date},
\sQuote{note}. Date should have format YYYY-MM-DD.}

\item{naFreq}{Expression used to replace missing frequencies with, or by default use the most
common.}

\item{\dots}{drug formulations to split by}
}
\value{
A list containing two dataframes, one with the note level and one with the date level collapsed data.
}
\description{
Splits drug data and calls \code{\link{makeDose}} to collapse at the note and date level.
}
\details{
If different formulations of the drug (e.g., extended release) exist, they can be
separated using a regular expression (e.g., \sQuote{xr|er}). This function will call
\code{\link{makeDose}} on parsed and paired medication data to calculate dose intake
and daily dose and remove redundancies at the note and date level.
}
\examples{
data(lam_mxr_parsed)
data(lam_metadata)

lam_build_out <- buildDose(lam_mxr_parsed)

lam_collapsed <- collapseDose(lam_build_out, lam_metadata, naFreq = 'most', 'xr|er')
lam_collapsed$note # Note level collapsing
lam_collapsed$date # Date level collapsing
}
