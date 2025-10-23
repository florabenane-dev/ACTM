import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { IonContent, IonHeader, IonTitle, IonToolbar } from '@ionic/angular/standalone';

@Component({
  selector: 'app-playlist-summary',
  templateUrl: './playlist-summary.page.html',
  styleUrls: ['./playlist-summary.page.scss'],
  standalone: true,
  imports: [IonContent, IonHeader, IonTitle, IonToolbar, CommonModule, FormsModule]
})
export class PlaylistSummaryPage implements OnInit {

  constructor() { }

  ngOnInit() {
  }

}
