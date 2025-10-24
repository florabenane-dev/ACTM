import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { IonBackButton, IonButton, IonButtons, IonContent, IonHeader, IonImg, IonItem, IonLabel, IonList, IonTitle, IonToolbar } from '@ionic/angular/standalone';
import { SongRepository } from 'src/app/repository/song-repository';
import { Router } from '@angular/router';
import { Song } from 'src/app/data/song';
import { Share } from '@capacitor/share';

@Component({
  selector: 'app-playlist-summary',
  templateUrl: './playlist-summary.page.html',
  styleUrls: ['./playlist-summary.page.scss'],
  standalone: true,
  imports: [
    IonContent, 
    IonHeader, 
    IonTitle, 
    IonToolbar, 
    CommonModule, 
    FormsModule,
    IonList,
    IonButton,
    IonBackButton,
    IonImg,
    IonItem,
    IonLabel,
    IonButtons
  ]
})
export class PlaylistSummaryPage implements OnInit {

  songs: Song[] = [];

  constructor(
    private songRespository: SongRepository,
    private router: Router
  ) { }

  ngOnInit() { 
    const state = history.state;
    this.songs = state?.songs || [];

    console.log('[STATE] ', this.songs);
  }

  async onSharePlaylist() {
    if(this.songs.length === 0) {
      alert('Aucune music à partager')
      return;
    } 

    const playlistText = this.songs
    .map(song => song.title)
    .join('\n');

    const message = `\n\n${playlistText}`;
    
    try {
      if (navigator.share) { //sur un navigateur, pour tester car pas android studio
        await navigator.share({
          title: 'Sharing Text',
          text: message
        });
      }

      else { //sur un tel
        await Share.share({
          title: 'Sharing Text',
          text: message,
          dialogTitle: 'Playlist'
        });

        //affichage desktop
        await navigator.clipboard.writeText(message);
        alert('text copie dans le presse-papier');
      }

    } catch (error) {
      console.error('Erreur de partage :', error);
      alert('Impossible de partager la playlist');
    }

  }

}
