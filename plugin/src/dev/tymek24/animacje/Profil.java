package dev.tymek24.animacje;

/** Ustawienia jednego gracza; obiekt jest kopiowany przy odczycie z magazynu. */
public final class Profil {
    public boolean nickWlaczony = true;
    public String nick = "";
    public String fx = "rainbow";

    public Profil kopia() {
        Profil p = new Profil();
        p.nickWlaczony = nickWlaczony;
        p.nick = nick;
        p.fx = fx;
        return p;
    }
}
