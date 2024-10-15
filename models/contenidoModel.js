const { sequelize } = require("../conexion/database");
const { DataTypes } = require("sequelize");

const Contenido = sequelize.define("Contenido", {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  poster: {
    type: DataTypes.STRING,
  },
  titulo: {
    type: DataTypes.STRING(100),
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
  busqueda: {
    type: DataTypes.STRING,
  },
  duracion: {
    type: DataTypes.STRING(18),
  },
}, {
  timestamps: false
});

module.exports = Contenido;
