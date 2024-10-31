import sequelize from "../conexion/database.js";
import DataTypes from "sequelize";

const Actor = sequelize.define(
  "Actor",
  {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    nombre: {
      type: DataTypes.STRING(50),
    },
    apellido: {
      type: DataTypes.STRING(50),
    },
  },
  {
    timestamps: false,
    tableName: "Actores",
  }
);

export default Actor;