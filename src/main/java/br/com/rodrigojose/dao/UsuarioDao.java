package br.com.rodrigojose.dao;

import br.com.rodrigojose.bean.Usuario;

import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDao {

    public static String ROLE_ADMIN = "admin_role";
    public static String ROLE_OPERADOR = "operador_role";

    public static Connection getConnection() {
        Connection con = null;
        try {
            InitialContext cxt = new InitialContext();
            if (cxt == null) {
                throw new Exception("Uh oh -- no context!");
            }
            DataSource ds = (DataSource) cxt.lookup("java:/comp/env/jdbc/pgDatasource");
            if (ds == null) {
                throw new Exception("Data source not found!");
            }
            con = ds.getConnection();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return con;
    }

    public static int save(Usuario u) {
        int status = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(
                    "insert into app.usuario(login,nome,senha,email,id_perfil, ativo) values(?,?,?,?,?,?)");
            ps.setString(1, u.getLogin());
            ps.setString(2, u.getNome());
            ps.setString(3, u.getSenha());
            ps.setString(4, u.getEmail());
            ps.setInt(5, u.getPerfil());
            ps.setBoolean(6, Boolean.FALSE);
            status = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }

    public static int update(Usuario u) {
        int status = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(
                    "UPDATE app.usuario SET login=? , nome=? , senha=? , email=? , id_perfil=?, ativo = ? where id_usuario=?");
            ps.setString(1, u.getLogin());
            ps.setString(2, u.getNome());
            ps.setString(3, u.getSenha());
            ps.setString(4, u.getEmail());
            ps.setInt(5, u.getPerfil());
            ps.setInt(6, u.getId());
            ps.setBoolean(7, u.getAtivo());
            status = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }

    public static int delete(Usuario u) {
        int status = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("delete from app.usuario where id_usuario=?");
            ps.setInt(1, u.getId());
            status = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

        return status;
    }

    public static List<Usuario> getAllRecords() {
        List<Usuario> list = new ArrayList<Usuario>();

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from app.usuario order by nome asc");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Usuario u = retornaUsuario(rs);
                list.add(u);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public static Usuario getRecordById(int id) {
        Usuario u = null;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from app.usuario where id_usuario=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                u = retornaUsuario(rs);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return u;
    }

    private static Usuario retornaUsuario(ResultSet rs) throws SQLException {
        Usuario u = new Usuario();
        u.setId(rs.getInt("id_usuario"));
        u.setLogin(rs.getString("login"));
        u.setNome(rs.getString("nome"));
        u.setSenha(rs.getString("senha"));
        u.setEmail(rs.getString("email"));
        u.setPerfil(rs.getInt("id_perfil"));
        u.setAtivo(rs.getBoolean("ativo"));
        return u;
    }

    public static int ativarUsuario(int id, Boolean valor) {
        int status = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(
                    "UPDATE app.usuario SET ativo = ? where id_usuario=?");
            ps.setBoolean(1, valor);
            ps.setInt(2, id);
            status = ps.executeUpdate();

            if (status == 1) {
                Usuario usuario = getRecordById(id);
                status = copiaUsuarioParaJaas(usuario, valor);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return status;

    }

    public static int copiaUsuarioParaJaas(Usuario usuario, Boolean valor) {
        int status = 0;
        try {
            Connection con = getConnection();
            if (valor == true) {
                PreparedStatement jaasUser =
                        con.prepareStatement(
                                "INSERT INTO jaas.users(user_name,user_pass) VALUES (?,?)");
                jaasUser.setString(1, usuario.getLogin());
                jaasUser.setString(2, usuario.getSenha());
                status = jaasUser.executeUpdate();

                if (status == 1) {
                    PreparedStatement jaasUserRole =
                            con.prepareStatement(
                                    "INSERT INTO jass.user_roles (user_name, role_name) VALUES (?,?);");
                    jaasUserRole.setString(1, usuario.getLogin());
                    jaasUserRole.setString(2, usuario.getPerfil().equals("admin") ? ROLE_ADMIN : ROLE_OPERADOR);
                    status = jaasUserRole.executeUpdate();
                }
            } else {
                PreparedStatement jaasUser =
                        con.prepareStatement(
                                "DELETE FROM jaas.users WHERE user_name = ?");
                jaasUser.setString(1, usuario.getLogin());
                status = jaasUser.executeUpdate();

                if (status == 1) {
                    PreparedStatement jaasUserRole =
                            con.prepareStatement(
                                    "DELETE FROM jaas.user_roles WHERE user_name = ?");
                    jaasUserRole.setString(1, usuario.getLogin());
                    status = jaasUserRole.executeUpdate();
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return status;

    }


}