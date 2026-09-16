package pl.animacje.animacjehub;

public final class Prompt {
    public interface Akcja {
        void wykonaj(String wartosc);
    }

    private final Akcja akcja;

    public Prompt(Akcja akcja) {
        this.akcja = akcja;
    }

    public void dzialaj(String wartosc) {
        akcja.wykonaj(wartosc);
    }
}
