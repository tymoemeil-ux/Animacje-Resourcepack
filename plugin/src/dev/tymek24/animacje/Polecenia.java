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
            "fx", "nick", "item", "title", "troll", "custom", "color", "preview", "actionbar", "chat", "pack", "profile", "profil", "settings", "reset", "random", "rank", "lista", "gui", "info", "glos", "reload", "help");
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
            case "custom":
            case "color":
            case "kolor":
                custom(sender, args);
                break;
            case "preview":
            case "podglad":
                preview(sender, args);
                break;
            case "actionbar":
            case "bar":
                actionbar(sender, args);
                break;
            case "chat":
                animatedChat(sender, args);
                break;
            case "pack":
            case "resourcepack":
                sendPack(sender);
                break;
            case "profile":
            case "profil":
                profile(sender);
                break;
            case "settings":
            case "ustawienia":
                settings(sender);
                break;
            case "reset":
            case "wyzeruj":
                reset(sender);
                break;
            case "random":
            case "losuj":
                random(sender);
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
                    sender.sendMessage("§8» §aAnimacjeHub v2.2 przeładowany. Katalog: " + Katalog.count() + " FX.");
                }
                break;
            default:
                sender.sendMessage("§cNieznana komenda. Użyj §f/anim help§c.");
        }
        return true;
    }

    public void help(CommandSender sender) {
        sender.sendMessage("§d§lAnimacjeHub §rv2.2 §8— §fAnimacje 3.1 / " + Katalog.count() + " FX / target " + plugin.config().targetFps() + " FPS");
        sender.sendMessage("§8» §f/anim §7— menu GUI");
        sender.sendMessage("§8» §f/anim nick [on|off|set <fx> <tekst>|fx <fx>] §7— nick + ranga");
        sender.sendMessage("§8» §f/anim custom <kolor> <fx> <tekst> §7— custom title");
        sender.sendMessage("§8» §f/anim custom nick <kolor> <fx> <tekst> §7— custom nick");
        sender.sendMessage("§8» §f/anim custom item <kolor> <fx> <nazwa> §7— custom item");
        sender.sendMessage("§8» §fKolory: §f&c §7/ §f&g §7/ §f#RGB §7/ §f#RRGGBB");
        sender.sendMessage("§8» §f/anim title [gracz|all] <fx> <tytuł> [| podtytuł] §7— animowany title");
        sender.sendMessage("§8» §f/anim item <fx> <nazwa> §7— animowana nazwa itemu w ręce");
        sender.sendMessage("§8» §f/anim item clear §7— usuń nazwę itemu");
        sender.sendMessage("§8» §f/anim preview [kolor] <fx> <tekst> §7— szybki podgląd title");
        sender.sendMessage("§8» §f/anim actionbar [kolor] <fx> <tekst> §7— animowany pasek");
        sender.sendMessage("§8» §f/anim chat [kolor] <fx> <tekst> §7— animowana wiadomość");
        sender.sendMessage("§8» §f/anim pack §7— ponownie wyślij resourcepack");
        sender.sendMessage("§8» §f/anim profile|settings|reset|random §7— profil i narzędzia");
        sender.sendMessage("§8» §f/anim troll <gracz> [title|actionbar|chat|sound|bossbar] §7— troll");
        sender.sendMessage("§8» §f/anim fx <nazwa> §7— podgląd; /anim lista §7— " + Katalog.count() + " efektów");
        sender.sendMessage("§8» §f/anim rank §7— pokaż wykrytą rangę; /anim info");
    }

    private void preview(CommandSender sender, String[] args) {
        if (!(sender instanceof Player)) {
            sender.sendMessage("§cPodgląd jest dostępny tylko w grze.");
            return;
        }
        if (!require(sender, "animacje.preview")) return;
        RenderSpec spec = renderSpec(sender, args, 1);
        if (spec == null) return;
        if (spec.color != null && !require(sender, "animacje.custom")) return;
        Player player = (Player) sender;
        plugin.titles().wyslij(player, spec.fx, spec.color, spec.text, "");
        sender.sendMessage("§8» §fPodgląd: §b" + spec.fx.nazwa + "§f" + (spec.color == null ? "" : " §8• §b" + spec.color));
    }

    private void actionbar(CommandSender sender, String[] args) {
        if (!(sender instanceof Player)) {
            sender.sendMessage("§cActionbar jest dostępny tylko w grze.");
            return;
        }
        if (!require(sender, "animacje.actionbar")) return;
        RenderSpec spec = renderSpec(sender, args, 1);
        if (spec == null) return;
        if (spec.color != null && !require(sender, "animacje.custom")) return;
        Player player = (Player) sender;
        String rendered = spec.color == null ? Tekst.animowany(spec.fx, spec.text) : Tekst.custom(spec.fx, spec.color, spec.text);
        player.sendActionBar(rendered);
        sender.sendMessage("§8» §fWysłano actionbar z FX §b" + spec.fx.nazwa + "§f.");
    }

    private void animatedChat(CommandSender sender, String[] args) {
        if (!(sender instanceof Player)) {
            sender.sendMessage("§cAnimowany chat jest dostępny tylko w grze.");
            return;
        }
        if (!require(sender, "animacje.chat")) return;
        if (!plugin.config().chatEnabled()) {
            sender.sendMessage("§cAnimowany chat jest wyłączony w konfiguracji.");
            return;
        }
        RenderSpec spec = renderSpec(sender, args, 1);
        if (spec == null) return;
        if (spec.color != null && !require(sender, "animacje.custom")) return;
        String rendered = spec.color == null ? Tekst.animowany(spec.fx, spec.text) : Tekst.custom(spec.fx, spec.color, spec.text);
        Bukkit.broadcastMessage(rendered);
        sender.sendMessage("§8» §fWysłano animowaną wiadomość.");
    }

    private void sendPack(CommandSender sender) {
        if (!(sender instanceof Player)) {
            sender.sendMessage("§cResourcepack można wysłać tylko graczowi.");
            return;
        }
        if (!require(sender, "animacje.pack")) return;
        if (plugin.config().resourcePackUrl().isBlank()) {
            sender.sendMessage("§cResourcepack nie ma ustawionego URL-a w config.yml.");
            return;
        }
        plugin.resourcePack().send((Player) sender);
        sender.sendMessage("§8» §fPonowiono wysyłanie resourcepacka.");
    }

    private void profile(CommandSender sender) {
        if (!(sender instanceof Player)) {
            sender.sendMessage("§cProfil jest dostępny tylko w grze.");
            return;
        }
        if (!require(sender, "animacje.profile")) return;
        nick(sender, new String[] {"nick"});
    }

    private void settings(CommandSender sender) {
        if (!require(sender, "animacje.settings")) return;
        sender.sendMessage("§d§lAnimacjeHub — ustawienia runtime");
        sender.sendMessage("§8» §fFX: §b" + Katalog.count() + " §8| §fTarget: §b" + plugin.config().targetFps() + " FPS");
        sender.sendMessage("§8» §fCustom kolory: §b" + (plugin.config().customEnabled() ? "ON" : "OFF"));
        sender.sendMessage("§8» §fRangi: §b" + (plugin.config().rankEnabled() ? "ON" : "OFF")
                + " §8| §fChat: §b" + (plugin.config().chatEnabled() ? "ON" : "OFF"));
        sender.sendMessage("§8» §fAby zmienić ustawienia, edytuj config.yml i użyj /anim reload.");
    }

    private void reset(CommandSender sender) {
        if (!(sender instanceof Player)) {
            sender.sendMessage("§cProfil można wyzerować tylko w grze.");
            return;
        }
        if (!require(sender, "animacje.profile")) return;
        plugin.profiles().reset((Player) sender);
        sender.sendMessage("§8» §aProfil zresetowany do ustawień domyślnych.");
    }

    private void random(CommandSender sender) {
        if (!(sender instanceof Player)) {
            sender.sendMessage("§cLosowanie FX jest dostępne tylko w grze.");
            return;
        }
        nick(sender, new String[] {"nick", "random"});
    }

    private RenderSpec renderSpec(CommandSender sender, String[] args, int start) {
        if (args.length <= start + 1) {
            sender.sendMessage("§cUżycie: /anim preview [kolor] <fx> <tekst>");
            return null;
        }
        String color = null;
        int fxIndex = start;
        if (Kolory.normalizuj(args[fxIndex]) != null && fxIndex + 1 < args.length
                && Katalog.byName(args[fxIndex + 1]) != null) {
            color = Kolory.normalizuj(args[fxIndex]);
            fxIndex++;
        }
        Katalog.Fx fx = Katalog.byName(args[fxIndex]);
        if (fx == null) {
            sender.sendMessage("§cNie znaleziono FX: §f" + args[fxIndex]);
            return null;
        }
        if (!canUseFx(sender, fx)) return null;
        String text = Narzedzia.polacz(args, fxIndex + 1);
        if (text.isBlank()) {
            sender.sendMessage("§cTekst nie może być pusty.");
            return null;
        }
        return new RenderSpec(fx, color, text);
    }

    private static final class RenderSpec {
        final Katalog.Fx fx;
        final String color;
        final String text;

        RenderSpec(Katalog.Fx fx, String color, String text) {
            this.fx = fx;
            this.color = color;
            this.text = text;
        }
    }

    private void custom(CommandSender sender, String[] args) {
        if (!(sender instanceof Player)) {
            sender.sendMessage("§cCustomowe animacje są dostępne tylko w grze.");
            return;
        }
        if (!require(sender, "animacje.custom")) return;
        if (!plugin.config().customEnabled()) {
            sender.sendMessage("§cTryb custom jest wyłączony w konfiguracji.");
            return;
        }
        Player player = (Player) sender;
        String mode = args.length > 1 ? args[1].toLowerCase(Locale.ROOT) : "title";
        boolean explicitMode = mode.equals("nick") || mode.equals("item") || mode.equals("title");
        int colorIndex = explicitMode ? 2 : 1;
        int fxIndex = colorIndex + 1;
        int textIndex = fxIndex + 1;
        if (args.length <= textIndex) {
            sender.sendMessage("§cUżycie: /anim custom [nick|item|title] <&c|&g|#RGB|#RRGGBB> <fx> <tekst>");
            return;
        }
        String color = Kolory.normalizuj(args[colorIndex]);
        if (color == null) {
            sender.sendMessage("§cNiepoprawny kolor. Użyj &c, &g, #RGB albo #RRGGBB.");
            return;
        }
        Katalog.Fx fx = Katalog.byName(args[fxIndex]);
        if (fx == null) {
            sender.sendMessage("§cNie znaleziono FX: §f" + args[fxIndex]);
            return;
        }
        if (!canUseFx(sender, fx)) return;
        String text = Narzedzia.polacz(args, textIndex);
        if (mode.equals("nick")) {
            if (!require(sender, "animacje.nick.custom")) return;
            plugin.profiles().setFx(player, fx);
            plugin.profiles().setColor(player, color);
            plugin.profiles().setNick(player, text);
            plugin.profiles().setNickEnabled(player, true);
            sender.sendMessage("§8» §fCustom nick ustawiony: " + Tekst.custom(fx, color, text));
        } else if (mode.equals("item")) {
            if (!require(sender, "animacje.item.custom")) return;
            sender.sendMessage(plugin.items().ustawCustom(player, fx, color, text)
                    ? "§8» §fCustomowa nazwa itemu ustawiona kolorem §b" + color + "§f."
                    : "§cTrzymaj item w głównej ręce.");
        } else {
            plugin.titles().wyslij(player, fx, color, text, "");
            sender.sendMessage("§8» §fWysłano custom title z kolorem §b" + color + "§f.");
        }
    }

    private void info(CommandSender sender) {
        sender.sendMessage("§d§lAnimacjeHub v2.2.0");
        sender.sendMessage("§8» §fPack: §dAnimacje3.1 / Animacje3.0.zip §8| §fFX: §d" + Katalog.count());
        sender.sendMessage("§8» §fNicki, rangi, title, itemy, custom kolory i bezpieczne trolle są obsługiwane.");
        sender.sendMessage("§8» §fPremium: 25 nowych FX | Hakerskie: 10 FX (permission animacje.hacker).");
        sender.sendMessage("§8» §fLuckPerms: §7" + (plugin.rangi().luckPerms() ? "aktywny" : "fallback permissionów"));
    }

    private void fx(CommandSender sender, String[] args) {
        if (!require(sender, "animacje.use")) return;
        if (!require(sender, "animacje.fx")) return;
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
        if (!canUseFx(sender, fx)) return;
        sender.sendMessage(fx.spust() + "FX §f" + fx.nazwa + " §8• §7" + fx.opis + " §8(" + fx.hex + ")§r");
        if (sender instanceof Player) plugin.titles().wyslij((Player) sender, fx, fx.nazwa.toUpperCase(Locale.ROOT), fx.opis);
    }

    private void list(CommandSender sender, String family) {
        if (!require(sender, "animacje.fx")) return;
        List<Katalog.Fx> result = new ArrayList<>();
        boolean canSeeHackers = sender.hasPermission("animacje.hacker");
        for (Katalog.Fx fx : Katalog.visible(canSeeHackers)) {
            if (family == null || fx.rodzina.equalsIgnoreCase(family)) result.add(fx);
        }
        if (result.isEmpty()) {
            sender.sendMessage("§cBrak efektów dla rodziny: §f" + family);
            return;
        }
        sender.sendMessage("§d§lAnimacje 3.1 §r§8— §f" + result.size() + " FX" + (family == null ? "" : " / " + family));
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
                    + " §8• §fKolor: §b" + (profile.kolor.isBlank() ? "efektu" : profile.kolor)
                    + " §8• §fRanga: §b" + plugin.rangi().opis(player));
            return;
        }
        String action = args[1].toLowerCase(Locale.ROOT);
        if (action.equals("custom")) {
            if (args.length < 5) {
                sender.sendMessage("§cUżycie: /anim nick custom <kolor> <fx> <tekst>");
                return;
            }
            String[] customArgs = new String[args.length];
            customArgs[0] = "custom";
            customArgs[1] = "nick";
            System.arraycopy(args, 2, customArgs, 2, args.length - 2);
            custom(sender, customArgs);
            return;
        }
        if (action.equals("color") || action.equals("kolor")) {
            if (args.length < 3) {
                sender.sendMessage("§cUżycie: /anim nick color <&c|&g|#RRGGBB> (clear usuwa custom)");
                return;
            }
            if (args[2].equalsIgnoreCase("clear") || args[2].equalsIgnoreCase("wyczysc")) {
                plugin.profiles().clearColor(player);
                sender.sendMessage("§8» §fPrzywrócono kolor renderowany przez FX.");
            } else if (Kolory.normalizuj(args[2]) == null) {
                sender.sendMessage("§cNiepoprawny kolor. Użyj &c, &g, #RGB albo #RRGGBB.");
            } else {
                plugin.profiles().setColor(player, args[2]);
                sender.sendMessage("§8» §fKolor nicku: §b" + Kolory.normalizuj(args[2]));
            }
            return;
        }
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
            plugin.profiles().clearColor(player);
            sender.sendMessage("§8» §fPrzywrócono nick konta i kolor FX.");
            return;
        }
        if (action.equals("random") || action.equals("losowy")) {
            Katalog.Fx fx = Katalog.random(player.hasPermission("animacje.hacker"));
            plugin.profiles().clearColor(player);
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
            if (fx != null) {
                if (!canUseFx(sender, fx)) return;
                plugin.profiles().setFx(player, fx);
            }
            plugin.profiles().clearColor(player);
            plugin.profiles().setNick(player, nick);
            plugin.profiles().setNickEnabled(player, true);
            sender.sendMessage("§8» §fUstawiono animowany nick: " + Tekst.animowany(fx == null ? Katalog.byName(profile.fx) : fx, nick));
            return;
        }
        // Skrót: /anim nick <fx> albo /anim nick <tekst>.
        Katalog.Fx fx = Katalog.byName(args[1]);
        if (fx != null) {
            if (!canUseFx(sender, fx)) return;
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
        if (!canUseFx(player, fx)) return;
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
        if (!canUseFx(sender, fx)) return;
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
        if (fx == null) fx = Katalog.random(sender.hasPermission("animacje.hacker"));
        if (!canUseFx(sender, fx)) return;
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
        if (!canUseFx(sender, fx)) return;
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

    private boolean canUseFx(CommandSender sender, Katalog.Fx fx) {
        return fx == null || !fx.hakerski() || require(sender, "animacje.hacker");
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
            if (sub.equals("nick")) return startsWith(List.of("on", "off", "toggle", "set", "fx", "color", "custom", "random", "clear"), args[1]);
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
            if (sub.equals("preview") || sub.equals("podglad") || sub.equals("actionbar") || sub.equals("bar") || sub.equals("chat")) {
                List<String> result = new ArrayList<>(fxNames(args[1]));
                result.addAll(startsWith(List.of("&c", "&g", "#FFFFFF", "#55FFAA", "#FF55AA"), args[1]));
                return result;
            }
            if (sub.equals("profile") || sub.equals("profil")) return Collections.emptyList();
            if (sub.equals("custom") || sub.equals("color") || sub.equals("kolor")) {
                return startsWith(List.of("nick", "item", "title", "&c", "&g", "#FFFFFF", "#55FFAA"), args[1]);
            }
        }
        if (args.length == 3 && (args[0].equalsIgnoreCase("preview") || args[0].equalsIgnoreCase("podglad")
                || args[0].equalsIgnoreCase("actionbar") || args[0].equalsIgnoreCase("bar") || args[0].equalsIgnoreCase("chat"))) {
            return Kolory.normalizuj(args[1]) == null ? Collections.emptyList() : fxNames(args[2]);
        }
        if (args.length == 3 && (args[0].equalsIgnoreCase("custom") || args[0].equalsIgnoreCase("color") || args[0].equalsIgnoreCase("kolor"))) {
            if (args[1].equalsIgnoreCase("nick") || args[1].equalsIgnoreCase("item") || args[1].equalsIgnoreCase("title")) {
                return startsWith(List.of("&c", "&g", "#FFFFFF", "#55FFAA", "#FF55AA"), args[2]);
            }
            return fxNames(args[2]);
        }
        if (args.length == 4 && args[0].equalsIgnoreCase("custom")
                && (args[1].equalsIgnoreCase("nick") || args[1].equalsIgnoreCase("item") || args[1].equalsIgnoreCase("title"))) {
            return fxNames(args[3]);
        }
        if (args.length == 3 && args[0].equalsIgnoreCase("nick")
                && (args[1].equalsIgnoreCase("fx") || args[1].equalsIgnoreCase("set"))) return fxNames(args[2]);
        if (args.length == 3 && args[0].equalsIgnoreCase("item") && args[1].equalsIgnoreCase("set")) return fxNames(args[2]);
        if (args.length == 3 && (args[0].equalsIgnoreCase("title") || args[0].equalsIgnoreCase("tytul"))) return fxNames(args[2]);
        if (args.length == 3 && args[0].equalsIgnoreCase("troll")) {
            return startsWith(List.of("title", "actionbar", "chat", "sound", "bossbar", "random"), args[2]);
        }
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
