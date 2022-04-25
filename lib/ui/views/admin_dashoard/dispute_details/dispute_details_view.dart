import 'package:aomlah/core/enums/dispute_status.dart';
import 'package:aomlah/core/models/chat_message.dart';
import 'package:aomlah/core/models/dispute.dart';
import 'package:aomlah/ui/shared/busy_overlay.dart';
import 'package:aomlah/ui/views/admin_dashoard/dispute_details/components/dispute_section.dart';
import 'package:aomlah/ui/views/admin_dashoard/dispute_details/viewmodels/dispute_details_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/app/utils/constants.dart';
import '../../../shared/custom_button.dart';

class DisputeDetailsView extends StatefulWidget {
  final Dispute dispute;
  const DisputeDetailsView({Key? key, required this.dispute}) : super(key: key);

  @override
  _DisputeDetailsViewState createState() => _DisputeDetailsViewState();
}

class _DisputeDetailsViewState extends State<DisputeDetailsView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DisputeDetailsViewModel>.reactive(
      viewModelBuilder: () => DisputeDetailsViewModel(widget.dispute),
      onModelReady: (model) => model.fetchChatMessages(),
      builder: (context, viewmodel, child) => BusyOverlay(
        isBusy: viewmodel.isBusy,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              title: Text("تفاصيل النزاع"),
            ),
            bottomNavigationBar:
                viewmodel.dispute.status == DisputeStatus.waiting
                    ? buildBottomButtom(viewmodel.resolveDispute)
                    : SizedBox(),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: double.infinity),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DisputeSection(
                        title: "رقم التداول",
                        content: Text(
                          viewmodel.dispute.tradeId.substring(0, 7),
                          style: Constants.smallText,
                        ),
                      ),
                      DisputeSection(
                        title: "اسم المنازع (${viewmodel.getInitiatorRole()})",
                        content: Text(
                          viewmodel.getInitiatorName(),
                          style: Constants.smallText,
                        ),
                      ),
                      DisputeSection(
                        title:
                            "البريد لصاحب النزاع (${viewmodel.getInitiatorRole()})",
                        content: Text(
                          viewmodel.getInitiatorEmail(),
                          style: Constants.smallText,
                        ),
                      ),
                      DisputeSection(
                        content: Text(
                          viewmodel.getOthersideName(),
                          style: Constants.smallText,
                        ),
                        title: "تنازع ضد (${viewmodel.getOthersideRole()})",
                      ),
                      DisputeSection(
                        content: Text(
                          viewmodel.getOthersideEmail(),
                          style: Constants.smallText,
                        ),
                        title:
                            "البريد للمتنازع ضده (${viewmodel.getOthersideRole()})",
                      ),
                      DisputeSection(
                        title: "نوع التداول",
                        content: Text(
                          viewmodel.dispute.trade!.offer!.isBuy
                              ? "شراء BTC"
                              : "بيع BTC",
                          style: Constants.smallText,
                        ),
                      ),
                      DisputeSection(
                        title: "الكمية المتنازع عليها",
                        content: Text(
                          viewmodel.dispute.trade!.amount.toStringAsFixed(4) +
                              " BTC",
                          style: Constants.smallText,
                        ),
                      ),
                      DisputeSection(
                        title: "المحادثات",
                        content: viewmodel.chatMessages.isEmpty
                            ? Text("لايوجد محادثات")
                            : Column(
                                children: viewmodel.chatMessages
                                    .map(
                                      (e) => buildMessage(e, widget.dispute),
                                    )
                                    .toList(),
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildMessage(ChatMessage message, Dispute dispute) {
    String name = message.senderId == dispute.trade!.tradeId
        ? dispute.trade!.traderName!
        : dispute.trade!.offer!.ownerName!;

    return Text(
      "$name: ${message.content}",
      style: Constants.smallText,
    );
  }

  BottomAppBar buildBottomButtom(void Function() onResolve) {
    return BottomAppBar(
      color: Constants.black2dp,
      child: Container(
        height: 84,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Constants.black2dp,
        ),
        child: CustomButton(
          onPressed: onResolve,
          text: 'إغلاق النزاع',
          color: Color(0xFF7BB9FA),
          height: 45,
        ),
      ),
    );
  }
}
