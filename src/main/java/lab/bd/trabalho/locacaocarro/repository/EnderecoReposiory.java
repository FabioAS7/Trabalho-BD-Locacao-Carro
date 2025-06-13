package lab.bd.trabalho.locacaocarro.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import lab.bd.trabalho.locacaocarro.model.Endereco;
import lab.bd.trabalho.locacaocarro.model.Locatario;

public interface EnderecoReposiory extends JpaRepository<Endereco, Integer> {
	
	@Modifying
	@Transactional
	@Query(value =  "DELETE Endereco e WHERE e.locatario.cpf = ?1")
	public void deleteAllLocatario(String cpf);
	
	public List<Endereco> findByLocatario(Locatario locatario);
}
