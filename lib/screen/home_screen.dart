import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/post_provider.dart';
import '../widget/post_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<PostProvider>(context, listen: false).fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("📜 Trending Posts", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.purple.shade300,
        centerTitle: true, elevation: 5,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh, color: Colors.white),
            onPressed: () => postProvider.fetchPosts(),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await postProvider.fetchPosts();
        },
        child: postProvider.isLoading
            ? Center(child: CircularProgressIndicator(color: Colors.deepPurple))
            : postProvider.errorMessage != null
            ? Center(
          child: Text(
            postProvider.errorMessage!,
            style: TextStyle(color: Colors.red, fontSize: 16),
          ),
        )
            : ListView.builder(
          padding: EdgeInsets.all(12),
          itemCount: postProvider.posts.length,
          itemBuilder: (context, index) {
            return PostCard(post: postProvider.posts[index], index: index);
          },
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
