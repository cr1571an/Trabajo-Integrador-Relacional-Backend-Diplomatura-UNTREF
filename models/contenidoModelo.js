import sequelize from "../conexion/database.js";
import DataTypes from "sequelize";

const Contenido = sequelize.define(
  "Contenido",
  {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    titulo: {
      type: DataTypes.STRING(100),
    },
    fk_categoria: {
      type: DataTypes.INTEGER,
    },
    resumen: {
      type: DataTypes.STRING,
    },
    temporadas: {
      type: DataTypes.STRING(3),
    },
    trailer: {
      type: DataTypes.STRING(255),
    },
    duracion: {
      type: DataTypes.STRING(18),
    },
    poster: {
      type: DataTypes.STRING,
    },
  },
  {
    timestamps: false,
    tableName: "Contenidos",
  }
);

export default Contenido;
