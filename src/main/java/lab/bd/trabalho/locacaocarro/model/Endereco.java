package lab.bd.trabalho.locacaocarro.model;

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
@Table(name = "endereco")
public class Endereco {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false)
	private Integer id; 
	
	@Column(name = "lougradouro_endereco", length = 100, nullable = false)
	private String lougradouroEndereco;
	
	@Column(name = "lougradouro_num", length = 4, nullable = false)
	private String lougradouroNum;
	
	@Column(name = "lougradouro_cep", length = 8, nullable = false)
	private String lougradouroCep;
	
	@Column(name = "lougradouro_cidade", length = 100, nullable = false)
	private String lougradouroCidade;
	
	@ManyToOne(targetEntity = Locatario.class, fetch = FetchType.LAZY)
	@JoinColumn(name = "locatario_cpf", nullable = false)
	private Locatario locatario;
	
}