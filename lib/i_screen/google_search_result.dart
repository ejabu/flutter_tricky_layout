import 'package:flutter/material.dart';

class GoogleSearchResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Search Result'),
      ),
      body: Container(
        child: CustomScrollView(
          slivers: <Widget>[
            headerContent(context),
            pageView(context),

            headerContent(context),
            headerContent(context),
            pageView(context),
            
            headerContent(context),
            pageView(context),
          ],
        ),
      ),
    );
  }

  Widget pageView(BuildContext context) {
    final section = SliverList(
      delegate: SliverChildListDelegate(
        [
          SizedBox(
            height: 100,
            child: PageView(
              children: <Widget>[
                AddTextInput(),
                AddNoteSettings(),
              ],
            ),
          ),
        ],
      ),
    );
    return section;
  }

  Widget headerContent(BuildContext context) {
    final section = SliverList(
      delegate: SliverChildListDelegate(
        [
          NewsFeed(),
        ],
      ),
    );
    return section;
  }
}

class NewsFeed extends StatelessWidget {
  final String content;

  NewsFeed([this.content]);

  @override
  Widget build(BuildContext context) {
    var displayText = content ?? "Header";
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white30,
          border: Border.all(
            color: Colors.black26,
            width: 1.0,
          ),
        ),
        child: Center(
          child: Text("$displayText"),
        ),
      ),
    );
  }
}

class AddTextInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NewsFeed("AddTextInput");
  }
}

class AddNoteSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NewsFeed("AddNoteSettings");
  }
}
