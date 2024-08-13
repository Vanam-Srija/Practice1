module.exports = async (srv)=>{
    srv.on('getservice', (req,res)=>{
        return "good morning " + req.data.name;
    })
}