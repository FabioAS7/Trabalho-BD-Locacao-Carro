package lab.bd.trabalho.locacaocarro.model;

import java.time.LocalDate;
import org.hibernate.annotations.Formula;
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
@Table(name = "aluguel_de_carro")
public class AluguelDeCarro {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false)
	private Integer id;
	
	@ManyToOne(targetEntity = Carro.class, fetch = FetchType.LAZY)
	@JoinColumn(name = "carro_placa", nullable = false)
	private Carro carro;

	@ManyToOne(targetEntity = Locatario.class, fetch = FetchType.LAZY)
	@JoinColumn(name = "locatario_cpf", nullable = false)
	private Locatario locatario;
	
	@Column(name = "data_retirada", nullable = false)
	private LocalDate dataRetirada;
	
	@Column(name = "data_devolucao", nullable = false)
	private LocalDate dataDevolucao;
	
	//Nao vai pro banco de dados esse atributo
	@Formula("DATEDIFF(DAY, data_retirada, data_devolucao)")
	private int quantDiasAlugado;

}
