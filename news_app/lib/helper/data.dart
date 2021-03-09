import 'package:flutter/foundation.dart';
import 'package:news_app/models/category_model.dart';

List<CategoryModel>getCategories(){
  List<CategoryModel> category = new List<CategoryModel>();
  CategoryModel categoryModel ;
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Business";
  categoryModel.imageUrl="https://image.freepik.com/free-vector/vision-scope-document-abstract-concept-illustration_335657-3812.jpg";
  category.add(categoryModel);

  //CategoryModel categoryModel = new CategoryModel();
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Entertainment";
  categoryModel.imageUrl="https://image.freepik.com/free-vector/characters-people-holding-multimedia-icons-illustration_53876-32615.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Sports";
  categoryModel.imageUrl="https://image.freepik.com/free-vector/seamless-sports-pattern-background_98292-4294.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

categoryModel.categoryName = "General";
  categoryModel.imageUrl="https://image.freepik.com/free-vector/self-education-flat-concept_151150-2148.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Health";
  categoryModel.imageUrl="https://image.freepik.com/free-vector/group-medical-staff-carrying-health-related-icons_53876-43071.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Technology";
  categoryModel.imageUrl = "https://image.freepik.com/free-vector/data-extraction-concept-illustration_114360-4876.jpg";
  category.add(categoryModel);

  return category;




}