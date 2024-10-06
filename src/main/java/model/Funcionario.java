package model;

public class Funcionario {
	private int ID;
	private String nome;
	private String dataMatricula;
	private String dataDemissao;
	private int ID_cargo;
	private int ID_setor;
	
	
	public Funcionario(int iD, String nome, String dataMatricula) {
		super();
		this.ID = iD;
		this.nome = nome;
		this.dataMatricula = dataMatricula;
	}
	
	
	public Funcionario(String nome, String dataMatricula, int iD_cargo, int iD_setor) {
		super();
		this.nome = nome;
		this.dataMatricula = dataMatricula;
		this.ID_cargo = iD_cargo;
		this.ID_setor = iD_setor;
	}

	


	public Funcionario(int iD, String nome, String dataMatricula, String dataDemissao, int iD_cargo, int iD_setor) {
		super();
		this.ID = iD;
		this.nome = nome;
		this.dataMatricula = dataMatricula;
		this.dataDemissao = dataDemissao;
		this.ID_cargo = iD_cargo;
		this.ID_setor = iD_setor;
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




	public int getID_cargo() {
		return ID_cargo;
	}




	public void setID_cargo(int iD_cargo) {
		ID_cargo = iD_cargo;
	}




	public int getID_setor() {
		return ID_setor;
	}




	public void setID_setor(int iD_setor) {
		ID_setor = iD_setor;
	}
	
	
	
}
