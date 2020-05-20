import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:onboarding/app/modules/home/onboard_page_view_widget.dart';
import 'package:onboarding/app/modules/home/styles.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  final _totalPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.4, 0.7, 0.9],
              colors: [
                Color(0xFF3594DD),
                Color(0xFF4563DB),
                Color(0xFF5036D5),
                Color(0xFF5B16D0),
              ],
            ),
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                      onPressed: () => print("Hello World"),
                      child: Text('Skip',
                          style:
                              TextStyle(color: Colors.white, fontSize: 20.0))),
                ),
                Container(
                  height: 600.0,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      OnBoardPageViewWidget(
                        title: 'Connect people\naround the world',
                        description:
                            'Donec facilisis tortor ut augue lacinia, at viverra est semper. Sed sapien metus, scelerisque pharetra.',
                        image: Image(
                          image: AssetImage('assets/images/onboarding0.png'),
                          height: 300.0,
                          width: 300.0,
                        ),
                      ),
                      OnBoardPageViewWidget(
                        title: 'Live your lite smarter with us!',
                        description:
                            'Sapien metus, scelerisque nec and pharetra id, tempor a tortor. Pellentesque non dignissim neque.',
                        image: Image(
                          image: AssetImage('assets/images/onboarding1.png'),
                          height: 300.0,
                          width: 300.0,
                        ),
                      ),
                      OnBoardPageViewWidget(
                        title: 'Get a new experience of imagination',
                        description:
                            'Donec facilisis tortor ut augue lacinia, at viverra est semper.',
                        image: Image(
                          image: AssetImage('assets/images/onboarding2.png'),
                          height: 300.0,
                          width: 300.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                _currentPage != _totalPages - 1
                    ? Expanded(
                        child: Align(
                          alignment: FractionalOffset.bottomRight,
                          child: FlatButton(
                            onPressed: () {
                              _pageController.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  'Next',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22.0,
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 30.0,
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == _totalPages - 1
          ? Container(
              height: 100.0,
              width: double.infinity,
              color: Colors.white,
              child: GestureDetector(
                onTap: () => print('Get started'),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 30.0),
                    child: Text(
                      'Get started',
                      style: TextStyle(
                          color: Color(0xFF5B16D0),
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            )
          : Text(''),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _totalPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }

    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
          color: isActive ? Colors.white : Color(0xFF7B51D3),
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }
}
