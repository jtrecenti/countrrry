
#' Title
#'
#' @param continentes bla
#' @param ano_minimo bla
#'
#' @return bla
#' @export
sumarizar_paises <- function(continentes = "\u00C1sia",
                             ano_minimo = 2000) {

  ## ALTERNATIVA GLOBAL VARS
  # dados::dados_gapminder |>
  #   dplyr::filter(
  #     .data[["continente"]] %in% "Europa",
  #     .data[["ano"]] >= 2000
  #   ) |>
  #   dplyr::group_by(.data[["ano"]]) |>
  #   dplyr::summarise(
  #     pop = sum(.data[["populacao"]]) / 1e6,
  #     vida = mean(.data[["expectativa_de_vida"]]),
  #     .groups = "drop"
  #   )

  # {{}}

  dados::dados_gapminder %>%
    dplyr::filter(
      continente %in% continentes,
      ano >= ano_minimo
    ) |>
    dplyr::group_by(ano) |>
    dplyr::summarise(
      pop = sum(populacao) / 1e6,
      vida = mean(expectativa_de_vida),
      .groups = "drop"
    )
}

sumarizar_paises2 <- function(dados, coluna) {
  dados |>
    dplyr::count( {{ coluna }} )
}

sumarizar_paises3 <- function(dados, ...) {

  # elementos <- list(deparse(...))
  # print(elementos)

  dados |>
    dplyr::count(...)
}
