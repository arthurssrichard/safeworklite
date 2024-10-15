package model;

public class EmpresaSetor {
	private int ID;
	private String nome_empresa;
	private String nome_setor;
	private String senha;
	
	public EmpresaSetor(String nome_empresa, String nome_setor, String senha) {
		super();
		this.nome_empresa = nome_empresa;
		this.nome_setor = nome_setor;
		this.senha = senha;
	}
	
	public EmpresaSetor() {

	}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public String getNome_empresa() {
		return nome_empresa;
	}

	public void setNome_empresa(String nome_empresa) {
		this.nome_empresa = nome_empresa;
	}

	public String getNome_setor() {
		return nome_setor;
	}

	public void setNome_setor(String nome_setor) {
		this.nome_setor = nome_setor;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}
	
	
}
