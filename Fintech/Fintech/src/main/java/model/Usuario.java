package model;

import java.time.LocalDate;

public class Usuario {

    private String nm_user;
    private int cd_usuario;
    private String cpf;
    private LocalDate dt_nascimento;
    private String sexo;
    private String ds_email;
    private String ds_profissao;
    private double vl_salario;
    private String senha;

    public Usuario() {
        super();
    }

    public Usuario(int cd_usuario, String nm_user, String cpf, LocalDate dt_nascimento, String sexo,
                   String ds_email, String ds_profissao, double vl_salario, String senha) {
        super();
        this.cd_usuario = cd_usuario;
        this.nm_user = nm_user;
        this.cpf = cpf;
        this.dt_nascimento = dt_nascimento;
        this.sexo = sexo;
        this.ds_email = ds_email;
        this.ds_profissao = ds_profissao;
        this.vl_salario = vl_salario;
        this.senha = senha;
    }

    public String getNomeCompleto() {
        return nm_user;
    }

    public void setNomeCompleto(String nomeCompleto) {
        this.nm_user = nomeCompleto;
    }

    public int getCdUsuario() {
        return cd_usuario;
    }

    public void setCdUsuario(int cd_usuario) {
        this.cd_usuario = cd_usuario;
    }

    public String getNrCpf() {
        return cpf;
    }

    public void setNrCpf(String cpf) {
        this.cpf = cpf;
    }

    public LocalDate getDtAniversario() {
        return dt_nascimento;
    }

    public void setDtAniversario(LocalDate dt_nascimento) {
        this.dt_nascimento = dt_nascimento;
    }

    public String getDsSexo() {
        return sexo;
    }

    public void setDsSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getDsEmail() {
        return ds_email;
    }

    public void setDsEmail(String ds_email) {
        this.ds_email = ds_email;
    }

    public String getDsProfissao() {
        return ds_profissao;
    }

    public void setDsProfissao(String ds_profissao) {
        this.ds_profissao = ds_profissao;
    }

    public double getVlSalario() {
        return vl_salario;
    }

    public void setVlSalario(double vl_salario) {
        this.vl_salario = vl_salario;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }
}
