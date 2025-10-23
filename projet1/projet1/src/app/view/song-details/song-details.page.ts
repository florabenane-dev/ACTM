import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { IonBackButton, IonButtons, IonContent, IonGrid, IonHeader, IonItem, IonLabel, IonRow, IonTitle, IonToolbar } from '@ionic/angular/standalone';
import { Song } from 'src/app/data/song';
import { SongRepository } from 'src/app/repository/song-repository';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-song-details',
  templateUrl: './song-details.page.html',
  styleUrls: ['./song-details.page.scss'],
  standalone: true,
  imports: [
    IonContent,
    IonTitle,
    IonHeader,
    IonToolbar,
    CommonModule,
    FormsModule,
    IonGrid,
    IonRow,
    IonItem,
    IonLabel,  
    IonButtons,
    IonBackButton
  ]
})
export class SongDetailsPage implements OnInit {

  song: Song|undefined = undefined;

  constructor(
    private songRepository: SongRepository,
    private route: ActivatedRoute
  ) { }


  ngOnInit() { //ajouter des tests pour le if mais apres, ça marche...
    const idString = this.route.snapshot.paramMap.get('id');
    if (idString != null) {
      const id = Number(idString); //conversion en number,
      this.song = this.songRepository.getSong(id);
    }
  }

}
