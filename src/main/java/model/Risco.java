package model;

public class Risco {
	private int ID;
	private EmpresaSetor setor;
	private String nome;
	private String observacao;
	private String descricao;
	
	public Risco(){
		
	}

	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public EmpresaSetor getSetor() {
		return setor;
	}
	public void setSetor(EmpresaSetor setor) {
		this.setor = setor;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getObservacao() {
		return observacao;
	}
	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
}
