
#' Encontrar o pior ano de um time
#'
#' A função parte da base [partidas_brasileirao] e
#' encontra o pior ano em número de vitórias para
#' um dado time. Olhe também [sumarizar_paises]
#'
#' @param time Uma string contendo o time.
#'
#' @return Um data frame com 3 colunas e 1 linha.
#' @seealso A base [partidas_brasileirao].
#' @export
#'
#' @examples
#' # Encontrar o pior ano do Flamengo
#' encontrar_pior_ano_time("Flamengo")
encontrar_pior_ano_time <- function(time) {
  countrrry::partidas_brasileirao %>%
    dplyr::group_by(temporada, quem_ganhou) %>%
    dplyr::filter(quem_ganhou != "Empate", quem_ganhou %in% time) %>%
    dplyr::count(quem_ganhou, sort = TRUE, name = "n_vitorias") %>%
    dplyr::ungroup() %>%
    dplyr::filter(n_vitorias == min(n_vitorias)) %>%
    dplyr::rename("time" = quem_ganhou)
}
