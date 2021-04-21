const {DataTypes} = require("sequelize");
const instance = require("../connection");

const account = instance.sequelize.define("accounts", {
    id: {
        type: DataTypes.BIGINT,
        autoIncrement: true,
        primaryKey: true,
        allowNull: false
      },
      uuid: {
        type: DataTypes.STRING,
        unique: true,
        allowNull: false
      },
      username: {
        type: DataTypes.STRING,
        unique: true,
        allowNull: false
      },
      password: {
        type: DataTypes.STRING,
        allowNull: false
      },
      no_tasks: {
        type: DataTypes.BIGINT,
        allowNull: false
      },
      type: {
        type: DataTypes.STRING,
        allowNull: false
      }
    },{
      timestamps: false
    }
)


exports.model = account;