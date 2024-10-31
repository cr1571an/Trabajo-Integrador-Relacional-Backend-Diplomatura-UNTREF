import sequelize from "../conexion/database.js";
import DataTypes from "sequelize";

const Categoria = sequelize.define(
  "Categoria",
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
    tableName: "Categorias",
  }
);

export default Categoria;