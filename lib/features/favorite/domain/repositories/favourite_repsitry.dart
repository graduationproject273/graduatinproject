abstract class FavouriteRepository {
  Future<void> addToFavourite(String id);
  Future<void> removeFromFavourite(String id);
  Future<bool> isFavourite(String id);
  Future<List<String>> getAllFavourites();
}