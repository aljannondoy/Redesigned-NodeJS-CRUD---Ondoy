const task = require("../models/task");
exports.index = async (req, res) =>{
    res.render("../views/index",  {data:{user: false, pass:false}});
}
exports.register = async (req, res) => {
    res.render("../views/addaccount",  {flag:false});
}
exports.addTask = async(req, res) => {
    res.render("../views/addtask", {data:req.query.uuid});
}
exports.updateTask = async(req, res) => {
    let data = await task.model.findByPk(req.query.task_id);
    res.render("../views/updatepage", {data:data});
}


