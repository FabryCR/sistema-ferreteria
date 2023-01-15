package gestion;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Conexion;
import model.user;

public class LoginGestion {

    private static final String SQL_VALIDA = "Select * from usuario where nombreUsuario=? and contrasena=MD5(?)";

    public static user valida(String nombreUsuario, String contrasena) {
        user usuario = null;
        try {
            PreparedStatement ps = Conexion.getConexion().prepareStatement(SQL_VALIDA);
            ps.setString(1, nombreUsuario);
            ps.setString(2, contrasena);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                usuario = new user();
                //asignar a usuario los parametros de las variables de la clase model
                usuario.setNombreUsuario(nombreUsuario);
                usuario.setContasena(contrasena);
                usuario.setIdRol(rs.getString(2));
            }//if

        } catch (SQLException ex) {

            Logger.getLogger(LoginGestion.class.getName()).log(Level.SEVERE, null, ex);

        }//try/catch
        
        return usuario;

    }//metodo usuario
}