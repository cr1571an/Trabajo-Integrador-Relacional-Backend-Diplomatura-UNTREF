import { Sequelize } from "sequelize";

process.loadEnvFile();
const { DBUSER, DBPASSWORD, HOST, DATABASE } = process.env;

const sequelize = new Sequelize(DATABASE, DBUSER, DBPASSWORD, {
  host: HOST,
  dialect: "mysql",
});

export default sequelize;