import { Router } from "express";
const router = Router();
import contenidoController from "../controllers/contenidoController.js";

// Routes for CRUD
router.get("/", contenidoController.getAllContenidos);

router.get("/:id", contenidoController.getContenidoById);

router.post("/", contenidoController.createContenido);

router.put("/:id", contenidoController.updateContenido);

router.delete("/:id", contenidoController.deleteContenido);

export default router;
