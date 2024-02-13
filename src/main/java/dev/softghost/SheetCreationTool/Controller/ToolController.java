package dev.softghost.SheetCreationTool.Controller;

import dev.softghost.SheetCreationTool.Model.Item;
import dev.softghost.SheetCreationTool.Services.InventoryRepository;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;
import java.util.Optional;

import static java.lang.Thread.sleep;

@Controller
public class ToolController {
    private static final Logger log = LoggerFactory.getLogger(ToolController.class);
    private final InventoryRepository itemRepository;

    @Autowired
    public ToolController(InventoryRepository itemRepository) {
        this.itemRepository = itemRepository;
    }

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
    public String admin(HttpServletRequest request, Model model) {
        model.addAttribute("message", "Test");
        model.addAttribute("items", itemRepository.findAll());
        return "admin";
    }

    @PostMapping("/submit")
    public ResponseEntity<String> testPost(@RequestParam String name, @RequestParam String email) throws InterruptedException {
        log.info("Name: " + name + " Email: " + email + " successfully submitted!");
        String response = "<div id='message'>Name: " + name + " Email: " + email + " successfully submitted!</div>"
                + "<input type='submit' id='submit-button' hx-swap='outerHTML' hx-swap-oob='true' style='display: none;'>";
        return ResponseEntity.ok(response);
    }

    @GetMapping("/inventory")
    public String items(Model model) {
        Item item = new Item("Test Item", "This is a test item", 10.00);
        itemRepository.save(item);
        if (itemRepository.findAll().isEmpty()) {
            log.info("No items found");
            model.addAttribute("message", "No items found");
        } else {
            log.info("Items found");
            List<Item> items = itemRepository.findAll();
            model.addAttribute("message", "Items found");
            model.addAttribute("items", items);
        }
        return "inventory";
    }

    @PostMapping("/admin")
    public ResponseEntity<String> addItem(@RequestParam String name, @RequestParam String description, @RequestParam double price, Model model) throws InterruptedException {
        Thread.sleep(10000);
        Item item = new Item(name, description, price);
        itemRepository.save(item);
        log.info("Item added: " + item);
        model.addAttribute("message", "Item added: " + item);
        return ResponseEntity.ok("item added" + item);
    }

    @DeleteMapping("/admin/{idStr}")
    public ResponseEntity<String> deleteItem(Model model, @PathVariable String idStr) {
        int id = Integer.parseInt(idStr);
        itemRepository.deleteById(id);
        log.info("Item deleted: " + id);
        model.addAttribute("message", "Item deleted: " + id);
        return ResponseEntity.ok("item deleted" + id);
    }
}