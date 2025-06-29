package lab.bd.trabalho.locacaocarro.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
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
		List<Categoria> categorias = new ArrayList<Categoria>();

		// Adiciona categorias para o DropBox no .JSP
		try {
			categorias = categoriaR.findAll();
			model.addAttribute("categorias", categorias);
		} catch (Exception e) {
			erro = e.getMessage();
		}

		if (params.get("id") != null && !params.get("id").isEmpty()) {
			placa = params.get("id");
		}

		// Controle dos botoes excluir e editar
		try {
			if (params.get("id") != null && !params.get("id").isEmpty()) {

				if (acao.equalsIgnoreCase("editar")) {
					carro = carroR.getReferenceById(placa);

				} else if (acao.equalsIgnoreCase("excluir")) {
					carro = carroR.getReferenceById(placa);
					carroR.deleteById(placa);
					saida = "Carro (" + carro.getPlaca() + ") removido da frota com sucesso";
					carro = null;
				}
			}
		} catch (Exception e) {

			if (e.getMessage().contains("FK74srjkqum99t03ftfoj5v425r")) {
				erro = "O carro esta sendo referenciado na tabela de carros alugados";
			} else if (e.getMessage().contains("truncados na tabela")) {
				erro = "Um ou mais campos ultrapassaram o tamanho permitido";
			} else if (e.getMessage().contains("FK74srjkqum99t03ftfoj5v425r")) {
				erro = "O carro esta sendo referenciado na tabela de carros alugados";
			} else if (e.getMessage().contains("\"filtro\" is null")) {
				erro = "Informe um dado valido para realizar a filtragem";
			} else if (e.getMessage().contains("Text '' could not be parsed at index 0")) {
				erro = "Todos os campos devem ser preenchidos";
			} else {
				erro = e.getMessage();
			}

		}

		model.addAttribute("erro", erro);
		model.addAttribute("saida", saida);
		model.addAttribute("carro", carro);
		return new ModelAndView("cadastrar_carro", model);
	}

	@RequestMapping(name = "cadastrar_carro", value = "/cadastrar_carro", method = RequestMethod.POST)
	public ModelAndView CadastrarCarroPost(@RequestParam Map<String, String> params, ModelMap model) {
		String placa = params.get("placa").toUpperCase();
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
		String filtro = params.get("filtro");
		String txtFiltro = params.get("filtroTexto");
		String txtFiltro1 = params.get("filtroTexto1");
		String txtFiltro2 = params.get("filtroTexto2");
		String txtFiltro3 = params.get("filtroTexto3");
		String filtroTextoCat = params.get("filtroTextoCat");
		String cmd = params.get("botao");
		String saida = "";
		String erro = "";
		boolean existente = false;
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
				carro = carroR.findByPlaca(placa);
				model.addAttribute("carro", carro);
			} else if (cmd.equalsIgnoreCase("Filtrar")) {
				switch (filtro) {
				case ("Marca"):
					carros = carroR.findByMarca(txtFiltro);
					break;
				case ("Modelo"):
					carros = carroR.findByModelo(txtFiltro);
					break;
				case ("Cor"):
					carros = carroR.findByCor(txtFiltro);
					break;
				case ("Ano"):
					carros = carroR.findByAno(Integer.parseInt(txtFiltro));
					break;
				case ("TipoCombustivel"):
					carros = carroR.findByTipoCombustivel(txtFiltro1);
					break;
				case ("TipoCambio"):
					carros = carroR.findByTipoCambio(txtFiltro2);
					break;
				case ("Status"):
					carros = carroR.findByStatusCarro(txtFiltro3);
					break;
				case ("cat"):
					carros = carroR.findCarroCategoria(filtroTextoCat);
					break;
				default:
					break;
				}
			}

			// Botao "Adicionar"
			if (cmd.equalsIgnoreCase("Adicionar")) {
				existente = carroR.findById(placa).isPresent();
				carro.setPlaca(placa);
				carro.setMarca(marca);
				carro.setModelo(modelo);
				carro.setCor(cor);
				carro.setAno(Integer.parseInt(ano));
				carro.setTipoCombustivel(tipoCombustivel);
				carro.setLitrosCombustivel(new BigDecimal(litrosCombustivel));
				carro.setKmRodados(new BigDecimal(kmRodados));
				carro.setTipoCambio(tipoCambio);
				carro.setStatusCarro(statusCarro);
				Categoria c = categoriaR.findById(Integer.parseInt(categoria)).orElse(null);
				carro.setCategoria(c);
				carroR.save(carro);

				if (existente) {
					saida = "Carro (" + placa + ") atualizado com sucesso";
				} else {
					saida = "Carro adicionado a frota com sucesso";
				}

			}

			// Botao "Remover"
			if (cmd.equalsIgnoreCase("Remover")) {
				if (placa != null && !placa.isBlank() && !placa.isEmpty()) {
					carroR.deleteById(placa);
					saida = "Carro deletado com sucesso";
				} else {
					erro = "Nao foi possivel remover o Carro";
				}

			}

		} catch (Exception e) {

			if (e.getMessage() != null) {
				if (e.getMessage().contains("FK74srjkqum99t03ftfoj5v425r")) {
					erro = "O carro esta sendo referenciado na tabela de carros alugados";
				} else if (e.getMessage().contains("truncados na tabela")) {
					erro = "Um ou mais campos ultrapassaram o tamanho permitido";
				} else if (e.getMessage().contains("FK74srjkqum99t03ftfoj5v425r")) {
					erro = "O carro esta sendo referenciado na tabela de carros alugados";
				} else if (e.getMessage().contains("\"filtro\" is null")) {
					erro = "Informe um dado valido para realizar a filtragem";
				} else if (e.getMessage().contains("Text '' could not be parsed at index 0")
						|| e.getMessage().contains("For input string: \"")) {
					erro = "Todos os campos devem ser preenchidos";
				} else {
					erro = e.getMessage();
				}
			} else {
				erro = "Erro desconhecido ao processar o carro";
			}

		}

		model.addAttribute("erro", erro);
		model.addAttribute("saida", saida);
		model.addAttribute("carros", carros);
		return new ModelAndView("cadastrar_carro");
	}

}
