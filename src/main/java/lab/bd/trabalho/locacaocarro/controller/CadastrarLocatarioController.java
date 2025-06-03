package lab.bd.trabalho.locacaocarro.controller;

import java.util.Map;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CadastrarLocatarioController {
	
	@RequestMapping(name = "cadastrar_locatario", value = "/cadastrar_locatario", method = RequestMethod.GET)
	public ModelAndView CadastrarLocatarioGet(@RequestParam Map<String, String> params, ModelMap model) {
		return new ModelAndView("cadastrar_locatario");
	}

}
