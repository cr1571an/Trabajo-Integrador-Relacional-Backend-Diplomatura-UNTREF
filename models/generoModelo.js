import sequelize from "../conexion/database.js";
import DataTypes from "sequelize";

const Genero = sequelize.define(
  "Genero",
  {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    nombre: {
      type: DataTypes.STRING(50),
    },
  },
  {
    timestamps: false,
    tableName: "Generos",
  }
);

export default Genero;