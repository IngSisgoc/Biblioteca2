<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page language="java" %>
<%@ page import="java.util.*" %>
<html>
<head>
  <title>Exportar Reporte</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="p-4">
  <h3>Exportar Reporte Mensual</h3>

  <form method="post" action="ReporteServlet">
    <div class="mb-3">
      <label for="mes" class="form-label">Selecciona el mes</label>
      <select class="form-select" name="mes" id="mes" required>
        <option value="">-- Selecciona --</option>
        <%
          String[] meses = {"Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio",
                           "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"};
          for (int i = 0; i < meses.length; i++) {
        %>
          <option value="<%= (i + 1) %>"><%= meses[i] %></option>
        <% } %>
      </select>
    </div>
    <div class="mb-3">
      <label for="anio" class="form-label">Selecciona el año</label>
      <input type="number" name="anio" id="anio" class="form-control" required min="2000" max="2100" value="2025" />
    </div>
    <button type="submit" class="btn btn-primary">Exportar</button>
  </form>
</body>
</html>

