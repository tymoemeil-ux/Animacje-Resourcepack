package net.luckperms.api;
public interface LuckPerms {
    <T> net.luckperms.api.player.PlayerAdapter<T> getPlayerAdapter(java.lang.Class<T> clazz);
}
