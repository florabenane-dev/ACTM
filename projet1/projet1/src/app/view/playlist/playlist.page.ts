import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { IonContent, IonHeader, IonTitle, IonToolbar, IonLabel, IonGrid, IonItem, IonRow, IonRadio, IonCol, IonRadioGroup, IonButton } from '@ionic/angular/standalone';
import { SongComponent } from '../song/song.component';
import { SongRepository } from 'src/app/repository/song-repository';
import { Song } from 'src/app/data/song';
import { Router } from '@angular/router';
import { TimeUtils } from 'src/app/utils/time-utils';

@Component({
  selector: 'app-playlist',
  templateUrl: './playlist.page.html',
  styleUrls: ['./playlist.page.scss'],
  standalone: true,
  imports: [
    IonContent, 
    IonHeader, 
    IonTitle, 
    IonToolbar, 
    CommonModule, 
    FormsModule, 
    IonGrid, 
    IonRow, 
    IonItem, 
    IonLabel, 
    IonRadioGroup, 
    IonRadio, 
    IonCol, 
    IonButton, 
    SongComponent
  ]
})
export class PlaylistPage {

  get songs(): Song[] {
    return this.songRepository.songs;
  }

  constructor(
    private songRepository: SongRepository, 
    private router: Router
  ) {}

  //getter
  get selectedSongs(): Song[] {
    return this.songs.filter(song => song.selected);
  }

  //
  mustSelectSong(): boolean{
    return this.selectedSongs.length == 0;
  }
  
  //button send to music app
  onGoToSummary() {
    this.router.navigate(['/playlist-summary'], {
      state: {songs: this.selectedSongs}
    });
    console.log('[GO] ', this.selectedSongs);
  }

  totalDuration(): string {
    return TimeUtils.formatDuration(this.selectedSongs
      .reduce((sum, song) => sum + song.duration, 0))
  }

  //ajout des filtres
  keywordFilter: 'title' | 'artist' | 'duration' | null = null;

  onSortBy() {
    if (!this.keywordFilter) return;

    const sortedSongs = [...this.songs]; //copie

    if (this.keywordFilter === 'duration') {
      this.songs.sort((a, b) => a.duration - b.duration);

    } else { //artist ou titre car alphabet
      const key = this.keywordFilter as 'title' | 'artist';
      this.songs.sort((a, b) => (a[key]).localeCompare((b[key]))
      ); 
    }

    this.songRepository.songs = sortedSongs; //remplacer
  }
}
