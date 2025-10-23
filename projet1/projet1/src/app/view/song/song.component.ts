import { CommonModule } from '@angular/common';
import { Component, inject, Input } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { IonCheckbox, IonCol, IonLabel, IonRow  } from '@ionic/angular/standalone';
import { Song } from 'src/app/data/song';
import { TimeUtils } from 'src/app/utils/time-utils';
import { Router, RouterLink } from '@angular/router';

@Component({
  selector: 'app-song',
  templateUrl: './song.component.html',
  styleUrls: ['./song.component.scss'],
  standalone: true,
  imports: [IonRow, IonCol, IonLabel, IonCheckbox, CommonModule, FormsModule]
})
export class SongComponent {

  @Input() song!: Song;

  private router = inject(Router);

  formatTime(duration: number) {
    return TimeUtils.formatDuration(duration);
  }

  goToDetails(songId: number) {
    this.router.navigate(['song-details', songId]);
  }
}
