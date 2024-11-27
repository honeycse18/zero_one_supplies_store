extension DurationToHumanReadableTime on Duration {
  int get toHumanReadableSeconds =>
      inSeconds.remainder(Duration.secondsPerMinute);

  int get toHumanReadableMinutes =>
      inMinutes.remainder(Duration.minutesPerHour);

  int get toHumanReadableHours => inHours.remainder(Duration.hoursPerDay);
}
