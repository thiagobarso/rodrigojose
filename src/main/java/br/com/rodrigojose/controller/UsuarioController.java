package br.com.rodrigojose.controller;

import br.com.rodrigojose.bean.Usuario;

public class UsuarioController {

    public static String validar(Usuario usuario){
        String erro = null;

        if(usuario.getNome() == null){
            erro = "O nome está nulo.";
        }

        return erro;
    }
}
