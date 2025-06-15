package lab.bd.trabalho.locacaocarro.controller;

import java.time.LocalDate;
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
import lab.bd.trabalho.locacaocarro.model.Endereco;
import lab.bd.trabalho.locacaocarro.model.Locatario;
import lab.bd.trabalho.locacaocarro.repository.EnderecoReposiory;
import lab.bd.trabalho.locacaocarro.repository.LocatarioRepository;

@Controller
public class CadastrarLocatarioController {

	@Autowired
	public LocatarioRepository locatarioR;

	@Autowired
	public EnderecoReposiory enderecoR;

	@RequestMapping(name = "cadastrar_locatario", value = "/cadastrar_locatario", method = RequestMethod.GET)
	public ModelAndView CadastrarLocatarioGet(@RequestParam Map<String, String> params, ModelMap model) {
		String cpf = params.get("id");
		Integer id = null;
		String acao = params.get("acao");
		String saida = "";
		String erro = "";
		Locatario locatario = new Locatario();
		Endereco endereco = new Endereco();
		List<Endereco> enderecos = new ArrayList<Endereco>();

		if (params.get("idE") != null && !params.get("idE").isEmpty()) {
			id = Integer.parseInt(params.get("idE"));
		}

		try {
			if (params.get("id") != null && !params.get("id").isEmpty()) { // CPF

				if (acao.equalsIgnoreCase("editar")) {
					locatario = locatarioR.getReferenceById(cpf);
					enderecos = enderecoR.findByLocatario(locatario);
					model.addAttribute("enderecos", enderecos);

				} else if (acao.equalsIgnoreCase("excluir")) {
					locatario = locatarioR.getReferenceById(cpf);
					enderecoR.deleteAllLocatario(cpf);
					locatarioR.deleteById(cpf);
					saida = "Locatario (Nome: " + locatario.getNome() + ") deletado com sucesso";
					locatario = null;

				}
			}

			if (params.get("idE") != null && !params.get("idE").isEmpty()) { // ID Endereco

				if (acao.equalsIgnoreCase("editar")) {
					endereco = enderecoR.getReferenceById(id);
					locatario = locatarioR.getReferenceById(endereco.getLocatario().getCpf());

				} else if (acao.equalsIgnoreCase("excluir")) {
					endereco = enderecoR.getReferenceById(id);
					enderecoR.deleteById(id);
					saida = "Endereco " + endereco.getLougradouroEndereco() + " foi excluido com sucesso";
					endereco = null;
				}
			}

		} catch (Exception e) {
			erro = e.getMessage();
		}

		model.addAttribute("erro", erro);
		model.addAttribute("saida", saida);
		model.addAttribute("locatario", locatario);
		model.addAttribute("endereco", endereco);
		return new ModelAndView("cadastrar_locatario");
	}

	@RequestMapping(name = "cadastrar_locatario", value = "/cadastrar_locatario", method = RequestMethod.POST)
	public ModelAndView CadastrarLocatarioPost(@RequestParam Map<String, String> params, ModelMap model) {

		String cpf = params.get("cpf");
		String nome = params.get("nome");
		String numHabilitacao = params.get("num_habilitacao");
		String dataNascimento = params.get("data_nascimento");

		Integer id_endereco = null;
		String lougradouroEndereco = params.get("logradouro_endereco");
		String lougradouroNum = params.get("logradouro_num");
		String lougradouroCep = params.get("logradouro_cep");
		String lougradouroCidade = params.get("logradouro_cidade");

		String cmd = params.get("botao");
		String saida = "";
		String erro = "";
		boolean existente = false;

		Locatario locatario = new Locatario();
		Endereco endereco = new Endereco();
		List<Locatario> locatarios = new ArrayList<Locatario>();

		if (params.get("idE") != null && !params.get("idE").isEmpty()) {
			id_endereco = Integer.parseInt(params.get("idE"));
		}

		try {
			// Botao "Listar"
			if (cmd.equalsIgnoreCase("Listar")) {
				locatarios = locatarioR.findAll();
			}

			// Botao "Adicionar"
			if (cmd.equalsIgnoreCase("Adicionar")) {
				existente = locatarioR.findById(cpf).isPresent();
				locatario.setCpf(cpf);
				locatario.setNome(nome);
				locatario.setNumHabilitacao(numHabilitacao);
				locatario.setDataNascimento(LocalDate.parse(dataNascimento));

				if (id_endereco != null) {
					endereco = enderecoR.findById(id_endereco).orElse(new Endereco());
					endereco.setId(id_endereco);
				} else {
					endereco = new Endereco();
				}

				endereco.setLougradouroEndereco(lougradouroEndereco);
				endereco.setLougradouroNum(lougradouroNum);
				endereco.setLougradouroCep(lougradouroCep);
				endereco.setLougradouroCidade(lougradouroCidade);
				endereco.setLocatario(locatario);

				locatarioR.save(locatario);
				enderecoR.save(endereco);

				if (existente) {
					saida = "Locatario (CPF: " + cpf + ") atualizado com sucesso";
				} else {
					saida = "Locatario adicionado com sucesso";
				}
			}

			// Botao "Remover"
			if (cmd.equalsIgnoreCase("Remover")) {
				if(cpf != null && !cpf.isBlank() && !cpf.isEmpty()) {
					enderecoR.deleteAllLocatario(cpf);
					locatarioR.deleteById(cpf);
					saida = "Locatario deletado com sucesso";
				} else {
					erro = "Não foi possivel deletar o Locatario";
				}
			}

		} catch (Exception e) {
			if(e.getMessage().contains("Text '' could not be parsed")) {
				erro = "Todos os campos devem serem preenchidos";
			} else {
				erro = e.getMessage();
			}
		}

		model.addAttribute("erro", erro);
		model.addAttribute("saida", saida);
		model.addAttribute("locatarios", locatarios);
		return new ModelAndView("cadastrar_locatario");
	}

}
