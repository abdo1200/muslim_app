import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:muslim_app/sqldb.dart';
import 'package:share_plus/share_plus.dart';

class Setting extends StatelessWidget {
  Setting({Key? key}) : super(key: key);
  final TextEditingController feed = TextEditingController();

  SqlDb sqlDb = SqlDb();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: height,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/pattern.png',
                ),
                repeat: ImageRepeat.repeat,
                opacity: .1),
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [
                Colors.green,
                Colors.blue,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                      iconSize: 25),
                ],
              ),
              SizedBox(
                height: height * .2,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(Icons.language),
                    Text('لغة التطبيق',
                        style: TextStyle(fontSize: 25, fontFamily: 'Arabic')),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Share.share(
                      'https://drive.google.com/file/d/182Gm9CQrU-5PZlsejASupgrG23rBQlTq/view');
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(Icons.share),
                      Text('مشاركة التطبيق',
                          style: TextStyle(fontSize: 25, fontFamily: 'Arabic')),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 14, 72, 121),
                    borderRadius: BorderRadius.circular(20)),
                child: Text('تواصل معنا',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Arabic',
                      color: Colors.white,
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: TextFormField(
                  textDirection: TextDirection.rtl,
                  decoration: InputDecoration(
                    hintTextDirection: TextDirection.rtl,
                    contentPadding: EdgeInsets.all(15),
                    hintStyle: TextStyle(fontSize: 25, fontFamily: 'Arabic'),
                    hintText: "أدخل تعليقك",
                    border: InputBorder.none,
                  ),
                  controller: feed,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () async {
                      if (feed.text.isEmpty) {
                        var snackBar = SnackBar(
                          elevation: 0,
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                          content: AwesomeSnackbarContent(
                            title: 'FeedBack',
                            message: 'Please enter some text !',
                            contentType: ContentType.failure,
                          ),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else {
                        int response = await sqlDb
                            .insertData('Contact', {'note': feed.text});
                        var snackBar = SnackBar(
                          elevation: 0,
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                          content: AwesomeSnackbarContent(
                            title: 'FeedBack',
                            message: 'Sended Successfully !',
                            contentType: ContentType.success,
                          ),
                        );
                        feed.text = '';
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 14, 72, 121),
                          borderRadius: BorderRadius.circular(20)),
                      child: Text('إرسال',
                          style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'Arabic',
                            color: Colors.white,
                          )),
                    ),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
