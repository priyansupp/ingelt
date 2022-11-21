import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ingelt/business_logic/blocs/group_bloc.dart';
import 'package:ingelt/business_logic/blocs/profile_bloc.dart';
import 'package:ingelt/business_logic/blocs/user_data_bloc.dart';
import 'package:ingelt/business_logic/blocs/user_grpdata_bloc.dart';
import 'package:ingelt/business_logic/utility/app_bloc_observer.dart';
import 'package:ingelt/data/repositories/group_repo.dart';
import 'package:ingelt/data/repositories/profile_repo.dart';
import 'package:ingelt/data/repositories/user_data_repo.dart';
import 'package:ingelt/data/repositories/user_grpdata_repo.dart';
import 'package:ingelt/screens/authentication/google_signin.dart';
import 'package:ingelt/shared/utils.dart';
import 'package:ingelt/wrapper.dart';
import 'package:provider/provider.dart';



Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => ProfileRepository()),
        RepositoryProvider(create: (context) => UserDataRepository()),
        RepositoryProvider(create: (context) => UserGrpDataRepository()),
        RepositoryProvider(create: (context) => GroupRepository()),

      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ProfileBloc>(create: (BuildContext context) => ProfileBloc(profileRepository: RepositoryProvider.of<ProfileRepository>(context))),
          BlocProvider<UserDataBloc>(create: (BuildContext context) => UserDataBloc(userDataRepository: RepositoryProvider.of<UserDataRepository>(context))),
          BlocProvider<UserGrpDataBloc>(create: (BuildContext context) => UserGrpDataBloc(userGrpDataRepository: RepositoryProvider.of<UserGrpDataRepository>(context))),
          BlocProvider<GroupBloc>(create: (BuildContext context) => GroupBloc(groupRepository: RepositoryProvider.of<GroupRepository>(context))),
        ],
        child: ChangeNotifierProvider(
            create: (context) => GoogleSignInProvider(),
            child: MaterialApp(
              scaffoldMessengerKey: Utils.messengerKey,
              debugShowCheckedModeBanner: false,
              title: 'Ingelt App',
              theme: ThemeData(
                // This is the theme of your application.
                //
                // Try running your application with "flutter run". You'll see the
                // application has a blue toolbar. Then, without quitting the app, try
                // changing the primarySwatch below to Colors.green and then invoke
                // "hot reload" (press "r" in the console where you ran "flutter run",
                // or simply save your changes to "hot reload" in a Flutter IDE).
                // Notice that the counter didn't reset back to zero; the application
                // is not restarted.
              ),
              home: const Wrapper(),
            ),
          ),
      ),
    );
  }
}