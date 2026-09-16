package pl.animacje.animacjehub;

import org.bukkit.event.EventHandler;
import org.bukkit.event.Listener;
import org.bukkit.event.inventory.InventoryClickEvent;

public final class Gui implements Listener {
    private final GuiViews views;

    public Gui(GuiViews views) {
        this.views = views;
    }

    @EventHandler
    public void onClick(InventoryClickEvent e) {
        views.handle(e);
    }
}
