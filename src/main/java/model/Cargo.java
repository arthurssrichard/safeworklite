package model;

import java.util.ArrayList;

public class Cargo {
	private int ID;
	private String nome;
	private String descricao;
	private EmpresaSetor setor;
	public Cargo() {
		
	}

	public Cargo(String nome, String descricao, EmpresaSetor setor) {
		super();
		this.nome = nome;
		this.descricao = descricao;
		this.setor = setor;
	}

	public Cargo(int ID, String nome, String descricao) {
		this.ID = ID;
		this.nome = nome;
		this.descricao = descricao;
	}
	
	public Cargo(String nome, String descricao) {
		this.nome = nome;
		this.descricao = descricao;
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
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public EmpresaSetor getSetor() {
		return setor;
	}

	public void setSetor(EmpresaSetor setor) {
		this.setor = setor;
	}
	
	
	

	
}
