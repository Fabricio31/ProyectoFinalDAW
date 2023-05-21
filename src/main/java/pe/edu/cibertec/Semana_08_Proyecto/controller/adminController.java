package pe.edu.cibertec.Semana_08_Proyecto.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import pe.edu.cibertec.Semana_08_Proyecto.model.admin;

@Controller
public class adminController {

	@GetMapping("/loginController")
	public String loginController(Model model) {
		model.addAttribute("loginAdmin", new admin());
		return "loginController";
	}

	@PostMapping("/loginController")
	public String loginController(@ModelAttribute("loginAdmin") admin parametro, Model model) {

		if (parametro.getName_system_user().equals("Admin") && parametro.getSystem_password().equals("Admin"))
			return "homeAdmin";
		else {
			return "loginController";
		}
		
		
		

	}

}



