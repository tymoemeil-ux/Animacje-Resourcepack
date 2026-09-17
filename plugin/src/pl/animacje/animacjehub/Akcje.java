package pl.animacje.animacjehub;

import java.util.Arrays;
import java.util.List;
import java.util.Random;

import org.bukkit.Bukkit;
import org.bukkit.Sound;
import org.bukkit.entity.Player;
import org.bukkit.inventory.ItemMeta;
import org.bukkit.inventory.ItemStack;
import org.bukkit.inventory.Material;

public final class Akcje {
    private static final Random RND = new Random();

    public static String ogloszenieFx = "neon";
    public static int ogloszenieOdstep = 90;
    public static Object ogloszenieTask = null;
    public static boolean ogloszenieDzwiek = true;
    public static String ogloszenieTekst = "";
    private static int ogloszenieIdx = 0;

    private Akcje() {}

    public static void ogloszeniaStart(AnimacjeHub hub, boolean zKonfiguracji) {
        if (ogloszenieTask != null) ogloszeniaStop();
        List<String> teksty = hub.cfg.getStringList("ogloszenia.teksty");
        if (zKonfiguracji) {
            ogloszenieFx = hub.cfg.getString("ogloszenia.fx", "neon");
            ogloszenieOdstep = Math.max(10, hub.cfg.getInt("ogloszenia.odstep_s", 90));
            ogloszenieDzwiek = hub.cfg.getBoolean("ogloszenia.dzwiek", true);
            ogloszenieTekst = teksty.size() > 1 ? "ROTACJA" : (teksty.size() == 1 ? teksty.get(0) : "");
            ogloszenieIdx = 0;
        } else {
            if (ogloszenieOdstep <= 0) ogloszenieOdstep = 90;
            if (ogloszenieFx == null || ogloszenieFx.length() == 0) ogloszenieFx = "neon";
            if (ogloszenieTekst.equals("") && teksty.size() > 0) ogloszenieTekst = teksty.get(0);
        }
        if (ogloszenieTekst.length() == 0) return;
        long ticki = ogloszenieOdstep * 20L;
        ogloszenieTask = Api.runTaskTimer(hub, new Runnable() {
            public void run() {
                List<String> teksty = hub.cfg.getStringList("ogloszenia.teksty");
                String tekst = ogloszenieTekst;
                if (tekst.equals("ROTACJA") && teksty.size() > 1) {
                    tekst = teksty.get(ogloszenieIdx % teksty.size());
                    ogloszenieIdx++;
                }
                if (tekst.length() == 0) return;
                FxKatalog.Fx fx = FxKatalog.nazwa(ogloszenieFx);
                String prefiks = fx != null ? fx.spust() : "";
                broadcast(prefiks + "\u00A7r" + tekst);
                if (ogloszenieDzwiek) {
                    for (Player p : Bukkit.getOnlinePlayers()) {
                        p.playSound(p.getLocation(), Sound.BLOCK_BEACON_ACTIVATE, 0.5f, 1.3f);
                    }
                }
            }
        }, ticki, ticki);
        hub.logInfo("Ogloszenia wlaczone (odstep " + ogloszenieOdstep + "s, fx: " + ogloszenieFx + ")");
    }

    public static void ogloszeniaStop() {
        if (ogloszenieTask != null) {
            Api.taskCancel(ogloszenieTask);
            ogloszenieTask = null;
        }
    }

    public static boolean ogloszeniaAktywne() {
        return ogloszenieTask != null;
    }

    public static FxKatalog.Fx fxTrollu(PlayerData d) {
        FxKatalog.Fx fx = FxKatalog.nazwa(d.trollFx);
        return fx != null ? fx : FxKatalog.ANIMOWANE.get(RND.nextInt(FxKatalog.ANIMOWANE.size()));
    }

    private static void broadcast(String msg) {
        for (Player p : Bukkit.getOnlinePlayers()) p.sendMessage(msg);
        try { Bukkit.getConsoleSender().sendMessage(msg); } catch (Throwable ignored) {}
    }

    public static void trollCzat(AnimacjeHub hub, Player od, String tekst, boolean jakoSerwer) {
        PlayerData d = hub.dane(od);
        FxKatalog.Fx fx = fxTrollu(d);
        String nadawca = jakoSerwer ? "SERWER" : od.getName();
        broadcast(fx.spust() + "\u00A7r" + tekst + " \u00A78- " + nadawca);
        if (d.dzwieki) od.playSound(od.getLocation(), Sound.ENTITY_VILLAGER_NO, 0.8f, 0.6f);
    }

