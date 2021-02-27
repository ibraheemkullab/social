part of 'signPage.dart';

Row buildSocialMediaRow() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        height: 37,
        width: 37,
        child: OutlineButton(
          shape: CircleBorder(),
          borderSide: BorderSide(color: Color(0xFF507cc0)),
          color: Color(0xFF507cc0),
          textColor: Color(0xFF507cc0),
          highlightedBorderColor: Color(0xFF507cc0),
          padding: EdgeInsets.zero,
          onPressed: () {},
          child: Icon(
            FlutterIcons.facebook_faw,
            size: 22,
          ),
        ),
      ),
      SizedBox(
        width: 13,
      ),
      Container(
        height: 37,
        width: 37,
        child: OutlineButton(
          shape: CircleBorder(),
          borderSide: BorderSide(color: Color(0xFFdf4931)),
          color: Color(0xFFdf4931),
          textColor: Color(0xFFdf4931),
          highlightedBorderColor: Color(0xFFdf4931),
          onPressed: () {},
          child: Icon(FlutterIcons.google_faw, size: 22),
          padding: EdgeInsets.zero,
        ),
      ),
      SizedBox(
        width: 13,
      ),
      Container(
        height: 37,
        width: 37,
        child: OutlineButton(
          shape: CircleBorder(),
          borderSide: BorderSide(color: Color(0xFF64ccf2)),
          color: Color(0xFF64ccf2),
          textColor: Color(0xFF64ccf2),
          highlightedBorderColor: Color(0xFF64ccf2),
          onPressed: () {},
          child: Icon(FlutterIcons.twitter_ant, size: 22),
          padding: EdgeInsets.zero,
        ),
      ),
    ],
  );
}
