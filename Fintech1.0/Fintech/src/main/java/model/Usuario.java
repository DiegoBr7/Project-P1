package model;

import java.util.Date;

public class Usuario {
    private int cdUsuario;
    private String cpf;
    private String nmUser;
    private String dsEmail;
    private Date dtNascimento;
    private char sexo;
    private String dsProfissao;
    private double vlSalario;
    private String senha;

    // Getters e Setters

    public int getCdUsuario() {
        return cdUsuario;
    }

    public void setCdUsuario(int cdUsuario) {
        this.cdUsuario = cdUsuario;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getNome() {
        return nmUser;
    }

    public void setNome(String nmUser) {
        this.nmUser = nmUser;
    }

    public String getEmail() {
        return dsEmail;
    }

    public void setEmail(String dsEmail) {
        this.dsEmail = dsEmail;
    }

    public Date getDataNascimento() {
        return dtNascimento;
    }

    public void setDataNascimento(Date dtNascimento) {
        this.dtNascimento = dtNascimento;
    }

    public char getSexo() {
        return sexo;
    }

    public void setSexo(char sexo) {
        this.sexo = sexo;
    }

    public String getProfissao() {
        return dsProfissao;
    }

    public void setProfissao(String dsProfissao) {
        this.dsProfissao = dsProfissao;
    }

    public double getSalario() {
        return vlSalario;
    }

    public void setSalario(double vlSalario) {
        this.vlSalario = vlSalario;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }
}
