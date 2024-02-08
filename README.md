# local_database

## Introduce

The local database implemented in the provided Dart code is a simplified key-value store designed
for local data storage. It consists of three main classes: `LocalDatabase`, `LCR` (Local Collection
Reference), and `LDR` (Local Document Reference).

### 1. LocalDatabase:

    - Represents the entire local database.
    - Utilizes a base map (`base`) to store data.
    - Provides methods for CRUD operations within the database.

### 2. LCR (Local Collection Reference):

    - Represents a collection within the database.
    - Offers methods to interact with documents within the collection.
    - Supports operations such as adding, setting, updating, deleting documents, and obtaining all documents in the collection.

### 3. LDR (Local Document Reference):

    - Represents a document within the database.
    - Provides methods for CRUD operations specific to a document.
    - Supports setting, updating, deleting, and retrieving data from the document.
    - Allows referencing subcollections within the document.

## Example:

```dart
void main() {
  final database = LocalDatabase();

  // Create new post (posts/post_id)
  database.collection("posts").document("post_id").set({
    "id": "post_id",
    "title": "My First Blog Post",
    "content": "This is my first ever blog post...",
    "author_id": "1",
    "category": "Technology",
    "tags": ["programming", "javascript"],
    "created_at": "2024-02-06T00:00:00Z",
    "updated_at": "2024-02-06T00:00:00Z",
    "published": true,
  });

  // Update post by id (posts/post_id)
  database.collection("posts").document("post_id").update({
    "title": "Updated Blog Post",
    "content": "This post has been updated!",
  });

  // Delete post by id (posts/post_id)
  database.collection("posts").document("post_id").delete();
  
  // Retrieve post by id (posts/post_id)
  database.collection("posts").document("post_id").get();
  
  // Retrieve all post (posts)
  database.collection("posts").get();
  
  // Create new post comment (posts/post_id/comments/comment_id)
  database.collection("posts").document("post_id").collection("comments").document("comment_id").set({
    "id": "comment_id",
    "post_id": "post_id",
    "content": "Great post!",
    "author_id": "2",
    "created_at": "2024-02-06T00:00:00Z",
    "likes": [],
    "dislikes": [],
  });

  // Update post comment by id (posts/post_id/comments/comment_id)
  database.collection("posts").document("post_id").collection("comments").document("comment_id").update({
    "content": "This is updated comment!",
  });

  // Delete post comment by id (posts/post_id/comments/comment_id)
  database.collection("posts").document("post_id").collection("comments").document("comment_id").delete();

  // Retrieve post comment by id (posts/post_id/comments/comment_id)
  database.collection("posts").document("post_id").collection("comments").document("comment_id").get();

  // Retrieve all post comments (posts/post_id/comments)
  database.collection("posts").document("post_id").collection("comments").get();
  
}
```
