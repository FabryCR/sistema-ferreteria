package model;

public class user {

    //atributos
    private String idUsuario;
    private String idRol;
    private String contasena;
    private String nombreUsuario;

    //constructor vacio
    public user() {
    }

    public user(String idUsuario, String idRol, String contasena, String nombreUsuario) {
        this.idUsuario = idUsuario;
        this.idRol = idRol;
        this.contasena = contasena;
        this.nombreUsuario = nombreUsuario;
    }

    public String getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(String idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getIdRol() {
        return idRol;
    }

    public void setIdRol(String idRol) {
        this.idRol = idRol;
    }

    public String getContasena() {
        return contasena;
    }

    public void setContasena(String contasena) {
        this.contasena = contasena;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

}
