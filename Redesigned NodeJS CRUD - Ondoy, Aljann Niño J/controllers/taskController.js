const { Sequelize } = require("sequelize");
const account = require("../models/account");
const task = require("../models/task");

account.model.hasMany(task.model, {foreignKey: 'accountUuid'});
task.model.belongsTo(account.model, {foreignKey: 'accountUuid'});

exports.createTask = async (req, res) => {
    let data = await task.model.create({
        accountUuid: req.query.uuid,
        task: req.body.taskcontent,
        status: "pending"
    });
    let findUser = await account.model.findOne({
        where: {uuid: req.query.uuid}
    });
    let user = await account.model.update(
        {no_tasks: JSON.stringify(findUser.no_tasks+1)},
        {
            where: {
                uuid: req.query.uuid
            }
        }
    )
    let sendUser = await account.model.findOne({
        where: {uuid: req.query.uuid}
     });
     if(sendUser){
         let sendTask = await task.model.findAll({
             where: {accountUuid: req.query.uuid},
                 include: [{
                     model: account.model,
                     on: {
                         uuid: Sequelize.col('accountUuid')
                     },
             }],
         });
         res.render("../views/profile",  {data: {account: sendUser, task: sendTask}});
    }
    
}

exports.updateTask = async (req, res) => {
    if(req.body.taskcompleted == "yes"){
        req.body.status = "complete";
    }else{
        req.body.status = "pending";
    }
    let user = await task.model.update(
        {   
            task: req.body.taskcontent,
            status: req.body.status
        },
        {
            where: {
                id: req.query.task_id
            }
        }
    )
    let row = await task.model.findByPk(req.query.task_id)
    let sendUser = await account.model.findOne({
        where: {uuid: row.accountUuid}
     });
     if(sendUser){
         let sendTask = await task.model.findAll({
             where: {accountUuid: row.accountUuid},
                 include: [{
                     model: account.model,
                     on: {
                         uuid: Sequelize.col('accountUuid')
                     },
             }],
         });
         res.render("../views/profile",  {data: {account: sendUser, task: sendTask}});
    }
    
}

exports.deleteTask = async (req, res) => {
    let data = await task.model.destroy(
        {
            where: {
                id: req.query.task_id
            }
        }
    )
    let sendUser = await account.model.findOne({
        where: {uuid: req.query.uuid}
     });
     if(sendUser){
         let sendTask = await task.model.findAll({
             where: {accountUuid: req.query.uuid},
                 include: [{
                     model: account.model,
                     on: {
                         uuid: Sequelize.col('accountUuid')
                     },
             }],
         });
         res.render("../views/profile",  {data: {account: sendUser, task: sendTask}});
    }
    
}
