package dev.tymek24.animacje;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import org.bukkit.Bukkit;
import org.bukkit.command.Command;
import org.bukkit.command.CommandExecutor;
import org.bukkit.command.CommandSender;
import org.bukkit.command.TabCompleter;
import org.bukkit.entity.Player;

/** Stabilny router /anim — wszystkie akcje mają osobne permissiony i walidację. */
public final class Polecenia implements CommandExecutor, TabCompleter {
    private static final List<String> SUBCOMMANDS = List.of(
            "fx", "nick", "item", "title", "troll", "rank", "lista", "gui", "info", "glos", "reload", "help");
    private final Animacje plugin;

    public Polecenia(Animacje plugin) {
        this.plugin = plugin;
    }

    @Override
    public boolean onCommand(CommandSender sender, Command command, String label, String[] args) {
        if (args.length == 0) {
            if (sender instanceof Player) plugin.menu().openMain((Player) sender);
            else help(sender);
            return true;
        }
        String sub = args[0].toLowerCase(Locale.ROOT);
        switch (sub) {
            case "help":
            case "pomoc":
                help(sender);
                break;
            case "gui":
                if (sender instanceof Player && require(sender, "animacje.use")) plugin.menu().openMain((Player) sender);
                else if (!(sender instanceof Player)) sender.sendMessage("§cGUI jest dostępne tylko w grze.");
                break;
            case "info":
                info(sender);
                break;
            case "fx":
            case "efekt":
                fx(sender, args);
                break;
            case "lista":
            case "list":
                list(sender, args.length > 1 ? args[1] : null);
                break;
            case "nick":
                nick(sender, args);
                break;
            case "item":
            case "przedmiot":
                item(sender, args);
                break;
            case "title":
            case "tytul":
                title(sender, args);
                break;
            case "troll":
                troll(sender, args);
                break;
            case "rank":
            case "ranga":
                rank(sender);
                break;
            case "glos":
            case "announce":
                announce(sender, args);
                break;
            case "reload":
            case "odswiez":
                if (require(sender, "animacje.admin")) {
                    plugin.reloadPlugin();
                    sender.sendMessage("§8» §aAnimacjeHub v2 przeładowany. Katalog: 50 FX.");
                }
                break;
            default:
                sender.sendMessage("§cNieznana komenda. Użyj §f/anim help§c.");
        }
        return true;
    }

    public void help(CommandSender sender) {
        sender.sendMessage("§d§lAnimacjeHub §rv2 §8— §fAnimacje 3.0 / 50 FX");
        sender.sendMessage("§8» §f/anim §7— menu GUI");
        sender.sendMessage("§8» §f/anim nick [on|off|set <fx> <tekst>|fx <fx>] §7— nick + ranga");
        sender.sendMessage("§8» §f/anim title [gracz|all] <fx> <tytuł> [| podtytuł] §7— animowany title");
        sender.sendMessage("§8» §f/anim item <fx> <nazwa> §7— animowana nazwa itemu w ręce");
        sender.sendMessage("§8» §f/anim item clear §7— usuń nazwę itemu");
        sender.sendMessage("§8» §f/anim troll <gracz> [title|actionbar|chat|sound] §7— kosmetyczny troll");
        sender.sendMessage("§8» §f/anim fx <nazwa> §7— podgląd; /anim lista §7— 50 efektów");
        sender.sendMessage("§8» §f/anim rank §7— pokaż wykrytą rangę; /anim info");
    }

    private void info(CommandSender sender) {
        sender.sendMessage("§d§lAnimacjeHub v2.0.0");
        sender.sendMessage("§8» §fPack: §dAnimacje3.0.zip §8| §fFX: §d" + Katalog.count());
        sender.sendMessage("§8» §fNicki, rangi, title, itemy i bezpieczne trolle są obsługiwane.");
        sender.sendMessage("§8» §fLuckPerms: §7" + (plugin.rangi().luckPerms() ? "aktywny" : "fallback permissionów"));
    }

    private void fx(CommandSender sender, String[] args) {
        if (!require(sender, "animacje.use")) return;
        if (args.length < 2) {
            if (sender instanceof Player) plugin.menu().openFx((Player) sender, 0, "preview");
            else list(sender, null);
            return;
        }
        if (args[1].equalsIgnoreCase("lista")) {
            list(sender, args.length > 2 ? args[2] : null);
            return;
        }
        Katalog.Fx fx = Katalog.byName(args[1]);
        if (fx == null) {
            sender.sendMessage("§cNie znaleziono FX §f" + args[1] + "§c. Użyj §f/anim lista§c.");
            return;
        }
        sender.sendMessage(fx.spust() + "FX §f" + fx.nazwa + " §8• §7" + fx.opis + " §8(" + fx.hex + ")§r");
        if (sender instanceof Player) plugin.titles().wyslij((Player) sender, fx, fx.nazwa.toUpperCase(Locale.ROOT), fx.opis);
    }

