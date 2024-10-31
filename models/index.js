import sequelize from "../conexion/database.js";
import Actor from "./actorModelo.js";
import Contenido from "./contenidoModelo.js";
import Genero from "./generoModelo.js";
import Categoria from "./categoriaModelo.js";

const models = { Actor, Contenido, Genero, Categoria };

// Define las asociaciones después de importar todos los modelos
Actor.belongsToMany(Contenido, {
  through: "Actores_Contenidos",
  foreignKey: "fk_actor",
  otherKey: "fk_contenido",
  as: "contenidos",
  timestamps: false,
});

Contenido.belongsToMany(Actor, {
  through: "Actores_Contenidos",
  foreignKey: "fk_contenido",
  otherKey: "fk_actor",
  as: "actores",
  timestamps: false,
});

Contenido.belongsTo(models.Categoria, {
  foreignKey: "fk_categoria",
  as: "categoria",
});

Contenido.belongsToMany(models.Genero, {
  through: "Generos_Contenidos",
  foreignKey: "fk_contenido",
  otherKey: "fk_genero",
  as: "generos",
  timestamps: false,
});

export { sequelize };
export default models;
