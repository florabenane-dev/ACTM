import { Component, Input } from '@angular/core';
import { IonCol, IonLabel, IonRow } from '@ionic/angular';
import { Song } from 'src/app/data/song';

@Component({
  selector: 'app-song',
  templateUrl: './song.component.html',
  styleUrls: ['./song.component.scss'],
  standalone: true,
  imports: [IonRow, IonCol, IonLabel]
})
export class SongComponent {
  @Input() song!: Song;
}
