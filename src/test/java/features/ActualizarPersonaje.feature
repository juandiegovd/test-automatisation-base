@HU_004 @Marvel_ActualizarPersonaje
Feature: Marvel Characters API - Actualizar Personaje
  Background:
    * url 'http://bp-se-test-cabcd9b246a5.herokuapp.com'
    * def endpoint = 'jdvilleg/api/characters'
    * header Content-Type = 'application/json'
    * def localUtil = read('classpath:marvel_utils.js')()

  @id:1 @actualizar_personaje_ok
  Scenario Outline: T-API-HU-004-CA1 - Actualizar personaje
    * def requestBody = read('classpath:ActualizarPersonaje.json')
    * def consultaConsentimiento = localUtil.buscarPorId(<id>)
    * if (!consultaConsentimiento) karate.abort()
    Given request requestBody
    And path endpoint + '/' + <id>
    When method put
    Then status 200
    And match response contains { id: '#number', name: '#string', alterego: '#string', description: 'Updated description',powers: '#[]' }
    Examples:
      | id         |
      | 1          |

  @id:2 @actualizar_personaje_no_existente
  Scenario Outline: T-API-HU-004-CA2 - Actualizar personaje no existente
    * def requestBody = read('classpath:ActualizarPersonaje.json')
    Given request requestBody
    And path endpoint + '/' + <id>
    When method put
    Then status 404
    And match response contains { error: "Character not found" }
    Examples:
      | id         |
      | 99999      |