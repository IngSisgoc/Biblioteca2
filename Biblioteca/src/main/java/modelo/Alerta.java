
package modelo;

public class Alerta {
    private int idUsuario;
    private String usuario;
    private String libro;
    private String fechaPrestamo;
    private String fechaVencimiento;
    private int diasPrestamo;
    private int diasRestantes;

    public Alerta(int idUsuario, String usuario, String libro, String fechaPrestamo, String fechaVencimiento, int diasPrestamo, int diasRestantes) {
        this.idUsuario = idUsuario;
        this.usuario = usuario;
        this.libro = libro;
        this.fechaPrestamo = fechaPrestamo;
        this.fechaVencimiento = fechaVencimiento;
        this.diasPrestamo = diasPrestamo;
        this.diasRestantes = diasRestantes;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getFechaPrestamo() {
        return fechaPrestamo;
    }

    public void setFechaPrestamo(String fechaPrestamo) {
        this.fechaPrestamo = fechaPrestamo;
    }

    public int getDiasPrestamo() {
        return diasPrestamo;
    }

    public void setDiasPrestamo(int diasPrestamo) {
        this.diasPrestamo = diasPrestamo;
    }

    public String getUsuario() {
        return usuario;
    }

    public String getLibro() {
        return libro;
    }

    public String getFechaVencimiento() {
        return fechaVencimiento;
    }

    public int getDiasRestantes() {
        return diasRestantes;
    }
}
