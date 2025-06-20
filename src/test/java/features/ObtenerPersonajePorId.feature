Feature: Validar obtención de personaje por ID
  Background:
    * url baseUrl
    * def endpoint = 'jdvilleg/api/characters'

  Scenario: Obtener personaje existente con identificador 1
    Given path endpoint + '/1'
    When method get
    Then status 200
    And match response ==
    """
    {
      "id": 1,
      "name": "Iron Man",
      "alterego": "Tony Stark",
      "description": "Genius billionaire",
      "powers": ["Armor", "Flight"]
    }
    """

  Scenario: Obtener personaje inexistente con identificador inválido (ejemplo, 9999)
    Given path endpoint + '/9999'
    When method get
    Then status 404
    And match response ==
    """
    { "error": "Character not found" }
    """
