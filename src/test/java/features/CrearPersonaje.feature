@HU003 @Marvel_CrearPersonaje
Feature: Marvel Characters API - Crear Personaje

  Background:
    * url 'http://bp-se-test-cabcd9b246a5.herokuapp.com'
    * path 'jdvilleg/api/characters'
    * header Content-Type = 'application/json'
    * def localUtil = read('classpath:marvel_utils.js')()

  @id:1 @crear_personaje_ok
  Scenario: T-API-HU-003-CA1 - Crear nuevo personaje
    * def requestBody = read('classpath:CrearPersonaje.json')
    * def consultaConsentimiento = localUtil.buscarConsulta(requestBody.name)
    * if (consultaConsentimiento.name) requestBody.name = consultaConsentimiento.name
    Given request requestBody
    When method post
    Then status 201
    And match response contains { id: '#number', name: '#string', alterego: 'Steve Rogers', description: 'Ex soldier',powers: ['Shield', 'Strength'] }

  @id:2 @crear_personaje_nombre_existente
  Scenario: T-API-HU-003-CA2 - Crear nuevo personaje, nombre ya existente
    * def requestBody = read('classpath:CrearPersonaje.json')
    Given request requestBody
    When method post
    Then status 400
    And match response == {error: "Character name already exists"}

  @id:3 @crear_personaje_datos_faltantes
  Scenario: T-API-HU-003-CA3 - Crear nuevo personaje, datos faltantes
    * def requestBody = {}
    Given request requestBody
    When method post
    Then status 400
    And match response ==
    """
    {
        "name": "Name is required",
        "description": "Description is required",
        "powers": "Powers are required",
        "alterego": "Alterego is required"
    }
    """
