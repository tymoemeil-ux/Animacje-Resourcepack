package net.luckperms.api.player;
import net.luckperms.api.CachedData;
public interface PlayerAdapter<T> {
    CachedData getCachedData(T player);
}
