
const express = require('express');
const router = express.Router();
const User = require('../models/user.model.js')

router.post('/signup',(req,res)=>{
    User.findOne({
        email:req.body.email,
    },(err,user)=>{
        if(err){
            console.log(err)
            res.json(err)
        }else{
            if(user==null){
                const user = User({
                    email:req.body.email,
                    password:req.body.password
                })
                user.save().then((err)=>{
                    if(err){
                        console.log(err)
                        res.json(err)
                    }else{
                        console.log(err);
                        res.json(user)
                    }
                })
            ;}
            else{
                res.json({
                    message:'email is not available '
                })

            }
         
    }}
    )
    
})
router.post('/signin',(req,res)=>{
    User.findOne({
        email:req.body.email,
        password:req.body.password},(err,user)=>{
        if(err){
            console.log(err)
            res.json(err)
        }else{
            res.json(user);
         
    }}
    )
    
})
module.exports = router;