package pl.tymek24.animacje.v3;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.bukkit.Bukkit;
import org.bukkit.command.Command;
import org.bukkit.command.CommandSender;
import org.bukkit.command.TabCompleter;
import org.bukkit.entity.Player;

/** /anim (+ aliasy) — router podpolecen. */
public final class Polecenia implements org.bukkit.command.CommandExecutor, TabCompleter {

    private final AnimacjeHubV3 main;

    public Polecenia(AnimacjeHubV3 main) { this.main = main; }

    @Override
    public boolean onCommand(CommandSender sender, Command cmd, String label, String[] args) {
        Player p = sender instanceof Player ? (Player) sender : null;

        if (args.length == 0) {
            if (p != null) main.hub().otworzMenu(p);
            else pomoz(sender);
            return true;
        }

        String sub = args[0].toLowerCase();

        switch (sub) {
            case "help":
            case "pomoc":
                pomoz(sender);
                break;
            case "gui":
                if (p == null) { sender.sendMessage("§cTylko gracz."); break; }
                if (!uprawnienie(sender, "animacje.uzywanie")) break;
                main.hub().otworzMenu(p);
                break;
            case "fx":
            case "efekt":
                if (!uprawnienie(sender, "animacje.uzywanie")) break;
                if (args.length == 1) {
                    if (p != null) main.hub().otworzFx(p, 0, false);
                    else sender.sendMessage("§cKatalog otwiera gracz.");
                    break;
                }
                if (args[1].equalsIgnoreCase("lista")) {
                    listaFx(sender, args.length > 2 ? args[2] : null);
                    break;
                }
                podgladFx(sender, args[1]);
                break;
            case "lista":
                if (!uprawnienie(sender, "animacje.uzywanie")) break;
                listaFx(sender, args.length > 1 ? args[1] : null);
                break;
            case "nick":
                if (p == null) { sender.sendMessage("§cTylko gracz."); break; }
                if (!uprawnienie(sender, "animacje.uzywanie")) break;
                if (args.length > 1) {
                    boolean chce = args[1].equalsIgnoreCase("on") || args[1].equalsIgnoreCase("wl");
                    boolean biezacy = main.nick().wlaczony(p);
                    if (chce == biezacy) {
                        sender.sendMessage("§8» §fNick juz jest: §7" + (biezacy ? "§aWŁ" : "§cWYŁ"));
                    } else {
                        main.nick().przelicz(p);
                        p.sendMessage("§8» §fNick animowany: §7" + (chce ? "§aWŁ" : "§cWYŁ"));
                    }
                } else {
                    boolean st = main.nick().przelicz(p);
                    p.sendMessage("§8» §fNick animowany: §7" + (st ? "§aWŁ" : "§cWYŁ"));
                }
                break;
            case "item":
            case "przedmiot":
                if (p == null) { sender.sendMessage("§cTylko gracz."); break; }
                if (!uprawnienie(sender, "animacje.uzywanie")) break;
                if (args.length == 1) {
                    main.hub().otworzFx(p, 0, true);
                } else {
                    Katalog.Fx f = Katalog.poNazwie(args[1]);
                    if (f == null || !f.animowany()) { sender.sendMessage("§cBrak FX: §f" + args[1]); break; }
                    StringBuilder customName = new StringBuilder();
                    for (int i = 2; i < args.length; i++) { if (i > 2) customName.append(" "); customName.append(args[i]); }
                    main.hub().nazwijItem(p, f, customName.length() == 0 ? null : customName.toString());
                }
                break;
            case "title":
            case "tytul":
                if (p == null) { sender.sendMessage("§cTylko gracz."); break; }
                if (!uprawnienie(sender, "animacje.title")) break;
                if (args.length < 3) { sender.sendMessage("§cUzytek: /anim title <fx> <tekst>"); break; }
                Katalog.Fx titleFx = Katalog.poNazwie(args[1]);
                if (titleFx == null || !titleFx.animowany()) { sender.sendMessage("§cBrak animowanego FX: §f" + args[1]); break; }
                StringBuilder titleText = new StringBuilder();
                for (int i = 2; i < args.length; i++) { if (i > 2) titleText.append(' '); titleText.append(args[i]); }
                p.sendTitle(titleFx.spust() + titleText, "§7Animacje Hub", 10, 60, 15);
                break;
            case "troll":
                if (p == null) { sender.sendMessage("§cTylko gracz."); break; }
                if (!uprawnienie(sender, "animacje.uzywanie")) break;
                {
                    Player cel = p;
                    if (args.length > 1) {
                        cel = Bukkit.getPlayer(args[1]);
                        if (cel == null) { sender.sendMessage("§cGracz nie jest online: §f" + args[1]); break; }
                        if (cel != p && !uprawnienie(sender, "animacje.troll.inny")) break;
                    }
                    main.trolle().losowo(cel);
                    if (cel == p) p.sendMessage("§8» §4TROLL! §7Wykonano losowa akcje.");
                    else sender.sendMessage("§8» §4Troll na: §f" + cel.getName() + "§r");
                }
                break;
            case "kolor":
                if (!uprawnienie(sender, "animacje.uzywanie")) break;
                if (args.length == 1) {
                    if (p != null) main.hub().otworzKolory(p);
                    break;
                }
                Katalog.Fx k = Katalog.poNazwie(args[1]);
                if (k == null) { sender.sendMessage("§cBrak koloru/FX: §f" + args[1]); break; }
                sender.sendMessage(k.spust() + "Kolor: §7" + k.nazwa + " §8(" + k.hex + ")§r");
                break;
            case "glos":
            case "announce":
                if (!uprawnienie(sender, "animacje.glos")) break;
                if (args.length < 2) { sender.sendMessage("§cUzytek: /anim glos <tekst>"); break; }
                StringBuilder msg = new StringBuilder();
                for (int i = 1; i < args.length; i++) {
                    if (i > 1) msg.append(' ');
                    msg.append(args[i]);
                }
                main.ogloszenia().glos(msg.toString(), p);
                sender.sendMessage("§8» §fGlos wyslany do wszystkich.");
                break;
            case "reload":
            case "odswiez":
                if (!uprawnienie(sender, "animacje.admin")) break;
                main.odswiez();
                sender.sendMessage("§8» §fPrzywrócono konfiguracje i katalog.");
                break;
            case "info":
                sender.sendMessage("§d§lAnimacje 2.0 Hub §rv2.0.1");
                sender.sendMessage("§8» §f" + Katalog.iloscAnimowanych() + " animacji §8+ §f" + Katalog.iloscKolorow() + " kolorow §8| pack: §fAnimacje2.0.zip");
                sender.sendMessage("§8» §7Komendy: §f/anim fx|nick|item|troll|kolor|glos|lista|info");
                sender.sendMessage("§8» §7Rangi: §f" + (main.rangi().luckPerms() ? "LuckPerms (aktywny)" : "brak LP (op/player)"));
                break;
            default:
                sender.sendMessage("§cNieznane polecenie: §f" + sub + " §8— /anim help");
        }
        return true;
    }

