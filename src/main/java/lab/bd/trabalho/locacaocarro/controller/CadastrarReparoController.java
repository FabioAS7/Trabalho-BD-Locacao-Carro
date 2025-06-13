package lab.bd.trabalho.locacaocarro.controller;

import java.math.BigDecimal;
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
import lab.bd.trabalho.locacaocarro.model.Carro;
import lab.bd.trabalho.locacaocarro.model.Reparo;
import lab.bd.trabalho.locacaocarro.repository.CarroRepository;
import lab.bd.trabalho.locacaocarro.repository.ReparoRepository;

@Controller
public class CadastrarReparoController {
	
	@Autowired
	public ReparoRepository reparoR;
	
	@Autowired
	public CarroRepository carroR;
	
	@RequestMapping(name = "cadastrar_reparo", value = "/cadastrar_reparo", method = RequestMethod.GET)
	public ModelAndView CadastrarReparoGet(@RequestParam Map<String, String> params, ModelMap model) {
		Integer idreparo = null;
		String idplaca = params.get("id");
		String acao = params.get("acao");
		String saida = "";
		String erro = "";
		Reparo reparo = new Reparo();
		Carro carro = new Carro();
		
		if (params.get("id") != null && !params.get("id").isEmpty() && (params.get("acao").equalsIgnoreCase("editar") || params.get("acao").equalsIgnoreCase("excluir"))) {
			idreparo = Integer.parseInt(params.get("id"));
		}
		
		try {
			
			if (params.get("id") != null && !params.get("id").isEmpty()) {
				
				if(acao.equalsIgnoreCase("editar")) {
					reparo = reparoR.getReferenceById(idreparo);
					
				} else if(acao.equalsIgnoreCase("excluir")) {
					reparo = reparoR.getReferenceById(idreparo);
					reparoR.deleteById(idreparo);
					saida = "Reparo ( ID:" +reparo.getId()+ ", Placa do Carro: " +reparo.getCarro().getPlaca()+ ") deletado com sucesso";
					reparo = null;
					
				} else if(acao.equalsIgnoreCase("selecionar")) {
					carro = carroR.getReferenceById(idplaca);
					reparo.setCarro(carro);
				}
			}
			
		} catch (Exception e) {
			erro = e.getMessage();
		}
		
		model.addAttribute("erro", erro);
		model.addAttribute("saida", saida);
		model.addAttribute("reparo", reparo);
		return new ModelAndView("cadastrar_reparo");
	}
	
	@RequestMapping(name = "cadastrar_reparo", value = "/cadastrar_reparo", method = RequestMethod.POST)
	public ModelAndView CadastrarReparoPost(@RequestParam Map<String, String> params, ModelMap model){
		Integer id = null;
		String placa = params.get("carro_placa").toUpperCase();
		String diaEntrada = params.get("dia_entrada");
		String quantDiasReparo = params.get("quant_dias_reparo");
		String descricaoProblema = params.get("descricao_problema");
		String valorReparo = params.get("valor_reparo");
		String cmd = params.get("botao");
		String saida = "";
		String erro = "";
		Reparo reparo = new Reparo();
		List<Reparo> reparos = new ArrayList<Reparo>();
		List<Carro> carros = new ArrayList<Carro>();
		
		if (params.get("id") != null && !params.get("id").isEmpty()) {
			id = Integer.parseInt(params.get("id"));
		}
		
		try {
			
			// Botao "Listar"
			if (cmd.equalsIgnoreCase("Listar")) {
				reparos = reparoR.findAll();
			} else if (cmd.equalsIgnoreCase("PesquisarPlaca")) {
				carros = carroR.findAll();
			}
			
			// Botao "Adicionar"
			if(cmd.equalsIgnoreCase("Adicionar")) {
				reparo.setId(id);
				reparo.setCarro(carroR.getReferenceById(placa));
				reparo.setDiaEntrada(LocalDate.parse(diaEntrada));
				reparo.setQuantDiasReparo(Integer.parseInt(quantDiasReparo));
				reparo.setDescricaoProblema(descricaoProblema);
				reparo.setValorReparo(new BigDecimal(valorReparo));
				reparoR.save(reparo);
				
				if(id != null) {
					saida = "Reparo (Carro de placa: "+ reparo.getCarro().getPlaca() +") atualizado com sucesso";
				} else {
					saida = "Carro enviado para o Reparo com Sucesso";
				}
			}
			
			// Botao "Remover"
			if (cmd.equalsIgnoreCase("Remover")) {
				if(id != null) {
					reparoR.deleteById(id);
					saida = "Reparo deletado com sucesso";
				} else {
					erro = "Nao foi possivel deletar o Reparo";
				}
			}
			
		} catch (Exception e) {
			if(e.getMessage().contains("Text '' could not be parsed at index 0") || e.getMessage().contains("For input string: \"\"")) {
				erro = "Todos os campos devem ser preenchidos";
			} else {
				erro = e.getMessage();
			}
		}
		
		model.addAttribute("erro", erro);
		model.addAttribute("saida", saida);
		model.addAttribute("reparos", reparos);
		model.addAttribute("carros", carros);
		return new ModelAndView("cadastrar_reparo");
	}
	
}
