class Book {
  String title;
  String author;
  String ISBN;
  String details;
  double price;
  String bookImg;

  Book(
      {required this.title,
      required this.author,
      required this.ISBN,
      required this.details,
      required this.price,
      required this.bookImg});
}

final List<Book> bookList = [
  Book(
    title: 'Flutter for Beginners',
    author: 'John Doe',
    ISBN: '978-1-23456-789-0',
    details: 'A comprehensive guide to learning Flutter for app development.',
    price: 29.99,
    bookImg: 'https://picsum.photos/id/1011/200/300',
  ),
  Book(
    title: 'Mastering Dart',
    author: 'Jane Smith',
    ISBN: '978-0-98765-432-1',
    details: 'An in-depth look at Dart programming for professionals.',
    price: 35.50,
    bookImg: 'https://picsum.photos/id/1012/200/300',
  ),
  Book(
    title: 'The Art of Mobile UI',
    author: 'Michael Brown',
    ISBN: '978-1-56789-123-4',
    details: 'Learn how to create stunning user interfaces for mobile apps.',
    price: 40.00,
    bookImg: 'https://picsum.photos/id/1013/200/300',
  ),
  Book(
    title: 'Advanced Flutter Techniques',
    author: 'Sarah Lee',
    ISBN: '978-0-24680-135-7',
    details: 'Take your Flutter development skills to the next level.',
    price: 45.75,
    bookImg: 'https://picsum.photos/id/1014/200/300',
  ),
  Book(
    title: 'Design Patterns in Dart',
    author: 'David Kim',
    ISBN: '978-0-45678-910-1',
    details: 'Explore design patterns for efficient Dart programming.',
    price: 38.99,
    bookImg: 'https://picsum.photos/id/1015/200/300',
  ),
  Book(
    title: 'Full-Stack Flutter',
    author: 'Emily White',
    ISBN: '978-1-76543-210-9',
    details: 'Build full-stack applications using Flutter and Firebase.',
    price: 42.00,
    bookImg: 'https://picsum.photos/id/1016/200/300',
  ),
  Book(
    title: 'Introduction to Programming',
    author: 'Alex Johnson',
    ISBN: '978-1-11111-222-3',
    details: 'Perfect for beginners learning to code.',
    price: 20.50,
    bookImg: 'https://picsum.photos/id/1018/200/300',
  ),
  Book(
    title: 'Data Structures with Dart',
    author: 'Chris Martin',
    ISBN: '978-2-98765-678-4',
    details: 'Learn data structures and algorithms using Dart.',
    price: 32.00,
    bookImg: 'https://picsum.photos/id/1018/200/300',
  ),
  Book(
    title: 'Mobile Security Essentials',
    author: 'Laura Davis',
    ISBN: '978-0-54321-987-6',
    details: 'Secure your mobile applications with best practices.',
    price: 39.99,
    bookImg: 'https://picsum.photos/id/1019/200/300',
  ),
  Book(
    title: 'Responsive Design Principles',
    author: 'Tom Wilson',
    ISBN: '978-3-45678-890-7',
    details: 'Implement responsive designs for various screen sizes.',
    price: 27.00,
    bookImg: 'https://picsum.photos/id/1020/200/300',
  ),
  Book(
    title: 'Effective Team Management',
    author: 'Sophia Lopez',
    ISBN: '978-0-11223-344-5',
    details: 'Tips and strategies for managing development teams effectively.',
    price: 25.00,
    bookImg: 'https://picsum.photos/id/1021/200/300',
  ),
  Book(
    title: 'Clean Code Practices',
    author: 'Joshua Reed',
    ISBN: '978-0-99887-654-3',
    details: 'Write clean and maintainable code with these best practices.',
    price: 29.95,
    bookImg: 'https://picsum.photos/id/1022/200/300',
  ),
  Book(
    title: 'Practical Flutter Projects',
    author: 'Hannah Green',
    ISBN: '978-0-56789-012-8',
    details: 'Hands-on projects to enhance your Flutter development skills.',
    price: 36.50,
    bookImg: 'https://picsum.photos/id/1023/200/300',
  ),
  Book(
    title: 'Cross-Platform Development',
    author: 'Oliver Wright',
    ISBN: '978-3-65432-123-0',
    details: 'Build cross-platform apps using modern tools and techniques.',
    price: 31.75,
    bookImg: 'https://picsum.photos/id/1024/200/300',
  ),
  Book(
    title: 'Introduction to Algorithms',
    author: 'Emma Carter',
    ISBN: '978-1-44444-555-6',
    details: 'Learn algorithms from scratch with this beginner-friendly book.',
    price: 30.00,
    bookImg: 'https://picsum.photos/id/1025/200/300',
  ),
];