    private void list(CommandSender sender, String family) {
        List<Katalog.Fx> result = new ArrayList<>();
        for (Katalog.Fx fx : Katalog.animated()) {
            if (family == null || fx.rodzina.equalsIgnoreCase(family)) result.add(fx);
        }
        if (result.isEmpty()) {
            sender.sendMessage("§cBrak efektów dla rodziny: §f" + family);
            return;
        }
        sender.sendMessage("§d§lAnimacje 3.0 §r§8— §f" + result.size() + " FX" + (family == null ? "" : " / " + family));
        StringBuilder line = new StringBuilder();
        for (int i = 0; i < result.size(); i++) {
            Katalog.Fx fx = result.get(i);
            String entry = fx.spust() + fx.nazwa + "§r";
            if (line.length() + entry.length() > 110 && line.length() > 0) {
                sender.sendMessage(line.toString());
                line.setLength(0);
            }
            if (line.length() > 0) line.append(" §8• ");
            line.append(entry);
        }
        if (line.length() > 0) sender.sendMessage(line.toString());
    }

    private void nick(CommandSender sender, String[] args) {
        if (!(sender instanceof Player)) {
            sender.sendMessage("§cNick można ustawiać tylko w grze.");
            return;
        }
        if (!require(sender, "animacje.nick")) return;
        Player player = (Player) sender;
        Profil profile = plugin.profiles().get(player);
        if (args.length == 1) {
            Katalog.Fx fx = Katalog.byName(profile.fx);
            sender.sendMessage("§8» §fNick: " + Tekst.status(profile.nickWlaczony) + " §8• §fFX: §b" + (fx == null ? "?" : fx.nazwa)
                    + " §8• §fRanga: §b" + plugin.rangi().opis(player));
            return;
        }
        String action = args[1].toLowerCase(Locale.ROOT);
        if (action.equals("on") || action.equals("off") || action.equals("wl") || action.equals("wyl")) {
            plugin.profiles().setNickEnabled(player, action.equals("on") || action.equals("wl"));
            sender.sendMessage("§8» §fAnimowany nick: " + Tekst.status(plugin.profiles().get(player).nickWlaczony));
            return;
        }
        if (action.equals("toggle") || action.equals("przelacz")) {
            plugin.profiles().toggleNick(player);
            sender.sendMessage("§8» §fAnimowany nick: " + Tekst.status(plugin.profiles().get(player).nickWlaczony));
            return;
        }
        if (action.equals("clear") || action.equals("wyczysc")) {
            plugin.profiles().clearNick(player);
            sender.sendMessage("§8» §fPrzywrócono nick konta.");
            return;
        }
        if (action.equals("random") || action.equals("losowy")) {
            Katalog.Fx fx = Katalog.random();
            plugin.profiles().setFx(player, fx);
            sender.sendMessage("§8» §fWylosowano FX nicku: §b" + fx.nazwa);
            return;
        }
        if (action.equals("fx")) {
            if (args.length < 3) {
                sender.sendMessage("§cUżycie: /anim nick fx <nazwa>");
                return;
            }
            setNickFx(player, args[2]);
            return;
        }
        if (action.equals("set") || action.equals("ustaw")) {
            if (args.length < 3) {
                sender.sendMessage("§cUżycie: /anim nick set <fx> <tekst> albo /anim nick set <tekst>");
                return;
            }
            Katalog.Fx fx = Katalog.byName(args[2]);
            int textStart = fx == null ? 2 : 3;
            String nick = Narzedzia.polacz(args, textStart);
            if (nick.isBlank()) {
                sender.sendMessage("§cNick nie może być pusty.");
                return;
            }
            if (fx != null) plugin.profiles().setFx(player, fx);
            plugin.profiles().setNick(player, nick);
            plugin.profiles().setNickEnabled(player, true);
            sender.sendMessage("§8» §fUstawiono animowany nick: " + Tekst.animowany(fx == null ? Katalog.byName(profile.fx) : fx, nick));
            return;
        }
        // Skrót: /anim nick <fx> albo /anim nick <tekst>.
        Katalog.Fx fx = Katalog.byName(args[1]);
        if (fx != null) {
            plugin.profiles().setFx(player, fx);
            sender.sendMessage("§8» §fFX nicku ustawiony na §b" + fx.nazwa + "§f.");
        } else {
            plugin.profiles().setNick(player, Narzedzia.polacz(args, 1));
            plugin.profiles().setNickEnabled(player, true);
            sender.sendMessage("§8» §fUstawiono tekst nicku. FX: §b" + profile.fx);
        }
    }

