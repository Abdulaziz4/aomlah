import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/ui/shared/busy_overlay.dart';
import 'package:aomlah/ui/shared/custom_button.dart';
import 'package:aomlah/ui/views/auth/verify_account_promotion/verify_account_promotion_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

class VerifyAccountPromotionView extends StatelessWidget {
  const VerifyAccountPromotionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VerifyAccountViewModel>.reactive(
        viewModelBuilder: () => VerifyAccountViewModel(),
        builder: (context, viewmodel, _) {
          return BusyOverlay(
            isBusy: viewmodel.isBusy,
            child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: true,
                elevation: 0,
              ),
              body: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'توثيق الحساب',
                          style: Constants.veryLargeText.copyWith(
                            color: Constants.darkBlue,
                            fontSize: 28,
                          ),
                        ),
                        SvgPicture.asset(
                          "assets/icons/verification-symbol-svgrepo-com 1.svg",
                          height: 40,
                          width: 50,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Image.asset('assets/icons/Security-rafiki 1.png'),
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          "لحماية مستخمين عملة الرجاء إكمال عملية التحقق من الهوية عن طريق النفاذ الوطني الموحد لتتمكن من إستخدام كافة مميزات عملة",
                          style: Constants.mediumText.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w200,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    CustomButton(
                      text: "توثيق حسابي",
                      color: Constants.primaryColor,
                      height: 40,
                      width: 200,
                      onPressed: viewmodel.tryVerifyUser,
                    ),
                    SizedBox(height: 20),
                    TextButton(
                      onPressed: viewmodel.navigateToHome,
                      child: Text(
                        "وثق حسابي لاحقاً",
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
