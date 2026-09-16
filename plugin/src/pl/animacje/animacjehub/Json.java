package pl.animacje.animacjehub;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public final class Json {
    private final String s;
    private int i;

    private Json(String s) { this.s = s; }

    public static Object parse(String text) {
        Json j = new Json(text);
        j.ws();
        Object v = j.wartosc();
        j.ws();
        return v;
    }

    @SuppressWarnings("unchecked")
    public static Map<String, Object> obiekt(String text) {
        return (Map<String, Object>) parse(text);
    }

    @SuppressWarnings("unchecked")
    public static List<Object> tablica(String text) {
        return (List<Object>) parse(text);
    }

    private Object wartosc() {
        ws();
        if (i >= s.length()) throw new IllegalArgumentException("koniec");
        char c = s.charAt(i);
        if (c == '{') return obiekt();
        if (c == '[') return tablica();
        if (c == '"') return sciana();
        return liczbAlboSlowo();
    }

    private Map<String, Object> obiekt() {
        Map<String, Object> m = new LinkedHashMap<String, Object>();
        i++;
        ws();
        if (i < s.length() && s.charAt(i) == '}') { i++; return m; }
        while (true) {
            ws();
            String k = sciana();
            ws();
            if (s.charAt(i) != ':') throw new IllegalArgumentException("oczekiwano : " + i);
            i++;
            ws();
            m.put(k, wartosc());
            ws();
            char c = s.charAt(i++);
            if (c == '}') break;
            if (c != ',') throw new IllegalArgumentException("oczekiwano , } " + i);
        }
        return m;
    }

    private List<Object> tablica() {
        List<Object> l = new ArrayList<Object>();
        i++;
        ws();
        if (i < s.length() && s.charAt(i) == ']') { i++; return l; }
        while (true) {
            l.add(wartosc());
            ws();
            char c = s.charAt(i++);
            if (c == ']') break;
            if (c != ',') throw new IllegalArgumentException("oczekiwano , ] " + i);
        }
        return l;
    }

    private String sciana() {
        if (s.charAt(i) != '"') throw new IllegalArgumentException("oczekiwano \" " + i);
        i++;
        StringBuilder b = new StringBuilder();
        while (true) {
            char c = s.charAt(i++);
            if (c == '"') break;
            if (c == '\\') {
                char e = s.charAt(i++);
                if (e == 'n') b.append('\n');
                else if (e == 't') b.append('\t');
                else if (e == 'r') b.append('\r');
                else b.append(e);
            } else {
                b.append(c);
            }
        }
        return b.toString();
    }

    private Object liczbAlboSlowo() {
        int start = i;
        while (i < s.length() && ",}] \t".indexOf(s.charAt(i)) < 0) i++;
        String t = s.substring(start, i);
        if (t.equals("true")) return Boolean.TRUE;
        if (t.equals("false")) return Boolean.FALSE;
        if (t.equals("null")) return null;
        try {
            if (t.indexOf('.') >= 0 || t.indexOf('e') >= 0 || t.indexOf('E') >= 0) return Double.valueOf(t);
            return Long.valueOf(t);
        } catch (NumberFormatException e) {
            throw new IllegalArgumentException("nieznana wartosc: " + t);
        }
    }

    private void ws() {
        while (i < s.length() && Character.isWhitespace(s.charAt(i))) i++;
    }

    public static String tekst(String w) {
        StringBuilder b = new StringBuilder("\"");
        for (int k = 0; k < w.length(); k++) {
            char c = w.charAt(k);
            if (c == '"' || c == '\\') b.append('\\').append(c);
            else if (c == '\n') b.append("\\n");
            else if (c == '\t') b.append("\\t");
            else if (c < 32) b.append(String.format("\\u%04x", (int) c));
            else b.append(c);
        }
        return b.append('"').toString();
    }
}
