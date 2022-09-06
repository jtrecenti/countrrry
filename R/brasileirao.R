
#' Encontrar o pior ano de um time
#'
#' A funcao parte da base [partidas_brasileirao] e
#' encontra o pior ano em numero de vitorias para
#' um dado time. Olhe tambem [sumarizar_paises]
#'
#' @param time Uma string contendo o time.
#' @param tirar_ano_atual Tira o ano atual.
#'
#' @return Um data frame com 3 colunas e 1 linha.
#' @seealso A base [partidas_brasileirao].
#' @export
#'
#' @examples
#' # Encontrar o pior ano do Flamengo
#' encontrar_pior_ano_time("Flamengo")
encontrar_pior_ano_time <- function(time, tirar_ano_atual = TRUE) {


  time_limpo <- limpar_time(time)

  times_existentes_limpo <- limpar_time(times_existentes())

  if(!time_limpo %in% times_existentes_limpo){

    usethis::ui_stop("O time escolhido n\u00E3o est\u00E1 na base do Brasileir\u00E3o.
                     Verifique se voc\u00EA escreveu corretamente.
                     A fun\u00E7\u00E3o times_existentes() apresenta os times poss\u00EDveis.")
  }


  countrrry::partidas_brasileirao %>%
    dplyr::mutate(quem_ganhou_limpo = limpar_time(quem_ganhou)) |>
    dplyr::filter(data < lubridate::floor_date(Sys.Date(), "year")) %>%
    dplyr::group_by(temporada, quem_ganhou_limpo) %>%
    dplyr::filter(quem_ganhou_limpo != "empate", quem_ganhou_limpo %in% time_limpo) %>%
    dplyr::count(quem_ganhou, sort = TRUE, name = "n_vitorias") %>%
    dplyr::ungroup() %>%
    dplyr::filter(n_vitorias == min(n_vitorias)) %>%
    dplyr::rename("time" = quem_ganhou) |>
    dplyr::select(-quem_ganhou_limpo)
}


#' Limpa o nome do time
#'
#' @param time Nome do time
#'
#' @return um vetor
#' @noRd
#'
#' @examples limpar_time("São Paulo")
limpar_time <- function(time){
  time |>
    stringr::str_replace_all(" ", "_") |>
    stringr::str_to_lower() |>
    abjutils::rm_accent()
}


#' Listar times existentes
#'
#' @return um vetor
#' @export
#'
#' @examples times_existentes()
times_existentes <- function(){
  c(
    countrrry::partidas_brasileirao$time_casa,
    countrrry::partidas_brasileirao$time_visitante
  ) |>
    unique() |>
    sort()
}