    private void podgladFx(CommandSender sender, String nazwa) {
        Katalog.Fx f = Katalog.poNazwie(nazwa);
        if (f == null) { sender.sendMessage("§cBrak FX: §f" + nazwa); return; }
        Player p = sender instanceof Player ? (Player) sender : null;
        if (p != null) Silnik.tytul(p, f.spust() + f.nazwa.toUpperCase(), "§8id " + f.id + " §7• §8hx " + f.hex);
        sender.sendMessage(f.spust() + "FX: §7" + f.nazwa + " §8(id " + f.id + ", hx " + f.hex + ")§r");
    }

    private void listaFx(CommandSender sender, String rodzina) {
        List<Katalog.Fx> lista = new ArrayList<>();
        for (Katalog.Fx f : Katalog.ANIMOWANE) {
            if (rodzina == null || f.rodzina.equalsIgnoreCase(rodzina)) lista.add(f);
        }
        if (lista.isEmpty()) { sender.sendMessage("§cBrak FX dla: §f" + rodzina); return; }
        String rodzinaTxt = rodzina == null ? "wszystkie" : rodzina;
        sender.sendMessage("§d§lFX §r§7(" + rodzinaTxt + ", §f" + lista.size() + "):");
        StringBuilder linia = new StringBuilder();
        int licznik = 0;
        for (Katalog.Fx f : lista) {
            String wpis = "§x" + f.hex + f.nazwa + "§r";
            if (linia.length() + wpis.length() > 120 && linia.length() > 0) {
                sender.sendMessage(linia.toString());
                linia.setLength(0);
            }
            if (linia.length() > 0) linia.append(" §8•§r ");
            linia.append(wpis);
            if (++licznik >= 12) { sender.sendMessage(linia.toString()); linia.setLength(0); licznik = 0; }
        }
        if (linia.length() > 0) sender.sendMessage(linia.toString());
    }

    private void pomoz(CommandSender sender) {
        sender.sendMessage("§d§lAnimacje 2.0 Hub §rv2.0.1 §8— komendy:");
        sender.sendMessage("§8» §f/anim §7— menu GUI");
        sender.sendMessage("§8» §f/anim fx <nazwa> §7— podglad FX");
        sender.sendMessage("§8» §f/anim nick [on|off] §7— animowany nick");
        sender.sendMessage("§8» §f/anim item <nazwa> §7— nazwa itemu z FX");
        sender.sendMessage("§8» §f/anim troll [gracz] §7— losowy troll");
        sender.sendMessage("§8» §f/anim kolor <nazwa> §7— kolor statyczny");
        sender.sendMessage("§8» §f/anim glos <msg> §7— ogloszenie (uprawnienie)");
        sender.sendMessage("§8» §f/anim lista [rodzina] §7— katalog FX");
    }

    private boolean uprawnienie(CommandSender s, String perm) {
        if (s.hasPermission(perm)) return true;
        s.sendMessage("§cBrak uprawnienia: §f" + perm);
        return false;
    }

    @Override
    public List<String> onTabComplete(CommandSender sender, Command cmd, String alias, String[] args) {
        List<String> wynik = new ArrayList<>();
        if (args.length == 1) {
            for (String s : new String[] {"fx", "nick", "item", "troll", "kolor", "lista", "glos", "gui", "info", "help", "reload"}) {
                if (s.startsWith(args[0].toLowerCase())) wynik.add(s);
            }
            return wynik;
        }
        if (args.length == 2 && (args[0].equalsIgnoreCase("fx") || args[0].equalsIgnoreCase("item")
                || args[0].equalsIgnoreCase("kolor"))) {
            String pref = args[1].toLowerCase();
            int dodane = 0;
            List<Katalog.Fx> pula = args[0].equalsIgnoreCase("kolor") ? Katalog.KOLORY : Katalog.ANIMOWANE;
            for (Katalog.Fx f : pula) {
                if (f.nazwa.startsWith(pref)) { wynik.add(f.nazwa); if (++dodane >= 20) break; }
            }
        }
        return wynik;
    }
}
