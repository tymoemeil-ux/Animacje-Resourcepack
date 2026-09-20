package dev.tymek24.animacje;

import org.bukkit.entity.Player;

/** Wysyłanie animowanych title/subtitle bez mieszania tego z logiką komend. */
public final class Tytuly {
    private final Konfig config;

    public Tytuly(Konfig config) {
        this.config = config;
    }

    public void wyslij(Player target, Katalog.Fx fx, String title, String subtitle) {
        wyslij(target, fx, null, title, subtitle);
    }

    public void wyslij(Player target, Katalog.Fx fx, String color, String title, String subtitle) {
        if (target == null) return;
        String main = color == null || color.isBlank()
                ? Tekst.animowany(fx, Narzedzia.ogranicz(title, 80))
                : Tekst.custom(fx, color, Narzedzia.ogranicz(title, 80));
        String sub = "";
        if (subtitle != null && !subtitle.isBlank()) {
            sub = color == null || color.isBlank()
                    ? Tekst.animowany(fx, Narzedzia.ogranicz(subtitle, 100))
                    : Tekst.custom(fx, color, Narzedzia.ogranicz(subtitle, 100));
        }
        target.sendTitle(main, sub, config.titleFadeIn(), config.titleStay(), config.titleFadeOut());
    }
}
