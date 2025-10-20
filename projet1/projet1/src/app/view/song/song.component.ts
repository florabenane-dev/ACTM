import { CommonModule } from '@angular/common';
import { Component, Input } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { IonCheckbox, IonCol, IonLabel, IonRow  } from '@ionic/angular/standalone';
import { Song } from 'src/app/data/song';

@Component({
  selector: 'app-song',
  templateUrl: './song.component.html',
  styleUrls: ['./song.component.scss'],
  standalone: true,
  imports: [IonRow, IonCol, IonLabel, IonCheckbox, CommonModule, FormsModule]
})
export class SongComponent {
  onlySelectedSongs = false;

  @Input() song!: Song;
}
