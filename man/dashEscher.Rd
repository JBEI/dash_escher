% Auto-generated: do not edit by hand
\name{dashEscher}

\alias{dashEscher}

\title{DashEscher component}

\description{
DashEscher visualizes a metabolic network using Escher Builder. It takes two properties, `mapData` and `modelData`, and displays the network.
}

\usage{
dashEscher(id=NULL, height=NULL, mapData=NULL, modelData=NULL,
options=NULL, width=NULL)
}

\arguments{
\item{id}{Character. The ID used to identify this component in Dash callbacks.}

\item{height}{Character. Height of the canvas.}

\item{mapData}{Unnamed list. The metabolic network map.}

\item{modelData}{Named list. The metabolic network model.}

\item{options}{Named list. Rendering options. Full list of options at
https://escher.readthedocs.io/en/latest/javascript_api.html}

\item{width}{Character. Width of the canvas.}
}

\value{named list of JSON elements corresponding to React.js properties and their values}

