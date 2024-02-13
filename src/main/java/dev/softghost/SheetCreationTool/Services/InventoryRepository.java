package dev.softghost.SheetCreationTool.Services;

import dev.softghost.SheetCreationTool.Model.Item;
import org.springframework.data.jpa.repository.JpaRepository;

public interface InventoryRepository extends JpaRepository<Item, Integer> {
}