    private void setNickFx(Player player, String name) {
        Katalog.Fx fx = Katalog.byName(name);
        if (fx == null) {
            player.sendMessage("§cNie znaleziono FX: §f" + name);
            return;
        }
        plugin.profiles().setFx(player, fx);
        player.sendMessage("§8» §fFX nicku: §b" + fx.nazwa);
    }

    private void item(CommandSender sender, String[] args) {
        if (!(sender instanceof Player)) {
            sender.sendMessage("§cItem można nazwać tylko w grze.");
            return;
        }
        if (!require(sender, "animacje.item")) return;
        Player player = (Player) sender;
        if (args.length == 1) {
            plugin.menu().openFx(player, 0, "item");
            return;
        }
        if (args[1].equalsIgnoreCase("clear") || args[1].equalsIgnoreCase("wyczysc")) {
            sender.sendMessage(plugin.items().wyczysc(player) ? "§8» §aUsunięto nazwę itemu." : "§cTrzymaj item z własną nazwą w głównej ręce.");
            return;
        }
        int fxIndex = args[1].equalsIgnoreCase("set") ? 2 : 1;
        if (args.length <= fxIndex + 1) {
            sender.sendMessage("§cUżycie: /anim item <fx> <nazwa>");
            return;
        }
        Katalog.Fx fx = Katalog.byName(args[fxIndex]);
        if (fx == null) {
            sender.sendMessage("§cNie znaleziono FX: §f" + args[fxIndex]);
            return;
        }
        String name = Narzedzia.polacz(args, fxIndex + 1);
        sender.sendMessage(plugin.items().ustaw(player, fx, name)
                ? "§8» §fNazwa itemu ustawiona z FX §b" + fx.nazwa + "§f."
                : "§cTrzymaj item w głównej ręce.");
    }

    private void title(CommandSender sender, String[] args) {
        if (!require(sender, "animacje.title")) return;
        int index = 1;
        java.util.Collection<? extends Player> targets;
        if (index >= args.length) {
            if (!(sender instanceof Player)) {
                sender.sendMessage("§cUżycie: /anim title [gracz|all] <fx> <tytuł> [| podtytuł]");
                return;
            }
            targets = List.of((Player) sender);
        } else if (args[index].equalsIgnoreCase("all")) {
            if (!require(sender, "animacje.title.broadcast")) return;
            targets = Bukkit.getOnlinePlayers();
            index++;
        } else {
            Player named = Bukkit.getPlayer(args[index]);
            if (named != null && !isEffect(args[index])) {
                if (!require(sender, "animacje.title.others")) return;
                targets = List.of(named);
                index++;
            } else if (sender instanceof Player) {
                targets = List.of((Player) sender);
            } else {
                sender.sendMessage("§cZ konsoli podaj gracza albo all.");
                return;
            }
        }
        Katalog.Fx fx = index < args.length ? Katalog.byName(args[index]) : null;
        if (fx != null) index++;
        if (fx == null) fx = Katalog.byName(plugin.config().nickDefaultFx());
        if (fx == null) fx = Katalog.random();
        if (index >= args.length) {
            sender.sendMessage("§cPodaj tekst title. Oddziel subtitle znakiem |.");
            return;
        }
        String[] title = Narzedzia.podzielTytul(Narzedzia.polacz(args, index));
        for (Player target : targets) plugin.titles().wyslij(target, fx, title[0], title[1]);
        sender.sendMessage("§8» §fWysłano animowany title z FX §b" + fx.nazwa + "§f.");
    }

    private boolean isEffect(String value) {
        return Katalog.byName(value) != null;
    }

