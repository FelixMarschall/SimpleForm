package dev.softghost.SheetCreationTool.Controller;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Optional;

import static java.lang.Thread.sleep;

@Controller
public class ToolController {
    private static final Logger log = LoggerFactory.getLogger(ToolController.class);

    @GetMapping("/")
    public String helloWorld(Model model) {
        model.addAttribute("message", "Hello World");
        return "index";
    }

    @GetMapping("/login")
    public String login(@RequestParam Optional<String> error, Model model) {
        if (error.isPresent()) {
            log.warn("Invalid username or password");
            model.addAttribute("error", "Invalid username or password");
        }
        log.info("Login page accessed");
        return "login";
    }

    @GetMapping("/admin")
    public String admin(Model model) {
        model.addAttribute("message", "Test");
        return "crud_table";
    }

    @PostMapping("/submit")
    public ResponseEntity<String> testPost(@RequestParam String name, @RequestParam String email) throws InterruptedException {
        log.info("Name: " + name + " Email: " + email + " successfully submitted!");
        String response = "<div id='message'>Name: " + name + " Email: " + email + " successfully submitted!</div>"
                + "<input type='submit' id='submit-button' hx-swap='outerHTML' hx-swap-oob='true' style='display: none;'>";
        return ResponseEntity.ok(response);
    }
}