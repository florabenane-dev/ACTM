import { Injectable } from '@angular/core';
import { SongRepository } from './song-repository';
import { Song } from '../data/song';

@Injectable({
  providedIn: 'root'
})

export class SongRepositoryImpl extends SongRepository{
  public songs: Song[] = 
  [
    {id: 0 , title: "Wish you were here" , artist: "Pink Floyd" , album: "" , duration: 5.30 , cover: "../../assets/album/1.jpeg"},
    {id: 1 , title: "Gimme shelter" , artist: "Rolling Stones" , album: "Let It Bleed" , duration: 4.31 , cover: "../../assets/album/LetitbleedRS.jpg"},
    {id: 2 , title: "Come Together" , artist: "The Beatles" , album: "" , duration: 4.19 , cover: "../../assets/album/2.jpg"},
    {id: 3 , title: "Have you ever seen the rain" , artist: "CCR" , album: "" , duration: 2.38 , cover: "../../assets/album/3.png"},
    {id: 4 , title: "Shape of My Heart" , artist: "Sting" , album: "" , duration: 4.39 , cover: "../../assets/album/4.jpg"},
    {id: 5 , title: "Cornflake Girl" , artist: "Tori Amos" , album: "" , duration: 5.05 , cover: "../../assets/album/5.jpg"},
    {id: 6 , title: "Master Blaster" , artist: "Stevie Wonder" , album: "" , duration: 4.49 , cover: "../../assets/album/1.jpeg"},
    {id: 7 , title: "So Sorry" , artist: "Feist" , album: "" , duration: 3.12 , cover: "../../assets/album/2.jpg"}
  ]

  public override getSong(id: number): Song | undefined {
    return this.songs.find(song => song.id === id) as Song; 
  }
}
