//@dart=2.9
abstract class AppStates {}

class AppInitialStates extends AppStates {}

class AppChangeBottomNavBarState extends AppStates {}

class AppChangeBottomNavSheetState extends AppStates {}

class AppCreateDatabaseLoadingState extends AppStates {}

class AppCreateDatabaseState extends AppStates {}

class AppGetDatabaseState extends AppStates {}

class AppInsertDatabaseState extends AppStates {}

class AppUpdateDatabaseState extends AppStates {}

class AppDeleteDatabaseState extends AppStates {}
