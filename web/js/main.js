document.addEventListener("DOMContentLoaded", function () {
  const form = document.getElementById("appointmentForm");
  const appointmentsList = document.getElementById("appointmentsList");

  // Carga las citas existentes al cargar la página
  fetchAppointments();

  // Cuando se envía el formulario
  form?.addEventListener("submit", async function (e) {
    e.preventDefault();

    const data = document.getElementById("data").value;
    const servei = document.getElementById("servei").value;
    const idClient = document.getElementById("idClient").value;
    const idVehicle = document.getElementById("idVehicle").value;

    const cita = {
      data,
      servei,
      id_client: parseInt(idClient),
      id_vehicle: parseInt(idVehicle)
    };

    try {
      const res = await fetch("http://localhost:5000/api/cites", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(cita)
      });

      if (res.ok) {
        form.reset();
        fetchAppointments(); // Recarga las citas
      } else {
        alert("Error en guardar la cita.");
      }
    } catch (error) {
      console.error("Error al enviar la cita:", error);
    }
  });

  // Función para cargar citas
  async function fetchAppointments() {
    try {
      const res = await fetch("http://localhost:5000/api/cites");
      const cites = await res.json();

      // Limpia la lista actual
      appointmentsList.innerHTML = "";

      if (!Array.isArray(cites)) {
        console.error("Respuesta inesperada:", cites);
        return;
      }

      // Añade cada cita a la lista
      cites.forEach(cita => {
        const li = document.createElement("li");
        li.textContent = `📅 ${cita.data} | 🛠️ Servei: ${cita.servei} | 👤 Client ID: ${cita.id_client} | 🚗 Vehicle ID: ${cita.id_vehicle}`;
        appointmentsList.appendChild(li);
      });
    } catch (error) {
      console.error("Error al cargar las citas:", error);
    }
  }
});
