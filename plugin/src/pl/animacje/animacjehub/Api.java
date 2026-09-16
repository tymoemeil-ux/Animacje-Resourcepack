package pl.animacje.animacjehub;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Logger;

import org.bukkit.Bukkit;
import org.bukkit.command.CommandExecutor;
import org.bukkit.command.TabCompleter;
import org.bukkit.event.Listener;
import org.bukkit.plugin.Plugin;
import org.bukkit.plugin.java.JavaPlugin;

public final class Api {
    private static Object pluginManager;
    private static Method regEvents;
    private static Object scheduler;
    private static Logger log;
    private static final Map<String, Method> cache = new HashMap<String, Method>();

    private Api() {}

    public static void init(JavaPlugin plugin) {
        log = plugin.getLogger();
        // --- plugin manager ---
        try {
            Method m = Bukkit.class.getMethod("getPluginManager");
            pluginManager = m.invoke(null);
            for (Method mm : pluginManager.getClass().getMethods()) {
                if (mm.getName().equals("registerEvents") && mm.getParameterCount() == 2
                        && mm.getParameterTypes()[0].isAssignableFrom(Listener.class)
                        && mm.getParameterTypes()[1].isAssignableFrom(Plugin.class)) {
                    regEvents = mm;
                    break;
                }
            }
        } catch (Throwable t) {
            log.severe("Api: getPluginManager nie dziala: " + t);
        }
        // --- scheduler: najpierw JavaPlugin#getScheduler(), fallback Bukkit#getScheduler() ---
        try {
            Method sm = null;
            for (Method mm : JavaPlugin.class.getMethods()) {
                if (mm.getName().equals("getScheduler") && mm.getParameterCount() == 0) {
                    sm = mm;
                    break;
                }
            }
            if (sm != null) {
                scheduler = sm.invoke(plugin);
            }
        } catch (Throwable t) {
            scheduler = null;
        }
        if (scheduler == null) {
            try {
                scheduler = Bukkit.class.getMethod("getScheduler").invoke(null);
            } catch (Throwable t) {
                log.severe("Api: brak schedulera: " + t);
            }
        }
        if (scheduler != null) {
            cache.clear();
            log.info("Api: scheduler = " + scheduler.getClass().getName());
        }
    }

    public static void registerEvents(Listener l, JavaPlugin p) {
        try {
            if (regEvents != null) {
                regEvents.invoke(pluginManager, l, p);
            } else {
                log.severe("Api: brak metody registerEvents");
            }
        } catch (Throwable t) {
            log.severe("Api: registerEvents nie dziala: " + t);
        }
    }

    public static Object getCommand(JavaPlugin p, String name) {
        try {
            for (Method m : p.getClass().getMethods()) {
                if (m.getName().equals("getCommand") && m.getParameterCount() == 1
                        && m.getParameterTypes()[0].isAssignableFrom(String.class)) {
                    return m.invoke(p, name);
                }
            }
        } catch (Throwable t) {
            log.severe("Api: getCommand nie dziala: " + t);
        }
        return null;
    }

    public static void commandSet(Object cmd, CommandExecutor ex, TabCompleter tc) {
        if (cmd == null) return;
        call(cmd, "setExecutor", ex);
        call(cmd, "setTabCompleter", tc);
    }

    public static Object runTask(JavaPlugin p, Runnable r) {
        return invoke("runTask", p, r);
    }

    public static Object runTaskLater(JavaPlugin p, Runnable r, long delay) {
        return invoke("runTaskLater", p, r, Long.valueOf(delay));
    }

    public static Object runTaskTimer(JavaPlugin p, Runnable r, long delay, long period) {
        return invoke("runTaskTimer", p, r, Long.valueOf(delay), Long.valueOf(period));
    }

    public static void cancelTasks(JavaPlugin p) {
        invoke("cancelTasks", p);
    }

    public static void taskCancel(Object task) {
        if (task == null) return;
        call(task, "cancel");
    }

    private static void call(Object obj, String name, Object... args) {
        try {
            for (Method m : obj.getClass().getMethods()) {
                if (m.getName().equals(name) && m.getParameterCount() == args.length) {
                    m.invoke(obj, args);
                    return;
                }
            }
            log.severe("Api: brak metody " + name + "/" + args.length + " na " + obj.getClass().getName());
        } catch (Throwable t) {
            log.severe("Api: " + name + " nie dziala: " + t);
        }
    }

    private static synchronized Method find(String name, Object... args) {
        if (scheduler == null) return null;
        Method hit = cache.get(name);
        if (hit != null && hit.getParameterCount() == args.length) return hit;
        for (Method m : scheduler.getClass().getMethods()) {
            if (!m.getName().equals(name) || m.getParameterCount() != args.length) continue;
            Class<?>[] pt = m.getParameterTypes();
            boolean ok = true;
            for (int i = 0; i < pt.length; i++) {
                if (args[i] == null) continue;
                if (pt[i].isPrimitive()) {
                    if (!(args[i] instanceof Long)) { ok = false; break; }
                } else if (!pt[i].isAssignableFrom(args[i].getClass())) {
                    ok = false;
                    break;
                }
            }
            if (ok) {
                cache.put(name, m);
                return m;
            }
        }
        return null;
    }

    private static Object invoke(String name, Object... args) {
        Method m = find(name, args);
        if (m != null) {
            try {
                return m.invoke(scheduler, args);
            } catch (Throwable t) {
                // fallback
            }
        }
        if (scheduler != null) {
            for (Method c : scheduler.getClass().getMethods()) {
                if (!c.getName().equals(name) || c.getParameterCount() != args.length) continue;
                try {
                    return c.invoke(scheduler, args);
                } catch (Throwable t) {
                    // nastepna kandydatura
                }
            }
        }
        log.severe("Api: brak dzialajacej metody schedulera: " + name + "/" + args.length
                + (scheduler != null ? " (scheduler: " + scheduler.getClass().getName() + ")" : ""));
        return null;
    }
}