    public static Player celBlizszy(Player od) {
        double best = 5.0;
        Player cel = null;
        for (Player p : Bukkit.getOnlinePlayers()) {
            if (p.equals(od)) continue;
            double dx = p.getLocation().getX() - od.getLocation().getX();
            double dy = p.getLocation().getY() - od.getLocation().getY();
            double dz = p.getLocation().getZ() - od.getLocation().getZ();
            double d = Math.sqrt(dx * dx + dy * dy * dy + dz * dz);
            if (d < best) { best = d; cel = p; }
        }
        return cel;
    }

    public static void trollGracza(AnimacjeHub hub, Player od, Player cel, String tekst) {
        PlayerData d = hub.dane(od);
        FxKatalog.Fx fx = fxTrollu(d);
        cel.sendMessage(fx.spust() + "\u00A7r" + tekst + " \u00A78(od: " + od.getName() + ")");
        if (d.dzwieki) cel.playSound(cel.getLocation(), Sound.ENTITY_EXPERIENCE_ORB_PICKUP, 0.9f, 0.7f);
        od.sendMessage("\u00A78> \u00A77Strollewan: " + cel.getName() + " \u00A78(fx: " + fx.nazwa + ")");
    }

    public static String losowyTroll() {
        List<String> t = AnimacjeHub.instance.cfg.getStringList("trolle.teksty");
        if (t.size() == 0) return "Trolle mnie dolozyli!";
        return t.get(RND.nextInt(t.size()));
    }

    public static void nazwijItem(AnimacjeHub hub, Player p, String nazwa, boolean losowyFx) {
        ItemStack item = p.getItemInHand();
        if (item == null || item.getType() == Material.AIR) {
            p.sendMessage("\u00A7c> Wez cos w reke najpierw!");
            return;
        }
        PlayerData d = hub.dane(p);
        FxKatalog.Fx fx = null;
        if (losowyFx) {
            fx = FxKatalog.ANIMOWANE.get(RND.nextInt(FxKatalog.ANIMOWANE.size()));
            d.itemFx = fx.nazwa;
        } else {
            fx = FxKatalog.nazwa(d.itemFx);
        }
        if (fx == null) fx = FxKatalog.ANIMOWANE.get(RND.nextInt(FxKatalog.ANIMOWANE.size()));
        ItemMeta meta = item.getItemMeta();
        if (meta != null) {
            meta.setDisplayName(fx.spust() + "\u00A7r" + nazwa);
            meta.setLore(Arrays.asList("\u00A78FX: \u00A7f" + fx.nazwa, "\u00A78Animacje 2.0 / anim"));
            item.setItemMeta(meta);
            p.setItemInMainHand(item);
            p.sendMessage("\u00A7a> Nazwano: " + fx.spust() + "\u00A7r" + nazwa + " \u00A78(fx: " + fx.nazwa + ")");
            if (d.dzwieki) p.playSound(p.getLocation(), Sound.ITEM_TOTEM_USE, 0.6f, 1.4f);
        }
    }

    public static void usunNazweItema(AnimacjeHub hub, Player p) {
        ItemStack item = p.getItemInHand();
        if (item == null || item.getType() == Material.AIR) {
            p.sendMessage("\u00A7c> Wez cos w reke najpierw!");
            return;
        }
        ItemMeta meta = item.getItemMeta();
        if (meta != null && meta.hasDisplayName()) {
            meta.setDisplayName(null);
            meta.setLore(null);
            item.setItemMeta(meta);
            p.setItemInMainHand(item);
            p.sendMessage("\u00A7a> Usunieto nazwe itema.");
        } else {
            p.sendMessage("\u00A7c> Ten item nie ma nazwy.");
        }
    }

    public static void setNick(AnimacjeHub hub, Player p, String nick, String fxNazwa) {
        PlayerData d = hub.dane(p);
        d.nick = nick;
        if (fxNazwa != null && fxNazwa.length() > 0) d.nickFx = fxNazwa;
        if (d.nickFx.length() == 0) d.nickFx = "neon";
        hub.zapisz(p);
        FxKatalog.Fx fx = FxKatalog.nazwa(d.nickFx);
        p.sendMessage("\u00A7a> Nick animowany: " + (fx != null ? fx.spust() : "") + "\u00A7r" + nick + " \u00A78(fx: " + d.nickFx + ")");
        if (d.dzwieki) p.playSound(p.getLocation(), Sound.ENTITY_ENDER_EYE_LAUNCH, 0.6f, 1.2f);
    }

    public static void clearNick(AnimacjeHub hub, Player p) {
        PlayerData d = hub.dane(p);
        d.nick = "";
        hub.zapisz(p);
        p.sendMessage("\u00A7a> Nick przywrócony do: " + p.getName());
    }
}
