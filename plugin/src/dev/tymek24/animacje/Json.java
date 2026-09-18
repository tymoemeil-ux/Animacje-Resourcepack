package dev.tymek24.animacje;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/** Mini parser JSON — wystarczy na fx_katalog.json (tablice obiektow). */
final class Json {

    private final String s;
    private int i;

    private Json(String s) { this.s = s; this.i = 0; }

    static List<Object> tablica(String tekst) {
        Json j = new Json(tekst);
        j.pominij();
        return (List<Object>) j.park();
    }

    @SuppressWarnings("unchecked")
    static Map<String, Object> obiekt(String tekst) {
        Json j = new Json(tekst);
        j.pominij();
        return (Map<String, Object>) j.park();
    }

    private Object park() {
        pominij();
        if (i >= s.length()) return null;
        char c = s.charAt(i);
        if (c == '[') return parkTablica();
        if (c == '{') return parkObiekt();
        if (c == '"' || c == '\'') return parkString();
        if (c == 't' || c == 'f') return parkBool();
        if (c == 'n') return parkNull();
        return parkLiczba();
    }

    private List<Object> parkTablica() {
        List<Object> w = new ArrayList<>();
        i++; pominij();
        if (i < s.length() && s.charAt(i) == ']') { i++; return w; }
        while (i < s.length()) {
            w.add(park());
            pominij();
            if (i >= s.length()) break;
            char c = s.charAt(i);
            if (c == ',') { i++; }
            else if (c == ']') { i++; break; }
            else break;
        }
        return w;
    }

    private Map<String, Object> parkObiekt() {
        Map<String, Object> w = new LinkedHashMap<>();
        i++; pominij();
        if (i < s.length() && s.charAt(i) == '}') { i++; return w; }
        while (i < s.length()) {
            pominij();
            String klucz = parkString();
            pominij();
            if (i >= s.length() || s.charAt(i) != ':') break;
            i++;
            w.put(klucz, park());
            pominij();
            if (i >= s.length()) break;
            char c = s.charAt(i);
            if (c == ',') { i++; }
            else if (c == '}') { i++; break; }
            else break;
        }
        return w;
    }

    private String parkString() {
        char cyt = s.charAt(i);
        StringBuilder b = new StringBuilder();
        i++;
        while (i < s.length()) {
            char c = s.charAt(i);
            if (c == '\\' && i + 1 < s.length()) {
                char e = s.charAt(i + 1);
                switch (e) {
                    case 'n': b.append('\n'); break;
                    case 't': b.append('\t'); break;
                    case 'r': b.append('\r'); break;
                    case '"': b.append('"'); break;
                    case '\'': b.append('\''); break;
                    case '\\': b.append('\\'); break;
                    case '/': b.append('/'); break;
                    case 'u':
                        if (i + 5 < s.length()) {
                            b.append((char) Integer.parseInt(s.substring(i + 2, i + 6), 16));
                            i += 4;
                        }
                        break;
                    default: b.append(e);
                }
                i += 2;
                continue;
            }
            if (c == cyt) { i++; return b.toString(); }
            b.append(c);
            i++;
        }
        return b.toString();
    }

    private Object parkLiczba() {
        int start = i;
        while (i < s.length() && "+-0123456789.eE".indexOf(s.charAt(i)) >= 0) i++;
        String t = s.substring(start, i);
        if (t.contains(".") || t.contains("e") || t.contains("E")) {
            return (Object) Double.parseDouble(t);
        }
        return (Object) Long.parseLong(t);
    }

    private Object parkBool() {
        if (s.charAt(i) == 't') { i += 4; return Boolean.TRUE; }
        i += 5;
        return Boolean.FALSE;
    }

    private Object parkNull() {
        i += 4;
        return null;
    }

    private void pominij() {
        while (i < s.length() && Character.isWhitespace(s.charAt(i))) i++;
    }
}
