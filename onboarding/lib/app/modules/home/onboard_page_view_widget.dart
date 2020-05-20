import 'package:flutter/material.dart';
import 'package:onboarding/app/modules/home/styles.dart';

class OnBoardPageViewWidget extends StatelessWidget {
  final String _title;
  final Widget _image;
  final String _description;

  const OnBoardPageViewWidget({
    Key key,
    @required String title,
    @required String description,
    @required Widget image,
  })  : this._title = title,
        this._image = image,
        this._description = description,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(_title, style: kTitleStyle),
          SizedBox(height: 15.0),
          Center(child: _image),
          SizedBox(height: 15.0),
          Text(_description, style: kSubtitleStyle),
        ],
      ),
    );
  }
}
