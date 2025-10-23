import { Song } from "../data/song";

//specifications api
export abstract class SongRepository {
    public abstract songs: Song[];
    public abstract getSong(id: number): Song|undefined;
}
