import 'package:foot_app/repositories/repositories.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> repositoryProviders = [
  Provider<LoginRepository>(create: (_) => LoginRepository()),
];
