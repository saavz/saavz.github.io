
let carrito = [];

function agregarAlCarrito(btn) {
  const producto = btn.parentElement;
  const nombre = producto.dataset.nombre;
  const precio = parseInt(producto.dataset.precio);

  carrito.push({ nombre, precio });
  actualizarCarrito();
}

function actualizarCarrito() {
  const lista = document.getElementById('lista-carrito');
  const total = document.getElementById('total');
  lista.innerHTML = '';
  let suma = 0;

  carrito.forEach((item, index) => {
    const li = document.createElement('li');
    li.innerHTML = `
      ${item.nombre} - $${item.precio.toLocaleString()}
      <button onclick="eliminarDelCarrito(${index})">❌</button>
    `;
    lista.appendChild(li);
    suma += item.precio;
  });

  total.textContent = suma.toLocaleString();
}

function eliminarDelCarrito(index) {
  carrito.splice(index, 1);
  actualizarCarrito();
}

function toggleCart() {
  const carritoSec = document.getElementById('carrito');
  carritoSec.classList.toggle('oculto');
  document.getElementById('pago').classList.add('oculto');
  document.getElementById('confirmacion').classList.add('oculto');
  window.scrollTo({
    top: document.body.scrollHeight,
    behavior: "smooth"
  });
}

function mostrarPago() {
  document.getElementById('pago').classList.remove('oculto');
  document.getElementById('carrito').classList.add('oculto');
}

function confirmarPago(event) {
  event.preventDefault();
  carrito = [];
  actualizarCarrito();
  document.getElementById('pago').classList.add('oculto');
  document.getElementById('confirmacion').classList.remove('oculto');
}
