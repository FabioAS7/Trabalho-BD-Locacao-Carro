package lab.bd.trabalho.locacaocarro.controller;

import java.util.Map;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import lab.bd.trabalho.locacaocarro.model.AluguelDeCarro;
import lab.bd.trabalho.locacaocarro.model.Carro;
import lab.bd.trabalho.locacaocarro.model.Endereco;
import lab.bd.trabalho.locacaocarro.repository.AluguelDeCarroRepository;
import lab.bd.trabalho.locacaocarro.repository.CarroRepository;
import lab.bd.trabalho.locacaocarro.repository.LocatarioRepository;

@Controller
public class CadastrarAluguelDeCarroController {

	@Autowired
	public AluguelDeCarroRepository aluguelDeCarroR;

	@Autowired
	public CarroRepository carroR;

	@Autowired
	public LocatarioRepository locatarioR;

	@RequestMapping(name = "cadastrar_aluguel_de_carro", value = "/cadastrar_aluguel_de_carro", method = RequestMethod.GET)
	public ModelAndView CadastrarAluguelDeCarroGet(@RequestParam Map<String, String> params, ModelMap model) {
		Integer id = null;
		String idplaca = params.get("id");
		String acao = params.get("acao");
		String saida = "";
		String erro = "";
		AluguelDeCarro aluguelDeCarro = new AluguelDeCarro();
		Carro carro = new Carro();

		if (params.get("id") != null && !params.get("id").isEmpty()
				&& (params.get("acao").equalsIgnoreCase("editar") || params.get("acao").equalsIgnoreCase("excluir"))) {
			id = Integer.parseInt(params.get("id"));
		}

		try {

			if (params.get("id") != null && !params.get("id").isEmpty()) {

				if (acao.equalsIgnoreCase("editar")) {
					aluguelDeCarro = aluguelDeCarroR.getReferenceById(id);

				} else if (acao.equalsIgnoreCase("excluir")) {
					aluguelDeCarro = aluguelDeCarroR.getReferenceById(id);
					aluguelDeCarroR.deleteById(id);
					saida = "Aluguel (Nome: " + aluguelDeCarro.getLocatario().getNome() + ", Carro: "
							+ aluguelDeCarro.getCarro().getPlaca() + ") foi deletado com sucesso";
					aluguelDeCarro = null;

				} else if (acao.equalsIgnoreCase("selecionar")) {
					carro = carroR.getReferenceById(idplaca);
					aluguelDeCarro.setCarro(carro);
				}
			}

		} catch (Exception e) {
			if (e.getMessage().contains("Text '' could not be parsed")) {
				erro = "Todos os campos devem ser preenchidos";
			} else if (e.getMessage().contains("FK31dyk1wk5rqafi5pd5cgkd6ex")) {
				erro = "CPF do Locatario invalido";
			} else if (e.getMessage().contains("FK74srjkqum99t03ftfoj5v425r")) {
				erro = "Placa do Carro invalida";
			} else {
				erro = e.getMessage();
			}
		}

		model.addAttribute("erro", erro);
		model.addAttribute("saida", saida);
		model.addAttribute("aluguelDeCarro", aluguelDeCarro);
		return new ModelAndView("cadastrar_aluguel_de_carro");
	}

	@RequestMapping(name = "cadastrar_aluguel_de_carro", value = "/cadastrar_aluguel_de_carro", method = RequestMethod.POST)
	public ModelAndView CadastrarAluguelDeCarroPost(@RequestParam Map<String, String> params, ModelMap model) {
		Integer id = null;
		String carro = params.get("carro_placa");
		String locatario = params.get("locatario_cpf");
		String dataRetirada = params.get("data_retirada");
		String dataDevolucao = params.get("data_devolucao");

		String cmd = params.get("botao");
		String saida = "";
		String erro = "";

		AluguelDeCarro aluguelDeCarro = new AluguelDeCarro();
		List<AluguelDeCarro> aluguelDeCarros = new ArrayList<AluguelDeCarro>();
		List<Carro> carros = new ArrayList<Carro>();

		if (params.get("id") != null && !params.get("id").isEmpty()) {
			id = Integer.parseInt(params.get("id"));
		}

		try {

			// Botao "Listar"
			if (cmd.equalsIgnoreCase("Listar")) {
				aluguelDeCarros = aluguelDeCarroR.findAll();
			} else if (cmd.equalsIgnoreCase("PesquisarCarroPlaca")) {
				carros = carroR.findAll();
			}

			// Botao "Adicionar"
			if (cmd.equalsIgnoreCase("Adicionar")) {

				if (id != null) {
					aluguelDeCarro = aluguelDeCarroR.findById(id).orElse(new AluguelDeCarro());
					aluguelDeCarro.setId(id);
				} else {
					aluguelDeCarro = new AluguelDeCarro();
				}

				aluguelDeCarro.setCarro(carroR.getReferenceById(carro));
				aluguelDeCarro.setLocatario(locatarioR.getReferenceById(locatario));
				aluguelDeCarro.setDataRetirada(LocalDate.parse(dataRetirada));
				aluguelDeCarro.setDataDevolucao(LocalDate.parse(dataDevolucao));
				aluguelDeCarroR.save(aluguelDeCarro);

				if (id != null) {
					saida = "Aluguel modificado com sucesso";
				} else {
					saida = "Aluguel realizado com sucesso";
				}
			}

		} catch (Exception e) {
			if (e.getMessage().contains("Text '' could not be parsed")) {
				erro = "Todos os campos devem ser preenchidos";
			} else if (e.getMessage().contains("FK31dyk1wk5rqafi5pd5cgkd6ex")) {
				erro = "CPF do Locatario invalido";
			} else if (e.getMessage().contains("FK74srjkqum99t03ftfoj5v425r")) {
				erro = "Placa do Carro invalida";
			} else {
				erro = e.getMessage();
			}
		}

		model.addAttribute("erro", erro);
		model.addAttribute("saida", saida);
		model.addAttribute("aluguelDeCarros", aluguelDeCarros);
		model.addAttribute("carros", carros);
		return new ModelAndView("cadastrar_aluguel_de_carro");
	}

}
