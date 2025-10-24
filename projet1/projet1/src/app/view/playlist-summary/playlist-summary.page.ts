import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { IonBackButton, IonButton, IonContent, IonHeader, IonImg, IonItem, IonLabel, IonList, IonTitle, IonToolbar } from '@ionic/angular/standalone';
import { SongRepository } from 'src/app/repository/song-repository';
import { Router } from '@angular/router';
import { Song } from 'src/app/data/song';

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
    IonLabel
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

  onSharePlaylist() {

  }

}
