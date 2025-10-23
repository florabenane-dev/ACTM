import { ComponentFixture, TestBed } from '@angular/core/testing';
import { PlaylistSummaryPage } from './playlist-summary.page';

describe('PlaylistSummaryPage', () => {
  let component: PlaylistSummaryPage;
  let fixture: ComponentFixture<PlaylistSummaryPage>;

  beforeEach(() => {
    fixture = TestBed.createComponent(PlaylistSummaryPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
