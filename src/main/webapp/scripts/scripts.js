document.addEventListener("DOMContentLoaded", (event) => {
  toggleDado();
});
function toggleDado() {
    var tipoDado = document.getElementById("tipo-dado").value;
    var valorNumerico = document.getElementById("valor-numerico");
    var valorBooleano = document.getElementById("valor-booleano");

    if (tipoDado === "numerico") {
        valorNumerico.style.display = "block";
        valorBooleano.style.display = "none";
    } else {
        valorNumerico.style.display = "none";
        valorBooleano.style.display = "block";
    }
}