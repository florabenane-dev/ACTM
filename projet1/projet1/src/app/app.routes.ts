import { Routes } from '@angular/router';

export const routes: Routes = [
  {
    path: '',
    redirectTo: 'playlist',
    pathMatch: 'full',
  },
  {
    path: 'playlist',
    loadComponent: () => import('./view/playlist/playlist.page').then( m => m.PlaylistPage)
  },
  {
    path: 'song-details/:id',
    loadComponent: () => import('./view/song-details/song-details.page').then( m => m.SongDetailsPage)
  },
  {
    path: 'playlist-summary',
    loadComponent: () => import('./view/playlist-summary/playlist-summary.page').then( m => m.PlaylistSummaryPage)
  },

];
