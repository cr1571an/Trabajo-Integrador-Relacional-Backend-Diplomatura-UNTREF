const Contenido = require('../models/contenidoModel');

const getAllContenido = async () => {    
    return await Contenido.findAll();;
};

module.exports = {
    getAllContenido
}