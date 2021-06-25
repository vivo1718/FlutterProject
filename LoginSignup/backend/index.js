const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const mongoose = require('mongoose');
mongoose.connect("mongodb://localhost:27017/Test",{useNewUrlParser:true,useUnifiedTopology:true})
const port = 8080 || process.env.PORT;
const cors = require('cors');
app.use(bodyParser.urlencoded({extended:true}))
app.use(bodyParser.json());
app.use(cors())
app.use('/',require('./routes/user.route'))
app.listen(port,()=>{
    console.log('port running on'+port);
})


