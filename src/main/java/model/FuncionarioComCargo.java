package model;

public class FuncionarioComCargo {
    private int id;
    private int cargoId;
    private String nome;
    private String dataMatricula;
    private String dataDemissao;
    private String cargoNome;

    public FuncionarioComCargo(int id, String nome, String dataMatricula, String dataDemissao, String cargoNome, int cargoId) {
        this.id = id;
        this.nome = nome;
        this.dataMatricula = dataMatricula;
        this.dataDemissao = dataDemissao;
        this.cargoNome = cargoNome;
        this.cargoId = cargoId;
    }

    // Getters e Setters
    public int getId() { return id; }
    public int getCargoId() { return this.cargoId; }
    public String getNome() { return nome; }
    public String getDataMatricula() { return dataMatricula; }
    public String getDataDemissao() { return dataDemissao; }
    public String getCargoNome() { return cargoNome; }
}
