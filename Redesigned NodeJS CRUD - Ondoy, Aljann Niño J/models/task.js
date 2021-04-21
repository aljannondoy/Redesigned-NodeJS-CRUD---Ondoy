const {DataTypes} = require("sequelize");
const instance = require("../connection");

const task = instance.sequelize.define("tasks", {
    id: {
        type: DataTypes.BIGINT,
        autoIncrement: true,
        primaryKey: true,
        allowNull: false
      },
      accountUuid: {
        type: DataTypes.STRING,
        foreighKey: true,
        allowNull: false
      },
      task: {
        type: DataTypes.STRING,
        allowNull: false
      },
      status: {
        type: DataTypes.STRING,
        allowNull: false
      }
    },{
        createdAt: true,
        updatedAt: true,
        deletedAt: true,
        paranoid: true,
        tableName: "tasks"
    }
)

exports.model = task;