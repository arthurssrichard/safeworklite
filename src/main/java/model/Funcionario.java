package model;

public class Funcionario {
	private int ID;
	private String nome;
	private String dataMatricula;
	private String dataDemissao;
	private Cargo cargo;
	private int ID_setor;
	
	
	public Funcionario(int iD, String nome, String dataMatricula) {
		super();
		this.ID = iD;
		this.nome = nome;
		this.dataMatricula = dataMatricula;
	}
	
	
	public Funcionario(String nome, String dataMatricula, Cargo cargo, int iD_setor) {
		super();
		this.nome = nome;
		this.dataMatricula = dataMatricula;
		this.cargo = cargo;
		this.ID_setor = iD_setor;
	}

	public Funcionario(int iD, String nome, String dataMatricula, Cargo cargo, int iD_setor) {
		super();
		this.ID = iD;
		this.nome = nome;
		this.dataMatricula = dataMatricula;
		this.cargo = cargo;
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


	public Cargo getCargo() {
		return cargo;
	}


	public void setCargo(Cargo cargo) {
		this.cargo = cargo;
	}


	public int getID_setor() {
		return ID_setor;
	}




	public void setID_setor(int iD_setor) {
		ID_setor = iD_setor;
	}
	
	
	
}
