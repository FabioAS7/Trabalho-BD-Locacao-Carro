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
import lab.bd.trabalho.locacaocarro.model.Categoria;
import lab.bd.trabalho.locacaocarro.repository.CategoriaRepository;

@Controller
public class CadastrarCategoriaController {

	@Autowired
	public CategoriaRepository categoriaR;

	@RequestMapping(name = "cadastrar_categoria", value = "/cadastrar_categoria", method = RequestMethod.GET)
	public ModelAndView CadastrarCategoriaGet(@RequestParam Map<String, String> params, ModelMap model) {
		Integer id = null;
		String acao = params.get("acao");
		String saida = "";
		String erro = "";
		Categoria categoria = new Categoria();

		if (params.get("id") != null && !params.get("id").isEmpty()) {
			id = Integer.parseInt(params.get("id"));
		}

		// Controle dos botoes excluir e editar
		try {
			if (params.get("id") != null && !params.get("id").isEmpty()) {

				if (acao.equalsIgnoreCase("editar")) {
					categoria = categoriaR.getReferenceById(id);

				} else if (acao.equalsIgnoreCase("excluir")) {
					categoria = categoriaR.getReferenceById(id);
					categoriaR.deleteById(id);
					saida = "Categoria: " + categoria.getNome() + " deletada com sucesso";
					categoria = null;
				}
			}

		} catch (Exception e) {
			if (e.getMessage().contains("FKlv7k099l7ifx0nstivv52f9xm")) {
				erro = "Nao e possivel deletar a categoria: existem carros vinculados a ela";
			} else {
				erro = e.getMessage();
			}
		}

		model.addAttribute("erro", erro);
		model.addAttribute("saida", saida);
		model.addAttribute("categoria", categoria);
		return new ModelAndView("cadastrar_categoria");
	}

	@RequestMapping(name = "cadastrar_categoria", value = "/cadastrar_categoria", method = RequestMethod.POST)
	public ModelAndView CadastrarCategoriaPost(@RequestParam Map<String, String> params, ModelMap model) {
		Integer id = null;
		String nome = params.get("nome");
		String valorDiaria = params.get("valor_diaria");
		String cmd = params.get("botao");
		String saida = "";
		String erro = "";
		Categoria categoria = new Categoria();
		List<Categoria> categorias = new ArrayList<Categoria>();

		if (params.get("id") != null && !params.get("id").isEmpty()) {
			id = Integer.parseInt(params.get("id"));
		}

		try {
			// Botao "Listar"
			if (cmd.equalsIgnoreCase("Listar")) {
				categorias = categoriaR.findAll();
			}

			// Botao "Adicionar"
			if (cmd.equalsIgnoreCase("Adicionar")) {
				categoria.setId(id);
				categoria.setNome(nome);
				categoria.setValorDiaria(new BigDecimal(valorDiaria));
				categoriaR.save(categoria);
				
				if (id != null) {
					saida = "Categoria (" + categoria.getNome() + ") atualizada com sucesso";
				} else {
					saida = "Categoria adicionada com sucesso";
				}
			}


		} catch (Exception e) {
			if (e.getMessage().contains("FKlv7k099l7ifx0nstivv52f9xm")) {
				erro = "Nao e possivel deletar a categoria: existem carros vinculados a ela";
			} else {
				erro = e.getMessage();
			}
		}

		model.addAttribute("erro", erro);
		model.addAttribute("saida", saida);
		model.addAttribute("categorias", categorias);
		return new ModelAndView("cadastrar_categoria");
	}
}
