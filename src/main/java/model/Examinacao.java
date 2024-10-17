package model;

public class Examinacao {
	private int id;
	private Funcionario funcionario;
	private Exame exame;
	private String dataRealizada;
	private String tipoDado;
	private double resultadoNumerico;
	private boolean resultadoBooleano;
	
	public Examinacao(Funcionario funcionario, Exame exame, String dataRealizada, String tipoDado,
			double resultadoNumerico, boolean resultadoBooleano) {
		super();
		this.funcionario = funcionario;
		this.exame = exame;
		this.dataRealizada = dataRealizada;
		this.tipoDado = tipoDado;
		this.resultadoNumerico = resultadoNumerico;
		this.resultadoBooleano = resultadoBooleano;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Funcionario getFuncionario() {
		return funcionario;
	}
	public void setFuncionario(Funcionario funcionario) {
		this.funcionario = funcionario;
	}
	public Exame getExame() {
		return exame;
	}
	public void setExame(Exame exame) {
		this.exame = exame;
	}
	public String getDataRealizada() {
		return dataRealizada;
	}
	public void setDataRealizada(String dataRealizada) {
		this.dataRealizada = dataRealizada;
	}
	public String getTipoDado() {
		return tipoDado;
	}
	public void setTipoDado(String tipoDado) {
		this.tipoDado = tipoDado;
	}
	public double getResultadoNumerico() {
		return resultadoNumerico;
	}
	public void setResultadoNumerico(double resultadoNumerico) {
		this.resultadoNumerico = resultadoNumerico;
	}
	public boolean getResultadoBooleano() {
		return resultadoBooleano;
	}
	public void setResultadoBooleano(boolean resultadoBooleano) {
		this.resultadoBooleano = resultadoBooleano;
	}
	
	
}
