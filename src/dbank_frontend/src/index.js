import { dbank_backend } from "../../declarations/dbank_backend";
import express from 'express';
import bodyParser from 'body-parser';

document.querySelector("form").addEventListener("submit", async (e) => {
  e.preventDefault();
  const button = e.target.querySelector("button");

  const name = document.getElementById("name").value.toString();

  button.setAttribute("disabled", true);

  // Interact with foo actor, calling the greet method
  const greeting = await dbank_backend.greet(name);

  button.removeAttribute("disabled");

  document.getElementById("greeting").innerText = greeting;

  

  return false;
});

// document.getElementById("login").addEventListener("click", function() {
//   // Replace "target-page.html" with the actual URL or file path of the page you want to open
//   window.location.href = "login.html";
// });
// document.getElementById("signup").addEventListener("click", function() {
//   // Replace "target-page.html" with the actual URL or file path of the page you want to open
//   window.location.href = "signup.html";
  
// });


//node 
const app = express();


app.use(bodyParser.urlencoded({extended:true}));

app.get("/",function(req,res){
  res.sendFile(__dirname+"../src/index.html");
})

app.get("/login",function(req,res){
  res.sendFile(__dirname+"/login.html");
})

app.get("/signup",function(req,res){
  res.sendFile(__dirname+"/signup.html");
})

app.listen(8080,function(){
  console.log("Started serving 3000");
})
