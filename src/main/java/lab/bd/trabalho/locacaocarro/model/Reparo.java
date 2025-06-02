package lab.bd.trabalho.locacaocarro.model;

import java.math.BigDecimal;
import java.time.LocalDate;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
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
@Table(name = "reparo")
public class Reparo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false)
	private Integer id;
	
	@Column(name = "dia_entrada", nullable = false)
	private LocalDate diaEntrada;
	
	@Column(name = "quant_dias_reparo", nullable = false)
	private int quantDiasReparo;
	
	@Column(name = "descricao_problema", length = 255, nullable = false)
	private String descricaoProblema;
	
	@Column(name = "valor_reparo", precision = 9, scale = 2, nullable = false)
	private BigDecimal valorReparo;
	
	@ManyToOne(targetEntity = Carro.class, fetch = FetchType.LAZY)
	@JoinColumn(name = "carro_placa", nullable = false)
	private Carro carro;

}
