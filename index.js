var server = require('ws').Server;
var s = new server({port:5001});
var path = require('path');
var express = require('express');
var app = express();
var bodyParser = require('body-parser');
var fs = require('fs');
var firstFlag=false,finalFlag = false,usersign = true,mailSign = true;
var loginError = false,SignupError=false;

app.use('/static', express.static('static'));
class login {
   
   constructor(){     
app.use(bodyParser());
      // this.getpage();
       //this.getData();
      
   }
    
  getpage(){
    app.get("",function(request,response){
response.sendFile("login.html",{root:path.join(__dirname,'/files')});    
});
 app.get("/chat",function(request,response){
response.sendFile("index.html",{root:path.join(__dirname,'/files')});  
         
});

app.listen(1337,function(){

});  
  }    
  
  
 getData(){
   app.post("",function(req,resp){
//resp.end(JSON.stringify(req.body));  
   var userName =  req.body.userName;
    var password = req.body.password;
    var type = req.body.button;

    if(type=="Sign Up") {
        usersign = true,mailSign = true,SignupError=false;
     var mail = req.body.mail 
     
     //read from json file
fs.readFile('user.json','utf8',(err,fileContent)=>{
    if(err){}
    else{
        var data = JSON.parse(fileContent);
        for(var i=0;i<data.users.length;i++){
            if(userName==data.users[i].userName) 
                usersign = false;
                if(mail==data.users[i].mail)
                mailSign=false;
        }
         if(usersign==true && mailSign==true){
     //write on json file     
fs.readFile('user.json', 'utf8', function (err, data) {
   if (err) {
       console.log(err)
   } else {
       const file = JSON.parse(data);
       file.users.push({"userName": userName, "password": password, "mail": mail});

       const json = JSON.stringify(file);

       fs.writeFile('user.json', json, 'utf8', function(err){
            if(err){ 
                  console.log(err); 
            } else {
            }});
   }

});
  
     resp.sendFile("index.html",{root:path.join(__dirname,'/files')}); 
    }
        else
         SignupError = true;  
    }
})
      
    }

            
  //Log in    
   else{ 
        firstFlag=false,finalFlag=false,loginError=false;
//read from json file
fs.readFile('user.json','utf8',(err,fileContent)=>{
    if(err){}
    else{
        var data = JSON.parse(fileContent);
        for(var i=0;i<data.users.length;i++){
            if(userName==data.users[i].userName) {
                firstFlag = true;
                if(password==data.users[i].password)
                finalFlag=true;
            }
        }
        
          if(finalFlag) { //if username and password correct
    resp.sendFile("index.html",{root:path.join(__dirname,'/files')});     
          }
    else{
     loginError = true;
      
    }
    }
})
   
}
        
       
}); 
 }
}
           
var id = 0;
var cl = [];
var d = new login();

d.getpage();
d.getData();




s.on('connection',function(ws){   
      console.log("connected");
    ws.on('message',function(message){
    if(loginError){
        console.log("Login Error");
        var object = JSON.parse(message);
        if(firstFlag==false){
       object.data = "User name is wrong";
            object.type = "userLogError";
        }
        else{
         object.data = "Password is wrong"; 
            object.type = "passLogError";
        }
        
         ws.send(JSON.stringify(object));
    }
        if(SignupError){
           console.log("signup Error");
        var object = JSON.parse(message);
        if(usersign==false){
       object.data = "This User name was used";
            object.type = "userSignError";
             ws.send(JSON.stringify(object)); 
        }
        if(mailSign==false){
         object.data = "This email was used"; 
            object.type = "mailSignError";
             ws.send(JSON.stringify(object)); 
        }

        }
     var object = JSON.parse(message);
        console.log("Received: "+object.data+" type: "+object.type);
        if(object.type=="userName"){
            ws.id = object.data;
        cl[ws.id] = ws;
        }
      if(object.type=="txt"){
          if ( cl[object.to] != void 0 ) //if client is open
       cl[object.to].send(object.data);
      }
  
    });
    ws.on('close',function(){
console.log('disconnect');    
});
    
});


