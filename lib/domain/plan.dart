class Plan {
  int id;
  String content;
  DateTime startTime;
  DateTime endTime;
  double achievementRate;

  Plan(this.id, this.content, this.startTime, this.endTime,
      this.achievementRate);

  bool doesPlanCollideWith(Plan anotherPlan) {
    final doesAbut = startTime == anotherPlan.endTime
        || endTime == anotherPlan.startTime;
    final priorThisCollision = startTime.isBefore(anotherPlan.startTime)
        && endTime.isAfter(anotherPlan.startTime) && endTime.isBefore(anotherPlan.endTime);
    final laterThisCollision = startTime.isAfter(anotherPlan.startTime)
        && startTime.isBefore(anotherPlan.endTime) &&  endTime.isAfter(anotherPlan.endTime);

    return doesAbut || priorThisCollision || laterThisCollision;
  }
}
