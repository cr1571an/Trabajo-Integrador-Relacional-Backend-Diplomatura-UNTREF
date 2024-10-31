import contenidoService from "../services/contenidoService.js";

const getAllContenidos = async (req, res) => {
  try {
    const contenido = await contenidoService.getAllContenido();
    res.status(200).json(contenido);
  } catch (error) {
    res.status(503).json(error);
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
    res.status(503).json(error);
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
    res.status(400).json({ error: error.message });
  }
};

export default {
  getAllContenidos,
  getContenidoById,
  createContenido,
};
