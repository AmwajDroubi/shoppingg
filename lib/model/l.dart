class ListCat {
  final String id;
  final String name;

  ListCat({required this.id, required this.name});
}

List<ListCat> listcategory = [
  ListCat(
    id: '1',
    name: 'All ',
  ),
  ListCat(
    id: '2',
    name: 'Latest ',
  ),
  ListCat(
    id: '3',
    name: 'MostPopular',
  ),
  ListCat(
    id: '4',
    name: 'Cheapest',
  ),
];
