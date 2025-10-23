export class TimeUtils {
    public static formatDuration(duration: number): string {
        const minute = Math.floor(duration);
        const secondes = Math.round((duration - minute) * 60);

        return `${minute}:${secondes.toString().padStart(2 , '0')}`
    }
}
