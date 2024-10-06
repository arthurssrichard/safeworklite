package model;

public class Funcionario {
	private int ID;
	private String nome;
	private String dataMatricula;
	private String dataDemissao;
	
	
	public Funcionario(int iD, String nome, String dataMatricula) {
		super();
		ID = iD;
		this.nome = nome;
		this.dataMatricula = dataMatricula;
	}


	public int getID() {
		return ID;
	}


	public void setID(int iD) {
		ID = iD;
	}


	public String getNome() {
		return nome;
	}


	public void setNome(String nome) {
		this.nome = nome;
	}


	public String getDataMatricula() {
		return dataMatricula;
	}


	public void setDataMatricula(String dataMatricula) {
		this.dataMatricula = dataMatricula;
	}


	public String getDataDemissao() {
		return dataDemissao;
	}


	public void setDataDemissao(String dataDemissao) {
		this.dataDemissao = dataDemissao;
	}
	
	
}
