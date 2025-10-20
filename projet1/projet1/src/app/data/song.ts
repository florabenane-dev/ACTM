export interface Song {
    id: symbol; //a verifier si possible qu'il le donne unique => Symbol ?
    title: string;
    artist: string;
    album: string;
    duration: number; //duree donc equivalent time ?
    cover: string; //image
}
