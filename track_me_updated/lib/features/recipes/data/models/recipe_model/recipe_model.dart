import 'package:equatable/equatable.dart';

import 'analyzed_instruction.dart';
import 'nutrition.dart';

class RecipeModel extends Equatable {
  final bool? vegetarian;
  final bool? vegan;
  final bool? glutenFree;
  final bool? dairyFree;
  final bool? veryHealthy;
  final bool? cheap;
  final bool? veryPopular;
  final bool? sustainable;
  final bool? lowFodmap;
  final int? weightWatcherSmartPoints;
  final String? gaps;
  final dynamic preparationMinutes;
  final dynamic cookingMinutes;
  final int? aggregateLikes;
  final int? healthScore;
  final String? creditsText;
  final String? sourceName;
  final double? pricePerServing;
  final int? id;
  final String? title;
  final int? readyInMinutes;
  final int? servings;
  final String? sourceUrl;
  final String? image;
  final String? imageType;
  final Nutrition? nutrition;
  final String? summary;
  final List<String>? cuisines;
  final List<String>? dishTypes;
  final List<dynamic>? diets;
  final List<dynamic>? occasions;
  final List<AnalyzedInstruction>? analyzedInstructions;
  final double? spoonacularScore;
  final String? spoonacularSourceUrl;

  const RecipeModel({
    this.vegetarian,
    this.vegan,
    this.glutenFree,
    this.dairyFree,
    this.veryHealthy,
    this.cheap,
    this.veryPopular,
    this.sustainable,
    this.lowFodmap,
    this.weightWatcherSmartPoints,
    this.gaps,
    this.preparationMinutes,
    this.cookingMinutes,
    this.aggregateLikes,
    this.healthScore,
    this.creditsText,
    this.sourceName,
    this.pricePerServing,
    this.id,
    this.title,
    this.readyInMinutes,
    this.servings,
    this.sourceUrl,
    this.image,
    this.imageType,
    this.nutrition,
    this.summary,
    this.cuisines,
    this.dishTypes,
    this.diets,
    this.occasions,
    this.analyzedInstructions,
    this.spoonacularScore,
    this.spoonacularSourceUrl,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) => RecipeModel(
        vegetarian: json['vegetarian'] as bool?,
        vegan: json['vegan'] as bool?,
        glutenFree: json['glutenFree'] as bool?,
        dairyFree: json['dairyFree'] as bool?,
        veryHealthy: json['veryHealthy'] as bool?,
        cheap: json['cheap'] as bool?,
        veryPopular: json['veryPopular'] as bool?,
        sustainable: json['sustainable'] as bool?,
        lowFodmap: json['lowFodmap'] as bool?,
        weightWatcherSmartPoints: json['weightWatcherSmartPoints'] as int?,
        gaps: json['gaps'] as String?,
        preparationMinutes: json['preparationMinutes'] as dynamic,
        cookingMinutes: json['cookingMinutes'] as dynamic,
        aggregateLikes: json['aggregateLikes'] as int?,
        healthScore: json['healthScore'] as int?,
        creditsText: json['creditsText'] as String?,
        sourceName: json['sourceName'] as String?,
        pricePerServing: (json['pricePerServing'] as num?)?.toDouble(),
        id: json['id'] as int?,
        title: json['title'] as String?,
        readyInMinutes: json['readyInMinutes'] as int?,
        servings: json['servings'] as int?,
        sourceUrl: json['sourceUrl'] as String?,
        image: json['image'] as String?,
        imageType: json['imageType'] as String?,
        nutrition: json['nutrition'] == null
            ? null
            : Nutrition.fromJson(json['nutrition'] as Map<String, dynamic>),
        summary: json['summary'] as String?,
        cuisines: json['cuisines'] as List<String>?,
        dishTypes: json['dishTypes'] as List<String>?,
        diets: json['diets'] as List<dynamic>?,
        occasions: json['occasions'] as List<dynamic>?,
        analyzedInstructions: (json['analyzedInstructions'] as List<dynamic>?)
            ?.map(
                (e) => AnalyzedInstruction.fromJson(e as Map<String, dynamic>))
            .toList(),
        spoonacularScore: (json['spoonacularScore'] as num?)?.toDouble(),
        spoonacularSourceUrl: json['spoonacularSourceUrl'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'vegetarian': vegetarian,
        'vegan': vegan,
        'glutenFree': glutenFree,
        'dairyFree': dairyFree,
        'veryHealthy': veryHealthy,
        'cheap': cheap,
        'veryPopular': veryPopular,
        'sustainable': sustainable,
        'lowFodmap': lowFodmap,
        'weightWatcherSmartPoints': weightWatcherSmartPoints,
        'gaps': gaps,
        'preparationMinutes': preparationMinutes,
        'cookingMinutes': cookingMinutes,
        'aggregateLikes': aggregateLikes,
        'healthScore': healthScore,
        'creditsText': creditsText,
        'sourceName': sourceName,
        'pricePerServing': pricePerServing,
        'id': id,
        'title': title,
        'readyInMinutes': readyInMinutes,
        'servings': servings,
        'sourceUrl': sourceUrl,
        'image': image,
        'imageType': imageType,
        'nutrition': nutrition?.toJson(),
        'summary': summary,
        'cuisines': cuisines,
        'dishTypes': dishTypes,
        'diets': diets,
        'occasions': occasions,
        'analyzedInstructions':
            analyzedInstructions?.map((e) => e.toJson()).toList(),
        'spoonacularScore': spoonacularScore,
        'spoonacularSourceUrl': spoonacularSourceUrl,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      vegetarian,
      vegan,
      glutenFree,
      dairyFree,
      veryHealthy,
      cheap,
      veryPopular,
      sustainable,
      lowFodmap,
      weightWatcherSmartPoints,
      gaps,
      preparationMinutes,
      cookingMinutes,
      aggregateLikes,
      healthScore,
      creditsText,
      sourceName,
      pricePerServing,
      id,
      title,
      readyInMinutes,
      servings,
      sourceUrl,
      image,
      imageType,
      nutrition,
      summary,
      cuisines,
      dishTypes,
      diets,
      occasions,
      analyzedInstructions,
      spoonacularScore,
      spoonacularSourceUrl,
    ];
  }
}
