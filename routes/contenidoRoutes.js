import { Router } from "express";
const router = Router();
import contenidoController from "../controllers/contenidoController.js";

// Routes for CRUD
router.get("/", contenidoController.getAllContenidos);

router.get("/:id", contenidoController.getContenidoById);

router.post("/", contenidoController.createContenido);

router.put("/:id", (req, res) => {
  // Update content by ID
});

router.delete("/:id", (req, res) => {
  // Delete content by ID
});

export default router;
