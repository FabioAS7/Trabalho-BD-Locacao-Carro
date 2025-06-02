package lab.bd.trabalho.locacaocarro.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import lab.bd.trabalho.locacaocarro.model.Locatario;

public interface LocatarioRepository extends JpaRepository<Locatario, String>{

}
