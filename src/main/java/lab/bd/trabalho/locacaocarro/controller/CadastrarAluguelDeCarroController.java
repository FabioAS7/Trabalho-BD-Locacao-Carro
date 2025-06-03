package lab.bd.trabalho.locacaocarro.controller;

import java.util.Map;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CadastrarAluguelDeCarroController {
	
	@RequestMapping(name = "cadastrar_aluguel_de_carro", value = "/cadastrar_aluguel_de_carro", method = RequestMethod.GET)
	public ModelAndView CadastrarAluguelDeCarroGet(@RequestParam Map<String, String> params, ModelMap model) {
		return new ModelAndView("cadastrar_aluguel_de_carro");
	}

}
