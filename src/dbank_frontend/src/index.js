import { dbank_backend } from "../../declarations/dbank_backend";

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

document.getElementById("login").addEventListener("click", function() {
  // Replace "target-page.html" with the actual URL or file path of the page you want to open
  window.location.href = "login.html";
});
