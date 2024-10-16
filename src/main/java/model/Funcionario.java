package model;

public class Funcionario {
	private int ID;
	private String nome;
	private String dataMatricula;
	private String dataDemissao;
	private Cargo cargo;
	private EmpresaSetor setor;
	
	
	public Funcionario(int iD, String nome, String dataMatricula) {
		super();
		this.ID = iD;
		this.nome = nome;
		this.dataMatricula = dataMatricula;
	}
	public Funcionario(int iD, String nome, String dataMatricula, String dataDemissao, Cargo cargo) {
		super();
		this.ID = iD;
		this.nome = nome;
		this.dataMatricula = dataMatricula;
		this.dataDemissao = dataDemissao;
		this.cargo = cargo;
	}
	
	
	
	public Funcionario(String nome, String dataMatricula, Cargo cargo, EmpresaSetor setor) {
		super();
		this.nome = nome;
		this.dataMatricula = dataMatricula;
		this.cargo = cargo;
		this.setor = setor;
	}

	public Funcionario(int iD, String nome, String dataMatricula, Cargo cargo, EmpresaSetor setor) {
		super();
		this.ID = iD;
		this.nome = nome;
		this.dataMatricula = dataMatricula;
		this.cargo = cargo;
		this.setor = setor;
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


	public EmpresaSetor getSetor() {
		return setor;
	}


	public void setSetor(EmpresaSetor setor) {
		this.setor = setor;
	}

}
