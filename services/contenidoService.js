import models from "../models/index.js";
import { Op } from "sequelize";

const { Contenido, Actor, Genero, Categoria } = models;

const getAllContenido = async () => {
  return await Contenido.findAll();
};

const getContenidoById = async (id) => {
  return await Contenido.findByPk(id);
};

const filtrarContenidos = async (filtro) => {
  try {
    const query = {
      include: [],
    };
    let contenidos = [];

    if (filtro.titulo) {
      query.where = {
        titulo: { [Op.like]: `%${filtro.titulo}%` },
      };
      contenidos = await Contenido.findAll(query);
    }

    if (filtro.genero) {
      const genero = await Genero.findOne({
        where: {
          nombre: {
            [Op.like]: `%${filtro.genero}%`,
          },
        },
      });

      if (genero) {
        contenidos = await genero.getContenidos();
        return contenidos;
      }

      throw new Error("Genero no encontrado");
    }

    if (filtro.categoria) {
      const categoria = await Categoria.findOne({
        where: {
          nombre: {
            [Op.like]: `%${filtro.categoria}%`,
          },
        },
      });

      if (categoria) {
        contenidos = await categoria.getContenidos();
        return contenidos;
      }

      throw new Error("Categoria no encontrada");
    }

    return contenidos;
  } catch (error) {
    console.error(error);
    throw new Error("Ocurrió un problema al filtrar los contenidos");
  }
};

const createContenido = async (
  titulo,
  fk_categoria,
  genero,
  resumen,
  temporadas,
  trailer,
  duracion,
  poster,
  reparto
) => {
  const transaction = await Contenido.sequelize.transaction();

  try {
    const repartoExistentes = await Actor.findAll({
      where: {
        id: reparto,
      },
      transaction,
    });

    if (repartoExistentes.length !== reparto.length) {
      throw new Error("Uno o más reparto no existen en la base de datos");
    }

    const generoExistente = await Genero.findAll({
      where: {
        id: genero,
      },
    });

    if (generoExistente.length !== genero.length) {
      throw new Error("Uno o más genero no existen en la base de datos");
    }

    const nuevoContenido = await Contenido.create(
      {
        titulo,
        fk_categoria,
        resumen,
        temporadas,
        trailer,
        duracion,
        poster,
      },
      {
        transaction,
      }
    );

    await nuevoContenido.addActores(repartoExistentes, { transaction });

    await nuevoContenido.addGeneros(generoExistente, { transaction });

    // Confirmar la transacción
    await transaction.commit();

    return nuevoContenido;
  } catch (error) {
    await transaction.rollback();
    throw error;
  }
};

const updateContenido = async (id, body) => {
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
  } = body;

  const updateFields = {};

  if (titulo) updateFields.titulo = titulo;
  if (fk_categoria) updateFields.fk_categoria = fk_categoria;
  if (resumen) updateFields.resumen = resumen;
  if (temporadas) updateFields.temporadas = temporadas;
  if (trailer) updateFields.trailer = trailer;
  if (duracion) updateFields.duracion = duracion;
  if (poster) updateFields.poster = poster;

  const transaction = await Contenido.sequelize.transaction();

  try {
    const contenidoExistente = await Contenido.findByPk(id, { transaction });

    if (!contenidoExistente) {
      return null;
    }

    if (reparto) {
      const repartoExistentes = await Actor.findAll({
        where: {
          id: reparto,
        },
        transaction,
      });

      if (repartoExistentes.length !== reparto.length) {
        throw new Error("Uno o más reparto no existen en la base de datos");
      }
      const repartoOriginal = await contenidoExistente.getActores({
        transaction,
      });

      await contenidoExistente.removeActores(repartoOriginal, { transaction });
      await contenidoExistente.addActores(reparto, { transaction });
    }

    if (genero) {
      const generoExistente = await Genero.findAll({
        where: {
          id: genero,
        },
        transaction,
      });

      if (generoExistente.length !== genero.length) {
        throw new Error("Uno o más genero no existen en la base de datos");
      }

      const generoOriginal = await contenidoExistente.getGeneros({
        transaction,
      });

      await contenidoExistente.removeGeneros(reparto, { transaction });
      await contenidoExistente.addGeneros(genero, { transaction });
    }

    await Contenido.update(updateFields, {
      where: {
        id,
      },
      transaction,
    });

    await transaction.commit();

    return contenidoExistente;
  } catch (error) {
    await transaction.rollback();
    throw error;
  }
};

const deleteContenido = async (id) => {
  return await Contenido.destroy({
    where: {
      id,
    },
  });
};

export default {
  getAllContenido,
  getContenidoById,
  filtrarContenidos,
  createContenido,
  updateContenido,
  deleteContenido,
};
