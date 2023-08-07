function calcular(){
    var pago = document.getElementById('valor').value;
    var categoria = document.getElementById('categoria').value;
    var descuento;

    switch(categoria){
        case "1":
            pago = 200 * pago;
            descuento = pago * 0.80
            pago -= descuento;
            break;
        case "2":
            pago = 200 * pago;
            descuento = pago * 0.50
            pago -= descuento;
            break;
        case "3":
            pago = 200 * pago;
            descuento = pago * 0.15
            pago -= descuento;
            break;
    }
    document.getElementById('total').innerHTML = "Total a Pagar: $" + pago;
   	
  	document.getElementById("total_input").value = pago;
}

function limpiarCampos(){
    document.getElementById('nombre').value = "";
    document.getElementById('apellido').value = "";
    document.getElementById('correo').value = "";
    document.getElementById('valor').value = "";
    document.getElementById('categoria').value = "estudiante";
    document.getElementById('total').innerText = "Total a Pagar: $";
}
 
const btnResumenClick = document.getElementById('botonResumen');
btnResumenClick.addEventListener("click",calcular);

const btnLimpiarClick = document.getElementById('botonLimpiar');
btnLimpiarClick.addEventListener("click",limpiarCampos);

