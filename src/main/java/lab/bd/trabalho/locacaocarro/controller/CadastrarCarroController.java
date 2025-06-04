package lab.bd.trabalho.locacaocarro.controller;

import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import lab.bd.trabalho.locacaocarro.model.Carro;
import lab.bd.trabalho.locacaocarro.model.Categoria;
import lab.bd.trabalho.locacaocarro.repository.CarroRepository;
import lab.bd.trabalho.locacaocarro.repository.CategoriaRepository;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Controller
public class CadastrarCarroController {

	@Autowired
	public CarroRepository carroR;

	@Autowired
	public CategoriaRepository categoriaR;

	@RequestMapping(name = "cadastrar_carro", value = "/cadastrar_carro", method = RequestMethod.GET)
	public ModelAndView CadastrarCarroGet(@RequestParam Map<String, String> params, ModelMap model) {
		String placa = params.get("id");
		String acao = params.get("acao");
		String saida = "";
		String erro = "";
		Carro carro = new Carro();
		List<Carro> carros = new ArrayList<Carro>();
		List<Categoria> categorias = new ArrayList<Categoria>();

		// Adiciona categorias para o DropBox no .JSP
		try {
			categorias = categoriaR.findAll();
			model.addAttribute("categorias", categorias);
		} catch (Exception e) {
			erro = e.getMessage();
		}

		// Controle dos botoes excluir e editar
		try {
			
			if (placa != null && acao != null && acao.equals("editar")) {
				carro = carroR.getReferenceById(placa);
				carros = null;
				model.addAttribute("carros", carros);
			}

			if (acao.equals("excluir")) {
				carroR.delete(carro);
				carros = carroR.findAll();
				carro = null;
				saida = "Carro removido da frota com sucesso";
			}
			
		} catch (Exception e) {
			erro = e.getMessage();
		}

		model.addAttribute("erro", erro);
		model.addAttribute("saida", saida);
		model.addAttribute("carro", carro);
		return new ModelAndView("cadastrar_carro", model);
	}

	@RequestMapping(name = "cadastrar_carro", value = "/cadastrar_carro", method = RequestMethod.POST)
	public ModelAndView CadastrarCarroPost(@RequestParam Map<String, String> params, ModelMap model) {
		String placa = params.get("placa");
		String marca = params.get("marca");
		String modelo = params.get("modelo");
		String cor = params.get("cor");
		String ano = params.get("ano");
		String tipoCombustivel = params.get("tipo_combustivel");
		String litrosCombustivel = params.get("litros_combustivel");
		String kmRodados = params.get("km_rodados");
		String tipoCambio = params.get("tipo_cambio");
		String statusCarro = params.get("status_carro");
		String categoria = params.get("categoria_id");
		String cmd = params.get("botao");
		String saida = "";
		String erro = "";
		Carro carro = new Carro();
		List<Carro> carros = new ArrayList<Carro>();
		List<Categoria> categorias = new ArrayList<Categoria>();

		// Adiciona categorias para o DropBox la no fundo .JSP
		try {
			categorias = categoriaR.findAll();
			model.addAttribute("categorias", categorias);
		} catch (Exception e) {
			erro = e.getMessage();
		}

		try {
			// Botao "Listar"
			if (cmd.equalsIgnoreCase("Listar")) {
				carros = carroR.findAll();
			} else if (cmd.equalsIgnoreCase("PesquisarPlaca")) { // Botoes de pesuisa indiviuais
				carros = (List<Carro>) carroR.findByPlaca(placa);
			} else if (cmd.equalsIgnoreCase("PesquisarMarca")) {
				carros = carroR.findByMarca(marca);
			} else if (cmd.equalsIgnoreCase("PesquisarModelo")) {
				carros = carroR.findByModelo(modelo);
			} else if (cmd.equalsIgnoreCase("PesquisarCor")) {
				carros = carroR.findByCor(cor);
			} else if (cmd.equalsIgnoreCase("PesquisarAno")) {
				carros = carroR.findByAno(LocalDate.parse(ano));
			} else if (cmd.equalsIgnoreCase("PesquisarTipoDeCombustivel")) {
				carros = carroR.findByTipoCombustivel(tipoCombustivel);
			} else if (cmd.equalsIgnoreCase("PesquisarTipoDeCambio")) {
				carros = carroR.findByTipoCambio(tipoCambio);
			} else if (cmd.equalsIgnoreCase("PesquisarStatus")) {
				carros = carroR.findByStatusCarro(statusCarro);
			} else if (cmd.equalsIgnoreCase("PesquisarCategoria")) {
				carros = carroR.findCarroCategoria(categoria);
			}

			// Botao "Adicionar"
			if (cmd.equalsIgnoreCase("Adicionar")) {
				carro.setPlaca(placa);
				carro.setMarca(marca);
				carro.setModelo(modelo);
				carro.setCor(cor);
				carro.setAno(LocalDate.parse(ano));
				carro.setTipoCombustivel(tipoCombustivel);
				carro.setLitrosCombustivel(new BigDecimal(litrosCombustivel));
				carro.setKmRodados(new BigDecimal(kmRodados));
				carro.setTipoCambio(tipoCambio);
				carro.setStatusCarro(statusCarro);
				Categoria c = categoriaR.findById(Integer.parseInt(categoria)).orElse(null);
				carro.setCategoria(c);
				carroR.save(carro);
				saida = "Carro adicionado a frota com sucesso";
			}

			// Botao "Remover"
			if (cmd.equalsIgnoreCase("Remover")) {
				carroR.deleteById(placa);
				saida = "Carro deletado com sucesso";
			}

		} catch (Exception e) {
			if (e.getMessage().contains("truncados na tabela")) {
				erro = "Um ou mais campos ultrapassaram o tamanho permitido";
			} else {
				erro = e.getMessage();
			}
		}

		model.addAttribute("erro", erro);
		model.addAttribute("saida", saida);
		model.addAttribute("carros", carros);
		return new ModelAndView("cadastrar_carro");
	}

}
