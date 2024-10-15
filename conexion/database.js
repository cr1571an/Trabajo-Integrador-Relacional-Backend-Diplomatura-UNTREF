const { Sequelize } = require('sequelize')

process.loadEnvFile()
const { DBUSER, DBPASSWORD, HOST, DATABASE } = process.env

const sequelize = new Sequelize(DATABASE, DBUSER, DBPASSWORD, {
  host: HOST,
  dialect: 'mysql',
})

module.exports = { sequelize }