import 'package:design/binding/login_binding.dart';
import 'package:design/binding/quiz_binding.dart';
import 'package:design/binding/register_binding.dart';
import 'package:design/view/exiting.dart';
import 'package:design/view/home.dart';
import 'package:design/view/quiz.dart';
import 'package:design/view/quiz2.dart';
import 'package:design/view/quiz_finished.dart';
import 'package:design/view/register.dart';
import 'package:design/view/login.dart';
import 'package:get/get.dart';

import '../view/initial.dart';
import '../view/skor_tablosu.dart';

appRoutes() => [
      GetPage(
        name: '/login',
        page: () => SignInView(),
        binding: LoginBinding(),
      ),
      GetPage(
        name: '/register',
        page: () => RegisterView(),
        binding: RegisterBinding(),
        transition: Transition.rightToLeftWithFade,
      ),
      GetPage(
        name: '/quizview',
        page: () => const QuizView(),
        transition: Transition.fadeIn,
        binding: QuizBinding(),
      ),
      GetPage(
        name: '/home',
        page: () => const HomeView(),
        transition: Transition.fadeIn,
      ),
      GetPage(
        name: '/exiting',
        page: () => const Exiting(),
        transition: Transition.fadeIn,
      ),
      GetPage(
        name: '/quizFinished',
        page: () => const QuizFinished(),
        transition: Transition.fadeIn,
      ),
      GetPage(
        name: '/initial',
        page: () => const Initial(),
        transition: Transition.fadeIn,
      ),
      GetPage(
        name: '/skorTablosu',
        page: () => const SkorTablosu(),
        transition: Transition.fadeIn,
      ),
      GetPage(
        name: '/quizview2',
        page: () => const QuizView2(),
        transition: Transition.fadeIn,
        binding: QuizBinding(),
      ),
    ];
