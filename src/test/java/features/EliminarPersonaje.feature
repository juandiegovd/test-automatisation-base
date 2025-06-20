@HU_005 @Marvel_EliminarPersonaje
Feature: Marvel Characters API - Eliminar Personaje
  Background:
    * url 'http://bp-se-test-cabcd9b246a5.herokuapp.com'
    * def endpoint = 'jdvilleg/api/characters'
    * header Content-Type = 'application/json'
    * def localUtil = read('classpath:marvel_utils.js')()

  Scenario Outline: T-API-HU-005-CA1 - Eliminar personaje
    * def consultaConsentimiento = localUtil.buscarPorNombreParaEliminar('<name>')
    * if (!consultaConsentimiento.id) karate.abort()
    * def id = consultaConsentimiento.id
    Given path endpoint + '/' + id
    When method delete
    Then status 204
    Examples:
      | name             |
      | Captain America  |

  Scenario Outline: T-API-HU-005-CA2 - Eliminar personaje no existente
    Given path endpoint + '/' + <id>
    When method delete
    Then status 404
    And match response contains { error: "Character not found" }
    Examples:
      | id         |
      | 99999      |