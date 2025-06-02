package lab.bd.trabalho.locacaocarro.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import lab.bd.trabalho.locacaocarro.model.Carro;

public interface CarroRepository extends JpaRepository<Carro, String>{

}
