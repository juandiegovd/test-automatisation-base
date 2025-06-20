@HU001 @Marvel_ConsultaFull
Feature: Marvel Characters API - Obtener Todos los Personajes

  Background:
    * url 'http://bp-se-test-cabcd9b246a5.herokuapp.com'
    * path 'jdvilleg/api/characters'

  @id:1 @consulta_full_personajes
  Scenario: T-API-HU-001-CA1- Validar personajes devueltos
    Given method get
    Then status 200
    Then match response[0].id == 1
    And match each response contains { id: '#number', name: '#string', alterego: '#string', description: '#string', powers: '#[]' }
