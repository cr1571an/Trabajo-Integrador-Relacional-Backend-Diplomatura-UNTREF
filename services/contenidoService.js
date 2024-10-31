import models from "../models/index.js";

const { Contenido, Actor, Genero } = models;

const getAllContenido = async () => {
  return await Contenido.findAll();
};

const getContenidoById = async (id) => {
  return await Contenido.findByPk(id);
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
  createContenido,
  deleteContenido,
};
