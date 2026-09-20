package dev.tymek24.animacje;

import java.lang.reflect.Method;
import org.bukkit.entity.Player;

/** Opcjonalne wysłanie packa z URL-a; brak URL-a oznacza zwykły tryb lokalnego packa. */
public final class ResourcePack {
    private final Konfig config;

    public ResourcePack(Konfig config) {
        this.config = config;
    }

    public void send(Player player) {
        String url = config.resourcePackUrl();
        if (url == null || url.isBlank()) return;
        try {
            String sha1 = config.resourcePackSha1().replace(" ", "").trim();
            byte[] hash = sha1.matches("[0-9a-fA-F]{40}") ? hexBytes(sha1) : new byte[0];
            Method method = Player.class.getMethod("setResourcePack", String.class, byte[].class, String.class, boolean.class);
            method.invoke(player, url, hash, config.resourcePackPrompt(), config.resourcePackRequired());
        } catch (NoSuchMethodException ignored) {
            try {
                Player.class.getMethod("setResourcePack", String.class).invoke(player, url);
            } catch (Throwable ignoredAgain) {
                // Starsze API nie ma żadnego z overloadów — plugin nadal działa bez promptu.
            }
        } catch (Throwable ignored) {
            // Zły URL/hash nie może wyłączyć całego pluginu.
        }
    }

    private byte[] hexBytes(String hex) {
        byte[] result = new byte[20];
        for (int i = 0; i < result.length; i++) result[i] = (byte) Integer.parseInt(hex.substring(i * 2, i * 2 + 2), 16);
        return result;
    }
}
