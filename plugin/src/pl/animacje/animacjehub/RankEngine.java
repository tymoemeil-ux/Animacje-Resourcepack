package pl.animacje.animacjehub;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.bukkit.configuration.file.FileConfiguration;
import org.bukkit.entity.Player;

public final class RankEngine {
    private static Object api;
    private static String zrodlo = "brak";
    private static List<String> kolejnosc = new ArrayList<String>();
    private static boolean animowane = true;
    private static java.util.Map<String, String> kolory = new java.util.HashMap<String, String>();
    private static java.util.Map<String, String> vanilla = new java.util.HashMap<String, String>();

    private RankEngine() {}

    public static void init(FileConfiguration cfg) {
        String z = cfg.getString("rangi.zrodlo", "auto").toLowerCase();
        kolejnosc = new ArrayList<String>(cfg.getStringList("rangi.kolejnosc"));
        animowane = cfg.getBoolean("rangi.animowane", true);
        kolory.clear();
        try {
            java.util.Map<String, Object> sek = new java.util.LinkedHashMap<String, Object>();
            List<String> klucze = cfg.getStringList("rangi.kolory-klucze");
            for (String k : klucze) {
                String v = cfg.getString("rangi.kolory." + k, "");
                if (v.length() > 0) kolory.put(k, v);
            }
        } catch (Exception e) { }
        try {
            List<String> vk = cfg.getStringList("rangi.vanilla-klucze");
            for (String k : vk) {
                String v = cfg.getString("rangi.vanilla." + k, "");
                if (v.length() > 0) vanilla.put(k, v);
            }
        } catch (Exception e) { }

        api = null;
        if (z.equals("auto") || z.equals("luckperms")) {
            api = sprubujLuckPerms();
            if (api != null) zrodlo = "LuckPerms";
        }
        if (api == null && (z.equals("auto") || z.equals("lucj"))) {
            api = sprubujLucj();
            if (api != null) zrodlo = "LucjPermissions";
        }
        if (api == null) zrodlo = z.equals("auto") ? "vanilla" : z;
    }

    public static String zrodlo() { return zrodlo; }

    private static Object sprubujLuckPerms() {
        try {
            Class<?> lp = Class.forName("net.luckperms.api.LuckPerms");
            return lp.getMethod("getApi").invoke(null);
        } catch (Throwable t) {
            return null;
        }
    }

    private static Object sprubujLucj() {
        String[] kandydaci = {
            "pl.lucj.permissions.api.LucjPermissions",
            "lucj.permissions.api.LucjPermissions",
            "pl.lucjpermissions.api.LucjPermissions"
        };
        for (String k : kandydaci) {
            try {
                Class<?> c = Class.forName(k);
                return c.getMethod("getApi").invoke(null);
            } catch (Throwable t) {
                // dalej
            }
        }
        return null;
    }

    @SuppressWarnings("unchecked")
    public static String ranga(Player p) {
        if (api != null) {
            try {
                Object holder = api.getClass().getMethod("getPlayer", org.bukkit.OfflinePlayer.class).invoke(api, p);
                if (holder != null) {
                    Method parents = holder.getClass().getMethod("getParents", boolean.class);
                    Set<String> par = (Set<String>) parents.invoke(holder, false);
                    for (String cel : kolejnosc) {
                        for (String pn : par) {
                            if (pn.equalsIgnoreCase("group." + cel) || pn.equalsIgnoreCase(cel)) return cel;
                        }
                    }
                    for (String pn : par) {
                        if (pn.startsWith("group.")) {
                            String g = pn.substring(6);
                            if (kolory.containsKey(g.toLowerCase())) return g.toLowerCase();
                        }
                    }
                }
            } catch (Throwable t) {
                // upadaj na vanilla
            }
        }
        for (java.util.Map.Entry<String, String> e : vanilla.entrySet()) {
            if (p.hasPermission(e.getValue())) return e.getKey().toLowerCase();
        }
        return "";
    }

    public static FxKatalog.Fx kolorDlaRangi(String ranga) {
        if (ranga == null || ranga.length() == 0) return null;
        String hex = kolory.get(ranga.toLowerCase());
        if (hex == null) return null;
        return FxKatalog.kolorDoFx(hex, animowane);
    }

    public static String hexDlaRangi(String ranga) {
        if (ranga == null) return null;
        return kolory.get(ranga.toLowerCase());
    }
}
