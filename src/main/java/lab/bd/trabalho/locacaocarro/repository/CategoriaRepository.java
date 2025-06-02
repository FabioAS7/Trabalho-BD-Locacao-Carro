package lab.bd.trabalho.locacaocarro.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import lab.bd.trabalho.locacaocarro.model.Categoria;

public interface CategoriaRepository extends JpaRepository<Categoria, String>{

}
