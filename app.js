import express, { json } from "express";
import contenidoRoutes from "./routes/contenidoRoutes.js";
import sequelize from "./conexion/database.js";

const app = express();

process.loadEnvFile();

// Middlewares
app.use(json());

app.use(async (req, res, next) => {
  try {
    await sequelize.authenticate();
    console.log("Conexión establecida con exito ! =)");
    next();
  } catch (error) {
    res
      .status(500)
      .json({ error: `Error en el servidor: `, description: error.message });
  }
});

// Routes
app.use("/contenido", contenidoRoutes);

app.use((req, res) => {
  res.status(404).json({ message: "Ruta no encontrada" });
});

// Server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
