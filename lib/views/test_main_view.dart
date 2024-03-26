
import 'package:flutter/material.dart';
import 'package:test_task/utils/app_colors.dart';
import 'package:test_task/widgets/app_text.dart';

class TestMainView extends StatefulWidget {
  const TestMainView({super.key});

  @override
  State<TestMainView> createState() => _TestMainViewState();
}

class _TestMainViewState extends State<TestMainView> {

  int _currentPage = 0;
  ScrollController _titlesTabScrollController = ScrollController();
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: AppColors.white,
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                topContainer(),
                SizedBox(height: 50,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  controller: _titlesTabScrollController,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.45 *3,
                      child: Row(
                        children: [
                          tabs(index: 0, context: context, isActive: _currentPage==0),
                          tabs(index: 1, context: context, isActive: _currentPage==1),
                          tabs(index: 2, context: context, isActive: _currentPage==2),

                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                 height: 1300,
                  width: MediaQuery.of(context).size.width*3,
                  child: PageView(
                    controller: _pageController,
                    onPageChanged:onPageChanged,
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      // Add your pages here
                      slidePages(context, 0),
                      slidePages(context, 1),
                      slidePages(context, 2),

                    ],
                  ),
                )
              ],
            ),
            borders()
          ],
        ),
      ),
    );
  }

  void onPageChanged(int page){
      setState(() {
        _currentPage = page;
        if(page == 0){
          _titlesTabScrollController.jumpTo(0);
        }
        if(page == 1){
          _titlesTabScrollController.jumpTo(_titlesTabScrollController.position.maxScrollExtent/2);
        }
        if(page == 2){
          _titlesTabScrollController.jumpTo(_titlesTabScrollController.position.maxScrollExtent);
        }
      });
  }

  Widget borders()=>Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        height: 60,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: AppColors.lightGrey_718096.withOpacity(0.2), // Shadow color
              offset: Offset(0, 3), // Offset on the y-axis
              blurRadius: 6, // Blur radius
            ),
          ],
        ),
        child: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: AppText("Login",color: AppColors.teal_319795,fontSize: 16,),
          ),
        ),
      ),
      Spacer(),

      Container(
        height: 100,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: AppColors.lightGrey_718096.withOpacity(0.2), // Shadow color
              offset: Offset(0, -3), // Offset on the y-axis
              blurRadius: 6, // Blur radius
            ),
          ],
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(17.0),
            child: Container(
              height: 50,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors:  [
                      AppColors.blue,
                      AppColors.teal_319795, // First color
                      // Second color
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    transform: GradientRotation(95 * 3.14 / 1),),
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Center(child: AppText("Kostenlos Registrieren",color: AppColors.lightCyan_E6FFFA,fontSize: 17,)),
            ),
          ),
        ),
      )
    ],
  );

  Widget tabs({
    required int index,
    required BuildContext context,
    required bool isActive,
  }){
    List titles = ["Arbeitnehmer","Arbeitgeber","Temporärbüro"];
    return GestureDetector(
      onTap: (){
        print("hello");
        _pageController.animateToPage(
          index,
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
        );
      },
      child: AnimatedContainer(
        duration: Duration(microseconds: 1000),
        height: 40,
        width: MediaQuery.of(context).size.width*0.45,
        decoration: BoxDecoration(
          borderRadius: (index == 0)? BorderRadius.only(topLeft: Radius.circular(12),bottomLeft: Radius.circular(12))
              :index == 1 ? null:
              BorderRadius.only(topRight: Radius.circular(12),bottomRight: Radius.circular(12)),

              border: !isActive? Border.all(color: AppColors.light_CBD5E0):null,
          color: isActive? AppColors.cyan_81E6D9 : null
        ),
        child: Center(child: AppText(titles[index],color: isActive?AppColors.white : AppColors.cyan_81E6D9,),),
      ),
    );
  }


  Widget topContainer()=> Container(
      decoration:const BoxDecoration(
        gradient:  LinearGradient(
          colors: [
            AppColors.light_EBF4FF, // First color
            AppColors.lightCyan_E6FFFA, // Second color
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          transform: GradientRotation(141 * 3.14 / 180),),
      ),
      height: 660,
      width: double.maxFinite,
      child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(),
          AppText("Deine Job \nwebsite",fontSize: 42,fontWeight: FontWeight.w500,textAlign: TextAlign.center,),
          // Spacer(),
          Transform.scale(
              scale: 1.25,
              child: Image.asset("assets/undraw_agreement_aajr@2x.png",fit: BoxFit.fitWidth,)),
        ],
      )
  );

  Widget slidePages(BuildContext context,int index){
  List descriptions = ["Drei einfache Schritte zu deinem neuen Job","Drei einfache Schritte zu deinem neuen Mitarbeiter","Drei einfache Schritte zur Vermittlung neuer Mitarbeiter"];
  return SizedBox(
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 30),
          child: SizedBox(child: AppText(descriptions[index], fontSize: 21, textAlign: TextAlign.center, fontWeight: FontWeight.w500, )),
        ),
        SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Image.asset("assets/slide${index+1}.png", scale: 0.7, )),
      ],
    ),
  );
}

  // Widget page1(){
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 30.0,),
  //     child: Column(
  //       children: [
  //         SizedBox(
  //           height: 420,
  //           child: Column(
  //             children: [
  //               SizedBox(height: 40,),
  //               Align(
  //                 alignment: Alignment.topRight,
  //                 child: SizedBox(
  //
  //                     height: 178,
  //                     child: Image.asset("assets/undraw_Profile_data_re_v81r@2x.png")),
  //               ),
  //               SizedBox(
  //                 height: 200,
  //                 child: Row(
  //                   crossAxisAlignment: CrossAxisAlignment.end,
  //                   children: [
  //                     AppText("1.",fontSize: 40,color: AppColors.lightGrey_718096,fontWeight: FontWeight.w500,),
  //                     AppText("Erstellen dein\nUnternehmensprofil",fontSize: 20,color: AppColors.lightGrey_718096,fontWeight: FontWeight.w500,)
  //
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

}
