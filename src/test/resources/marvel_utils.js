function fn() {
  return {
    buscarConsulta: function(name) {
      const respConsulta = karate.call('ObtenerPersonajes.feature@consulta_full_personajes');

      const personajes = respConsulta.response;

      const encontrado = personajes.find(p => p.name === name);
      if (encontrado) {
        const randomSuffix = Math.floor(Math.random() * 100000);
        const nuevoNombre = name + ' ' + randomSuffix;
        return { ...respConsulta, name: nuevoNombre };
      }
      return {};
    },
    buscarPorId: function(id) {
      const respConsultaId = karate.call('ObtenerPersonajePorId.feature@consulta_por_id_ok', {id: id});
      const personaje = respConsultaId.response;
      if (personaje != null){
        return personaje;
      }
      return null;
    },
    buscarPorNombreParaEliminar: function(name) {
      const respConsulta = karate.call('ObtenerPersonajes.feature@consulta_full_personajes');

      const personajes = respConsulta.response;

      const encontrado = personajes.find(p => p.name.contains(name));
      if (encontrado) {
        return { id: encontrado.id };
      }
      return {};
    },
  };
}