    private void troll(CommandSender sender, String[] args) {
        if (!(sender instanceof Player)) {
            sender.sendMessage("§cTroll można uruchomić tylko w grze.");
            return;
        }
        if (!require(sender, "animacje.troll")) return;
        Player actor = (Player) sender;
        int index = 1;
        Player target = actor;
        if (index < args.length) {
            Player named = Bukkit.getPlayer(args[index]);
            if (named != null) {
                target = named;
                index++;
            }
        }
        if (target != actor && !require(sender, "animacje.troll.others")) return;
        String type = null;
        Katalog.Fx fx = null;
        while (index < args.length) {
            Katalog.Fx parsed = Katalog.byName(args[index]);
            if (parsed != null) fx = parsed;
            else type = args[index];
            index++;
        }
        if (plugin.trolls().execute(actor, target, type, fx)) {
            sender.sendMessage("§8» §fWykonano kosmetyczny troll na §b" + target.getName() + "§f.");
        }
    }

    private void rank(CommandSender sender) {
        if (!(sender instanceof Player)) {
            sender.sendMessage("§cRangę można sprawdzić tylko w grze.");
            return;
        }
        Player player = (Player) sender;
        sender.sendMessage("§8» §fTwoja ranga: §d" + plugin.rangi().opis(player));
        sender.sendMessage("§8» §fAnimowany prefix jest aktywny w czacie, jeśli rangi.wlaczone=true.");
    }

    private void announce(CommandSender sender, String[] args) {
        if (!require(sender, "animacje.announce")) return;
        if (args.length < 2) {
            sender.sendMessage("§cUżycie: /anim glos <tekst> (użyj {fx}, aby animować fragment)");
            return;
        }
        plugin.announcements().send(Narzedzia.polacz(args, 1), sender instanceof Player ? (Player) sender : null);
        sender.sendMessage("§8» §fOgłoszenie wysłane.");
    }

    private boolean require(CommandSender sender, String permission) {
        if (sender.hasPermission(permission)) return true;
        sender.sendMessage("§cBrak uprawnienia: §f" + permission);
        return false;
    }

    @Override
    public List<String> onTabComplete(CommandSender sender, Command command, String alias, String[] args) {
        if (args.length == 1) return startsWith(SUBCOMMANDS, args[0]);
        if (args.length == 2) {
            String sub = args[0].toLowerCase(Locale.ROOT);
            if (sub.equals("fx") || sub.equals("efekt") || sub.equals("lista") || sub.equals("list")) return fxNames(args[1]);
            if (sub.equals("nick")) return startsWith(List.of("on", "off", "toggle", "set", "fx", "random", "clear"), args[1]);
            if (sub.equals("item")) {
                List<String> result = new ArrayList<>(fxNames(args[1]));
                result.addAll(startsWith(List.of("set", "clear"), args[1]));
                return result;
            }
            if (sub.equals("title") || sub.equals("tytul")) {
                List<String> result = new ArrayList<>(fxNames(args[1]));
                result.addAll(playerNames(args[1]));
                return result;
            }
            if (sub.equals("troll")) return playerNames(args[1]);
        }
        if (args.length == 3 && args[0].equalsIgnoreCase("nick")
                && (args[1].equalsIgnoreCase("fx") || args[1].equalsIgnoreCase("set"))) return fxNames(args[2]);
        if (args.length == 3 && args[0].equalsIgnoreCase("item") && args[1].equalsIgnoreCase("set")) return fxNames(args[2]);
        if (args.length == 3 && (args[0].equalsIgnoreCase("title") || args[0].equalsIgnoreCase("tytul"))) return fxNames(args[2]);
        return Collections.emptyList();
    }

    private List<String> fxNames(String prefix) {
        List<String> names = new ArrayList<>();
        String wanted = prefix == null ? "" : prefix.toLowerCase(Locale.ROOT);
        for (Katalog.Fx fx : Katalog.animated()) if (fx.nazwa.startsWith(wanted)) names.add(fx.nazwa);
        return names;
    }

    private List<String> playerNames(String prefix) {
        List<String> names = new ArrayList<>();
        String wanted = prefix == null ? "" : prefix.toLowerCase(Locale.ROOT);
        if ("all".startsWith(wanted)) names.add("all");
        for (Player player : Bukkit.getOnlinePlayers()) if (player.getName().toLowerCase(Locale.ROOT).startsWith(wanted)) names.add(player.getName());
        return names;
    }

    private List<String> startsWith(List<String> values, String prefix) {
        String wanted = prefix == null ? "" : prefix.toLowerCase(Locale.ROOT);
        List<String> result = new ArrayList<>();
        for (String value : values) if (value.startsWith(wanted)) result.add(value);
        return result;
    }
}
