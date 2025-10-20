import { SongRepository } from './song-repository';

describe('SongRepository', () => {
  it('should create an instance', () => {
    expect(new SongRepository()).toBeTruthy();
  });
});
