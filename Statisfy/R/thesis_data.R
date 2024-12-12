#' Frog Biodiversity Data in Congolese Ecosystems
#'
#' This is a subset of a larger dataset of ecological and frog biodiversity data collected from plots in Odzala-Kokoua National Park, Republic of Congo.
#'
#' Variables include air and water temperature, relative humidity, water pH, disturbance levels, and total number of frog species found in each plot.
#'
#' @format A data frame with 90 rows
#' \describe{
#'   \item{\code{plot_id}}{Unique ID for each plot.}
#'   \item{\code{transect_id}}{Unique ID for each transect (3 plots per transect).}
#'   \item{\code{bai_id}}{ID of the bai (site) where plot was located.}
#'   \item{\code{ecosystem}}{Ecosystem type of the plot (forest, ecotone, or bai).}
#'   \item{\code{audiomoth}}{ID of the acoustic recorder placed in the plot.}
#'   \item{\code{ph_water}}{Water pH (1-7).}
#'   \item{\code{temp_water}}{Water temperature (°F).}
#'   \item{\code{temp_air}}{Air temperature (°F).}
#'   \item{\code{rel_humidity}}{Relative humidity (%).}
#'   \item{\code{total_spp}}{Total number of species recorded in the plot.}
#'   \item{\code{dist_score}}{Level of animal disturbance in the plot (1 = low, 5 = high).}
#' }
#'
#' @source Dariana Gonzalez, undergraduate thesis research.
#'
#' @examples
#' data(thesis_data)
"thesis_data"
