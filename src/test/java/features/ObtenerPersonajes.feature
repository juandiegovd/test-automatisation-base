Feature: Validar obtencion de personajes

  Background:
    * url 'http://bp-se-test-cabcd9b246a5.herokuapp.com'
    * path 'jdvilleg/api/characters'

  Scenario: Validar personajes devueltos
    Given method get
    Then status 200
