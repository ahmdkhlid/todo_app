//@dart=2.9
abstract class AllAppStates {}

class AppInitialStates extends AllAppStates {}

class AppChangeBottomNavBarState extends AllAppStates {}

class AppChangeBottomNavSheetState extends AllAppStates {}

class AppCreateDatabaseLoadingState extends AllAppStates {}

class AppCreateDatabaseState extends AllAppStates {}

class AppGetDatabaseState extends AllAppStates {}

class AppInsertDatabaseState extends AllAppStates {}

class AppUpdateDatabaseState extends AllAppStates {}

class AppDeleteDatabaseState extends AllAppStates {}

class AllAppChangeThemeMode extends AllAppStates {}
