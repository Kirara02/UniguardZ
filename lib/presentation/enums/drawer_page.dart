enum DrawerPage {
  home('Home'),
  scan('Scan'),
  alarm('Alarm'),
  forms('Forms'),
  tasks('Tasks'),
  activityLog('Activity Log'),
  history('History'),
  settings('Settings'),
  logout('Logout');

  // Properti untuk menyimpan title
  final String title;

  // Constructor untuk enum
  const DrawerPage(this.title);
}
