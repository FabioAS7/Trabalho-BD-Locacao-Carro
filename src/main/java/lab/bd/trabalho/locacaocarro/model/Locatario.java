package lab.bd.trabalho.locacaocarro.model;

import java.time.LocalDate;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
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
@Table(name = "locatario")
public class Locatario {
	
	@Id
	@Column(name = "cpf", length = 11, nullable = false)
	private String cpf;
	
	@Column(name = "nome", length = 90, nullable = false)
	private String nome;
	
	@Column(name = "num_habilitacao", length = 11, nullable = false)
	private String numHabilitacao;
	
	@Column(name = "data_nascimento", nullable = false)
	private LocalDate dataNascimento;

}
