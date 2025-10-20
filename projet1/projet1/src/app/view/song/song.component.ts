import { Component, Input } from '@angular/core';
import { IonCol, IonLabel, IonRow } from '@ionic/angular';
import { IonCheckbox } from '@ionic/angular/standalone';
import { Song } from 'src/app/data/song';

@Component({
  selector: 'app-song',
  templateUrl: './song.component.html',
  styleUrls: ['./song.component.scss'],
  standalone: true,
  imports: [IonRow, IonCol, IonLabel, IonCheckbox]
})
export class SongComponent {
  onlySelectedSongs = false;

  @Input() song!: Song;
}
