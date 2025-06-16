package lab.bd.trabalho.locacaocarro.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import lab.bd.trabalho.locacaocarro.model.Carro;

public interface CarroRepository extends JpaRepository<Carro, String>{
	
	public Carro findByPlaca(String placa);
	
	public List<Carro> findByMarca(String marca);
	
	public List<Carro> findByModelo(String modelo);
	
	public List<Carro> findByCor(String cor);
	
	public List<Carro> findByAno(Integer ano);
	
	public List<Carro> findByTipoCombustivel(String tipoCombustivel);
	
	public List<Carro> findByTipoCambio(String tipoCambio);
	
	public List<Carro> findByStatusCarro(String statusCarro);
	
	@Query(value = "SELECT c FROM Carro c WHERE c.categoria.nome LIKE ?1")
	public List<Carro> findCarroCategoria(String categoria);
	
	@Query(value = "SELECT * FROM func_carros_disponiveis()", nativeQuery = true)
	public List<Carro> findCarroDisponiveis();

}
