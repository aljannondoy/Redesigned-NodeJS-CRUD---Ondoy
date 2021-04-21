
const { Sequelize } = require("sequelize");
const account = require("../models/account");
const task = require("../models/task");
const bcrypt = require('bcrypt');
const saltRounds = 10;

account.model.hasMany(task.model, {foreignKey: 'accountUuid'});
task.model.belongsTo(account.model, {foreignKey: 'accountUuid'});

exports.createAccount = async (req, res) => {
    req.body.uuid = generateCode();
    req.body.no_tasks = 0;
    if(req.body.password === req.body.confirmpass){
        bcrypt.hash(JSON.stringify(req.body.password), saltRounds, function(err, hash){
            let data = account.model.create({
                uuid: req.body.uuid,
                username: req.body.username,
                password: hash,
                no_tasks: req.body.no_tasks,
                type: req.body.type
            })
            res.render("../views/index", {data: {user: false, pass:false}});
        });
        
    }else{
        res.render("../views/addaccount", {flag:true});
    }
    
}
exports.login = async(req, res) => {
    let user = await account.model.findOne({
       where: {username: req.body.username}
    });
    if(user){
        let row = await task.model.findAll({
            where: {accountUuid: user.uuid},
                include: [{
                    model: account.model,
                    on: {
                        uuid: Sequelize.col('accountUuid')
                    },
            }],
        });
        bcrypt.compare(JSON.stringify(req.body.password), user.password, function(err, result) {
            if(result == true){
                res.render("../views/profile",  {data: {account: user, task: row}});
            }else{
                res.render("../views/index", {data: {pass: true}});
            }
        })
    }else{
        res.render("../views/index", {data: {user: true}});
    }
}
generateCode = () =>{
    let generate = "";
    const char = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';

    const length = 32;
    for(var i = 0; i < length; i++){
        generate += char.charAt(Math.floor(Math.random()*char.length));
    }
    return generate;
}