test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})


test_that("encontrar_pior_ano_time funciona", {

  # eu espero que isso funcione
  pior_ano_santos <- encontrar_pior_ano_time("Santos")
  expect_equal(nrow(pior_ano_santos), 1)
  expect_equal(ncol(pior_ano_santos), 3)

  # Espero que funcione mesmo sem acentos
  pior_ano_sao_paulo <- encontrar_pior_ano_time("Sao Paulo")
  expect_equal(nrow(pior_ano_sao_paulo), 1)
  expect_equal(ncol(pior_ano_sao_paulo), 3)

  # espero que funcione mesmo tudo minúscula ou maiúscula
  pior_ano_corinthians <- encontrar_pior_ano_time("CORINTHIANS")
  expect_equal(nrow(pior_ano_corinthians), 1)
  expect_equal(ncol(pior_ano_corinthians), 3)


  # espero que gere um erro quando o time não estiver na base!

  expect_error(encontrar_pior_ano_time("Água Santa"))

  expect_error(encontrar_pior_ano_time("Barcelona"))

  })
