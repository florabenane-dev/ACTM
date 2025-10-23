import { Routes } from '@angular/router';

export const routes: Routes = [
  // {
  //   path: 'home',
  //   loadComponent: () => import('./home/home.page').then((m) => m.HomePage),
  // },
  {
    path: '',
    redirectTo: 'playlist',
    pathMatch: 'full',
  },
  {
    path: 'playlist',
    loadComponent: () => import('./view/playlist/playlist.page').then( m => m.PlaylistPage)
  },  {
    path: 'song-details',
    loadComponent: () => import('./view/song-details/song-details.page').then( m => m.SongDetailsPage)
  },

];
