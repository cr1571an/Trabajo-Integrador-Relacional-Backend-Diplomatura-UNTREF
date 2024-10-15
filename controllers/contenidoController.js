const contenidoService = require("../services/contenidoService");

const getAllContenidos = async (req, res) => {
    try {
        const contenido = await contenidoService.getAllContenido();
        res.status(200).json(contenido);
    } catch (error) {
        res.status(400).json(error);
    }
};

module.exports = {
    getAllContenidos,
}