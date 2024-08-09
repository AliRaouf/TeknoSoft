import 'package:dartz/dartz.dart';
import 'package:track_me_updated/core/failures.dart';
import 'package:track_me_updated/features/recipes/data/models/recipe_model/recipe_model.dart';

abstract class RecipeRepo {
  Future<Either<Failures, List<RecipeModel>>> getRecipes();
  Future<Either<Failures, List<RecipeModel>>> getSimilarRecipes();
  Future<Either<Failures, List<RecipeModel>>> getRandomRecipes();
}
