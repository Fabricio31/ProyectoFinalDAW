package pe.edu.cibertec.Semana_08_Proyecto.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class userController {
	
	@GetMapping("/indexJuegos")
	public String loginController(Model model) {
		
		return "indexJuegos";
	}


}
