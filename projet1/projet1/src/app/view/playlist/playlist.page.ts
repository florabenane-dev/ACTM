import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { IonContent, IonHeader, IonTitle, IonToolbar, IonGrid, IonRow  } from '@ionic/angular/standalone';
import { SongComponent } from '../song/song.component';
import { SongRepository } from 'src/app/repository/song-repository';
import { Song } from 'src/app/data/song';

@Component({
  selector: 'app-playlist',
  templateUrl: './playlist.page.html',
  styleUrls: ['./playlist.page.scss'],
  standalone: true,
  imports: [IonContent, IonHeader, IonTitle, IonToolbar, CommonModule, FormsModule, IonGrid, IonRow, SongComponent]
})
export class PlaylistPage {

  get songs(): Song[] {
    return this.songRepository.songs;
  }

  constructor(private songRepository: SongRepository) {}
  
}
