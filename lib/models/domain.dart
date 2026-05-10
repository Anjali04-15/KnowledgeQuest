import 'topic.dart';

enum DomainType { ai, cybersecurity, aptitude }

class Domain {
  final String id;
  final DomainType type;
  final String name;
  final String description;
  final String icon;
  final List<Topic> topics; // 5 topics each

  const Domain({
    required this.id,
    required this.type,
    required this.name,
    required this.description,
    required this.icon,
    required this.topics,
  });
}
