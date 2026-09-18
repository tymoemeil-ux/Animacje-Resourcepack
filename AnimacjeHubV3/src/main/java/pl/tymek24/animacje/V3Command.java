package pl.tymek24.animacje;

import java.util.*; import org.bukkit.command.*; import org.bukkit.entity.Player;
/** Nowy router komend V3; następne moduły nie będą mieszać logiki GUI z komendami. */
public final class V3Command implements CommandExecutor, TabCompleter {
 private final V3Service s; public V3Command(V3Service s){this.s=s;}
 public boolean onCommand(CommandSender x, Command c, String l, String[] a){
  if(!(x instanceof Player p)){x.sendMessage("§cTa komenda jest dostępna w grze.");return true;}
  if(a.length==0){x.sendMessage("§dAnimacjeHub V3 §7— /anim nick, /anim title, /anim item, /anim troll");return true;}
  switch(a[0].toLowerCase(Locale.ROOT)){
   case "nick" -> { boolean on=a.length<2||!a[1].equalsIgnoreCase("off"); s.ustawNick(p,on); p.sendMessage("§dAnimowany nick: "+(on?"§awłączony":"§cwyłączony")); }
   case "title" -> p.sendMessage("§dV3: tytuł animowany będzie wysłany przez katalog FX.");
   case "item" -> p.sendMessage("§dV3: trzymany przedmiot zostanie nazwany przez katalog FX.");
   case "troll" -> { if(!s.mozeTroll(p)){p.sendMessage("§cOdczekaj chwilę.");break;} s.cooldown(p,5000); p.sendActionBar("§5AnimacjeHub V3 §7— troll aktywowany"); }
   default -> p.sendMessage("§cNieznana opcja. Użyj: nick, title, item, troll.");
  } return true;
 }
 public List<String> onTabComplete(CommandSender s, Command c, String l, String[] a){return a.length==1?List.of("nick","title","item","troll","gui","help"):List.of();}
}
