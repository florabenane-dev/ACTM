import { TestBed } from '@angular/core/testing';

import { SongRepositoryImpl } from './song-repository-impl';

describe('SongRepositoryImpl', () => {
  let service: SongRepositoryImpl;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(SongRepositoryImpl);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
