@HU002 @Marvel_ConsultaPorId
Feature: Marvel Characters API - Obtener Personaje por Id
  Background:
    * url 'http://bp-se-test-cabcd9b246a5.herokuapp.com'
    * def endpoint = 'jdvilleg/api/characters'

  @id:1 @consulta_por_id_ok
  Scenario Outline: T-API-HU-002-CA1- Obtener personaje existente
    Given path endpoint + '/' + <id>
    When method get
    Then status 200
    And match response == {"id":1,"name":"Iron Man","alterego":"Tony Stark","description":"#string","powers":["Armor","Flight"]}
    Examples:
      | id         |
      | 1          |

  @id:2 @consulta_por_id_no_existente
  Scenario Outline: T-API-HU-002-CA2- Obtener personaje inexistente con identificador inválido
    Given path endpoint + '/' + <id>
    When method get
    Then status 404
    And match response == {error: "Character not found" }
    Examples:
      | id               |
      | 9999999          |