package lab.bd.trabalho.locacaocarro.model;

import java.math.BigDecimal;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "carro")
public class Carro {
	
	@Id
	@Column(name = "placa", length = 8, nullable = false)
	private String placa;
	
	@Column(name = "marca", length = 100, nullable = false)
	private String marca;
	
	@Column(name = "modelo", length = 100, nullable = false)
	private String modelo;
	
	@Column(name = "cor", length = 80, nullable = false)
	private String cor;
	
	@Column(name = "ano", nullable = false)
	private Integer ano;
	
	@Column(name = "tipo_combustivel", length = 80, nullable = false)
	private String tipoCombustivel;
	
	@Column(name = "litros_combustivel", precision = 5, scale = 2, nullable = false)
	private BigDecimal litrosCombustivel;
	
	@Column(name = "km_rodados", precision = 10, scale = 1, nullable = false)
	private BigDecimal kmRodados;
	
	@Column(name = "tipo_cambio", length = 50, nullable = false)
	private String tipoCambio;
	
	@Column(name = "status_carro", length = 50, nullable = false)
	private String statusCarro;
	
	@ManyToOne(targetEntity = Categoria.class, fetch = FetchType.LAZY)
	@JoinColumn(name = "categoria_id", nullable = false)
	private Categoria categoria;

}
