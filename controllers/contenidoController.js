import contenidoService from "../services/contenidoService.js";

const getAllContenidos = async (req, res) => {
  try {
    const contenido = await contenidoService.getAllContenido();
    res.status(200).json(contenido);
  } catch (error) {
    console.log(error);
    res.status(503).json({ error: "No se pudieron obtener los contenidos" });
  }
};

const getContenidoById = async (req, res) => {
  try {
    const { id } = req.params;
    const contenido = await contenidoService.getContenidoById(id);
    if (!contenido) {
      res.status(404).json({ message: "Contenido no encontrado" });
      return;
    }
    res.status(200).json(contenido);
  } catch (error) {
    console.log(error);
    res.status(503).send({ error: "No se pudo obtener el contenido" });
  }
};

const filtrarContenidos = async (req, res) => {
  try {
    const { titulo, genero, categoria } = req.query;

    // Validar que solo un parámetro esté presente
    const filtros = [titulo, genero, categoria].filter(Boolean);
    if (filtros.length !== 1) {
      return res.status(400).send({
        error:
          "Solo se puede filtrar por un parámetro a la vez: título, género o categoría.",
      });
    }

    const filtro = {};
    if (titulo) filtro.titulo = titulo;
    if (genero) filtro.genero = genero;
    if (categoria) filtro.categoria = categoria;

    const contenidos = await contenidoService.filtrarContenidos(filtro);

    // Controlar si no se encuentran coincidencias
    if (contenidos.length === 0) {
      return res.status(404).send({
        error:
          "No se encontraron contenidos que coincidan con el filtro proporcionado.",
      });
    }

    res.status(200).json(contenidos);
  } catch (error) {
    console.error(error);
    res.status(503).send({
      error: "Ocurrió un problema al intentar obtener los contenidos",
      details: error.message,
    });
  }
};

const createContenido = async (req, res) => {
  const {
    titulo,
    fk_categoria,
    genero,
    resumen,
    temporadas,
    trailer,
    duracion,
    poster,
    reparto,
  } = req.body;

  if (
    !titulo ||
    !fk_categoria ||
    !Array.isArray(genero) ||
    !resumen ||
    !temporadas ||
    !trailer ||
    !poster ||
    !Array.isArray(reparto)
  ) {
    return res.status(400).json({
      error:
        "Todos los campos son obligatorios, incluyendo una lista de reparto",
    });
  }

  try {
    const nuevoContenido = await contenidoService.createContenido(
      titulo,
      fk_categoria,
      genero,
      resumen,
      temporadas,
      trailer,
      duracion,
      poster,
      reparto
    );
    res.status(201).json({
      message: "Contenido y actores agregados exitosamente",
      contenido: nuevoContenido,
    });
  } catch (error) {
    console.log(error);
    res.status(400).send({ error: "No se pudo agregar el contenido" });
  }
};

const updateContenido = async (req, res) => {
  const { id } = req.params;
  try {
    const updated = await contenidoService.updateContenido(id, req.body);
    if (!updated) {
      res.status(404).json({ message: "Contenido no encontrado" });
      return;
    }
    res.status(200).json({ message: "Contenido actualizado exitosamente" });
  } catch (error) {
    console.log(error);
    res.status(503).send({
      error: "No se pudo actualizar el contenido",
      details: error.message,
    });
  }
};

const deleteContenido = async (req, res) => {
  const { id } = req.params;
  try {
    const deleted = await contenidoService.deleteContenido(id);
    if (!deleted) {
      res.status(404).json({ message: "Contenido no encontrado" });
      return;
    }
    res.status(200).json({ message: "Contenido eliminado exitosamente" });
  } catch (error) {
    console.log(error);
    res.status(503).send({ error: "No se pudo eliminar el contenido" });
  }
};

export default {
  getAllContenidos,
  getContenidoById,
  filtrarContenidos,
  createContenido,
  updateContenido,
  deleteContenido,
};
