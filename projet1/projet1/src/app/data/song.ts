export interface Song {
    id: number; //a verifier si possible qu'il le donne unique => Symbol ? non car faux data
    title: string;
    artist: string;
    album: string;
    duration: number; //duree donc equivalent time ?
    cover: string; //image
    selected?: boolean;
}
