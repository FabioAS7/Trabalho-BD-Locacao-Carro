package lab.bd.trabalho.locacaocarro.controller;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.datasource.DataSourceUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.util.JRLoader;

@Controller
public class HistoricoRelatorioController {

	@Autowired
	private DataSource ds;

	@RequestMapping(name = "cadastrar_locatario_relatorio", value = "/cadastrar_locatario_relatorio", method = RequestMethod.GET)
	public ModelAndView aluguelRelatorioGet() {
		return new ModelAndView("cadastrar_locatario");
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(name = "cadastrar_locatario_relatorio", value = "/cadastrar_locatario_relatorio", method = RequestMethod.POST)
	public ResponseEntity aluguelRelatorioPost(@RequestParam Map<String, String> params, ModelMap model) {
		String erro = "";
		String cpf = params.get("cpf");

		// Parâmetros para a geração do PDF via JASPER REPORTS
		Map<String, Object> reportParams = new HashMap<>();
		reportParams.put("cpf", cpf);

		byte[] bytes = null; // Byte[] onde o PDF será montado para retorno

		// Parâmetros de retorno para o navegador
		InputStreamResource resource = null;
		HttpStatus status = null;
		HttpHeaders header = new HttpHeaders();

		// Conexão com o BD
		Connection conn = DataSourceUtils.getConnection(ds);

		// Processo de geração do report com o JASPER REPORTS
		try {
			File arquivo = ResourceUtils.getFile("classpath:reports/Historico.jasper");
			JasperReport report = (JasperReport) JRLoader.loadObjectFromFile(arquivo.getAbsolutePath());
			bytes = JasperRunManager.runReportToPdf(report, reportParams, conn);
		} catch (FileNotFoundException | JRException e) {
			erro = e.getMessage();
			status = HttpStatus.BAD_REQUEST;
		} finally {
			if (erro.equals("")) {
				ByteArrayInputStream stream = new ByteArrayInputStream(bytes);
				resource = new InputStreamResource(stream);
				header.setContentType(MediaType.APPLICATION_PDF);
				header.setContentLength(bytes.length);
				status = HttpStatus.OK;
			}
		}
		return new ResponseEntity(resource, header, status);
	}

}
