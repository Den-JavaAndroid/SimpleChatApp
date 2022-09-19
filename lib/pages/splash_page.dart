import 'package:flutter/material.dart';
import 'package:simple_chat/pages/register_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../utils/constants.dart';
import 'chat_page.dart';

/// Page to redirect users to the appropriate page depending on the initial auth state
class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends SupabaseAuthState<SplashPage> {
  @override
  void initState() {
    super.initState();
    recoverSupabaseSession();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: preloader);
  }

  @override
  void onAuthenticated(Session session) {
    Navigator.of(context).pushAndRemoveUntil(ChatPage.route(), (_) => false);
  }

  @override
  void onUnauthenticated() {
    Navigator.of(context)
        .pushAndRemoveUntil(RegisterPage.route(), (_) => false);
  }

  @override
  void onErrorAuthenticating(String message) {}

  @override
  void onPasswordRecovery(Session session) {}
}