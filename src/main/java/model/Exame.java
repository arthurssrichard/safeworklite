package model;

public class Exame {
	private int id;
	private int idSetor;
	private String nome;
	private String descricao;
	private boolean demissao;
	private boolean admissao;
	private boolean retornoAoTrabalho;
	private int vezesPorAno;
	
	private String resultadoNomeDado;
	private String resultadoTipoDado;
	private int[] resultadoNumericoEsperado;
	private boolean resultadoBooleanoEsperado;

	public Exame(int idSetor, 
				String nome, 
				String descricao, 
				boolean demissao, 
				boolean admissao,
				boolean retornoAoTrabalho, 
				int vezesPorAno, 
				String resultadoNomeDado,
				String resultadoTipoDado,
				int[] resultadoNumericoEsperado, 
				boolean resultadoBooleanoEsperado) {
		super();
		this.idSetor = idSetor;
		this.nome = nome;
		this.descricao = descricao;
		this.demissao = demissao;
		this.admissao = admissao;
		this.retornoAoTrabalho = retornoAoTrabalho;
		this.vezesPorAno = vezesPorAno;
		this.resultadoNomeDado = resultadoNomeDado;
		this.resultadoTipoDado = resultadoTipoDado;
		this.resultadoNumericoEsperado = resultadoNumericoEsperado;
		this.resultadoBooleanoEsperado = resultadoBooleanoEsperado;
	}
	
	public Exame(int id, String nome, String descricao, String resultadoNomeDado) {
		super();
		this.id = id;
		this.nome = nome;
		this.descricao = descricao;
		this.resultadoNomeDado = resultadoNomeDado;
	}

	public Exame(int id, String nome, String resultadoNomeDado) {
		super();
		this.id = id;
		this.nome = nome;
		this.resultadoNomeDado = resultadoNomeDado;
	}
	
	public Exame() {}

	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public int getIdSetor() {
		return idSetor;
	}


	public void setIdSetor(int idSetor) {
		this.idSetor = idSetor;
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


	public boolean isDemissao() {
		return demissao;
	}


	public void setDemissao(boolean demissao) {
		this.demissao = demissao;
	}


	public boolean isRetornoAoTrabalho() {
		return retornoAoTrabalho;
	}


	public void setRetornoAoTrabalho(boolean retornoAoTrabalho) {
		this.retornoAoTrabalho = retornoAoTrabalho;
	}


	public int getVezesPorAno() {
		return vezesPorAno;
	}


	public void setVezesPorAno(int vezesPorAno) {
		this.vezesPorAno = vezesPorAno;
	}


	public boolean isAdmissao() {
		return admissao;
	}


	public void setAdmissao(boolean admissao) {
		this.admissao = admissao;
	}


	public String getResultadoNomeDado() {
		return resultadoNomeDado;
	}


	public void setResultadoNomeDado(String resultadoNomeDado) {
		this.resultadoNomeDado = resultadoNomeDado;
	}


	public String getResultadoTipoDado() {
		return resultadoTipoDado;
	}


	public void setResultadoTipoDado(String resultadoTipoDado) {
		this.resultadoTipoDado = resultadoTipoDado;
	}


	public int[] getResultadoNumericoEsperado() {
		return resultadoNumericoEsperado;
	}


	public void setResultadoNumericoEsperado(int[] resultadoNumericoEsperado) {
		this.resultadoNumericoEsperado = resultadoNumericoEsperado;
	}


	public boolean getResultadoBooleanoEsperado() {
		return resultadoBooleanoEsperado;
	}


	public void setResultadoBooleanoEsperado(boolean resultadoBooleanoEsperado) {
		this.resultadoBooleanoEsperado = resultadoBooleanoEsperado;
	}
	
	
	
}
