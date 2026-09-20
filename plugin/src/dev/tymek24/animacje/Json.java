package dev.tymek24.animacje;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/** Mały parser JSON używany tylko do wbudowanego, prostego katalogu FX. */
final class Json {
    private final String text;
    private int index;

    private Json(String text) { this.text = text; }

    static List<Object> tablica(String text) {
        Json json = new Json(text);
        Object value = json.value();
        return value instanceof List ? (List<Object>) value : List.of();
    }

    private Object value() {
        skip();
        if (index >= text.length()) return null;
        char c = text.charAt(index);
        if (c == '[') return array();
        if (c == '{') return object();
        if (c == '"') return string();
        if (c == 't' || c == 'f') return bool();
        if (c == 'n') { index += 4; return null; }
        return number();
    }

    private List<Object> array() {
        List<Object> result = new ArrayList<>();
        index++;
        skip();
        while (index < text.length() && text.charAt(index) != ']') {
            result.add(value());
            skip();
            if (index < text.length() && text.charAt(index) == ',') index++;
            skip();
        }
        if (index < text.length()) index++;
        return result;
    }

    private Map<String, Object> object() {
        Map<String, Object> result = new LinkedHashMap<>();
        index++;
        skip();
        while (index < text.length() && text.charAt(index) != '}') {
            String key = string();
            skip();
            if (index < text.length() && text.charAt(index) == ':') index++;
            result.put(key, value());
            skip();
            if (index < text.length() && text.charAt(index) == ',') index++;
            skip();
        }
        if (index < text.length()) index++;
        return result;
    }

    private String string() {
        if (index < text.length() && text.charAt(index) == '"') index++;
        StringBuilder result = new StringBuilder();
        while (index < text.length()) {
            char c = text.charAt(index++);
            if (c == '"') break;
            if (c == '\\' && index < text.length()) {
                char escaped = text.charAt(index++);
                switch (escaped) {
                    case 'n' -> result.append('\n');
                    case 'r' -> result.append('\r');
                    case 't' -> result.append('\t');
                    case 'b' -> result.append('\b');
                    case 'f' -> result.append('\f');
                    case 'u' -> {
                        if (index + 4 <= text.length()) {
                            result.append((char) Integer.parseInt(text.substring(index, index + 4), 16));
                            index += 4;
                        }
                    }
                    default -> result.append(escaped);
                }
            } else result.append(c);
        }
        return result.toString();
    }

    private Object number() {
        int start = index;
        while (index < text.length() && "-+0123456789.eE".indexOf(text.charAt(index)) >= 0) index++;
        String number = text.substring(start, index);
        return number.contains(".") || number.contains("e") || number.contains("E")
                ? Double.parseDouble(number) : Long.parseLong(number);
    }

    private Boolean bool() {
        boolean trueValue = text.charAt(index) == 't';
        index += trueValue ? 4 : 5;
        return trueValue;
    }

    private void skip() {
        while (index < text.length() && Character.isWhitespace(text.charAt(index))) index++;
    }
}
