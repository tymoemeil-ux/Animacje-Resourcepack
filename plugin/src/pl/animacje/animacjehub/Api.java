package pl.animacje.animacjehub;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

import org.bukkit.Bukkit;
import org.bukkit.event.Listener;
import org.bukkit.plugin.Plugin;
import org.bukkit.plugin.java.JavaPlugin;

public final class Api {
    private static Object pluginManager;
    private static Method regEvents;
    private static Object scheduler;
    private static final Map<String, Method> cache = new HashMap<String, Method>();

    private Api() {}

    public static void init(JavaPlugin plugin) {
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
            t.printStackTrace();
        }
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
                cache.clear();
            }
        } catch (Throwable t) {
            t.printStackTrace();
        }
    }

    public static void registerEvents(Listener l, JavaPlugin p) {
        try {
            if (regEvents != null) regEvents.invoke(pluginManager, l, p);
        } catch (Throwable t) {
            t.printStackTrace();
        }
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
        try {
            Method m = task.getClass().getMethod("cancel");
            m.invoke(task);
        } catch (Throwable t) {
            t.printStackTrace();
        }
    }

    private static synchronized Method find(String name, Object... args) {
        if (scheduler == null) return null;
        Method hit = cache.get(name);
        if (hit != null) {
            if (hit.getParameterCount() == args.length) return hit;
            hit = null;
        }
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
        try {
            Method m = find(name, args);
            if (m == null) {
                System.err.println("[AnimacjeHub] brak metody schedulera: " + name + "/" + args.length);
                return null;
            }
            return m.invoke(scheduler, args);
        } catch (Throwable t) {
            t.printStackTrace();
            return null;
        }
    }
}
