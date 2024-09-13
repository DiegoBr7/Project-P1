package model;

public class Valor {
    private int usuarioId;
    private double valor;

    public Valor(int usuarioId, double valor) {
        this.usuarioId = usuarioId;
        this.valor = valor;
    }

    public int getUsuarioId() {
        return usuarioId;
    }

    public void setUsuarioId(int usuarioId) {
        this.usuarioId = usuarioId;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }
}
