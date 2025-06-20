function fn() {
  return {
    buscarConsulta: function(name) {
      const respConsulta = karate.call('ObtenerPersonajePorId.feature@consulta_full_personajes');
      const personajes = respConsulta.response;
      const encontrado = personajes.find(p => p.name === name);

      if (encontrado) {
        return { ...respConsulta, id: encontrado.id };
      }

      return {};
    }
  };
}
