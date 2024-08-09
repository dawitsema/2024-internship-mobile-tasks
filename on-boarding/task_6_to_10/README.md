# Internship Project

This project is a Flutter-based mobile application developed during an internship, focusing on product management. The app allows users to view, search, add, update, and delete products. The key pages in the app are the Home Page, Search Page, Details Page, and Add/Update Page.

## Table of Contents

- [Features](#features)
- [Pages](#pages)
- [Setup and Installation](#setup-and-installation)
- [Usage](#usage)
- [Tasks](#tasks)
  - [Chapter 6: Implementing a Flutter User Interface](#chapter-6-implementing-a-flutter-user-interface)
  - [Chapter 7: Implementing Navigation and Routing in an E-commerce Mobile App](#chapter-7-implementing-navigation-and-routing-in-an-e-commerce-mobile-app)
  - [Chapter 8: Setting Up Linter Rules in Flutter](#chapter-8-setting-up-linter-rules-in-flutter)
  - [Chapter 9: Entities, Use Cases, and Repositories](#chapter-9-entities-use-cases-and-repositories)
  - [Chapter 10: Data Overview Layer](#chapter-10-data-overview-layer)
- [Contributing](#contributing)
- [License](#license)

## Features

- **Product Display**: View a list of available products on the Home Page.
- **Product Details**: View detailed information about a specific product.
- **Product Search**: Search for products using various criteria.
- **Product Management**: Add new products, update existing ones, and delete products.

## Pages

### Home Page

![Home Page](images/Home%20Page.png)

The Home Page displays a list of available products with their images, titles, categories, prices, and ratings.

### Search Page

![Search Page](images/Search%20Page.png)

The Search Page allows users to search for products using keywords or filters.

### Details Page

![Details Page](images/Details%20Page.png)

The Details Page shows detailed information about a selected product, including a description, category, and price.

### Add/Update Page

![Add/Update Page](images/Update%20Page.png)
The Add/Update Page is used by admins to add new products or update existing ones.

## Setup and Installation

1. **Clone the repository:**

   ```bash
   git clone <https://github.com/dawitsema/2024-internship-mobile-tasks/tree/main/on-boarding>

   ```

2. **Navigate to the project directory:**

   ```
   cd <project-directory>

   ```

3. **Install dependencies:**

   ```
   flutter pub get
   ```

4. **Run the app:**

```
flutter run

```

## Usage

- **Viewing Products**: Launch the app to see the list of products on the Home Page.
- **Searching for Products**: Use the Search Page to find products based on specific criteria.
- **Product Details**: Click on a product to view its details on the Details Page.
- **Managing Products**: Admin users can add new products or update existing ones using the Add/Update Page.

## Chapter 6: Implementing a Flutter User Interface

### Objective

Create a Flutter user interface that replicates the design of a provided picture.

### Task

- Implement a user interface in Flutter that replicates the design provided.
- Utilize appropriate Flutter widgets and components to build the UI.
- Pay attention to colors, layout, typography, and specific design elements.

### Implementation

- Recreated the design using Flutter widgets like Container, Column, Row, Image, Text, and Button.
- Used custom images to maintain the creative aspect of the design.

### Summary

Successfully implemented a user interface in Flutter that closely replicates the provided design. This task helped reinforce skills in using Flutter widgets and layout principles.

## Chapter 7: Implementing Navigation and Routing in an E-commerce Mobile App

### Objective

Build a simple e-commerce mobile app using Flutter with seamless navigation and routing.

### Task

- Implement navigation between the Home Screen, Add/Edit Product Screen, and Product Detail Screen.
- Define named routes for each screen and pass data between them.
- Implement smooth navigation animations and handle navigation events appropriately.

### Summary

Implemented navigation and routing features, including named routes, data passing, and smooth animations. The app now provides a seamless user experience when navigating between different screens.

## Chapter 8: Setting Up Linter Rules in Flutter

### Objective

Set up good linter rules in the Flutter project to maintain code quality, readability, and consistency.

### Task

- Added the flutter_lints package and set up linter rules in the analysis_options.yaml file.
- Customized the linter rules according to the project's requirements.
- Ensured the code adhered to the defined rules by running the linter.

### Summary

Configured linter rules to ensure a clean, consistent, and maintainable codebase. The project is now better organized, with code quality maintained through regular linting.

## Chapter 9: Entities, Use Cases, and Repositories

### Objective

Implement CRUD operations for products using Clean Architecture principles and TDD practices.

### Task

- Defined a Product entity with properties like id, name, description, price, and imageUrl.
- Created use cases for inserting, updating, deleting, and retrieving products.
- Implemented a ProductRepository to handle data operations for products.

### Summary

Successfully implemented entities, use cases, and repositories for CRUD operations, following Clean Architecture principles. This ensures a modular and testable codebase for the e-commerce app.

## Chapter 10: Data Overview Layer

### Objective

Organize the project structure according to Clean Architecture principles and implement the data overview layer.

### Task

- Organized the project into core and features directories, following Clean Architecture principles.
- Implemented the ProductModel with JSON conversion logic.
- Updated the project documentation to reflect the new architecture and data flow.

### Summary

Organized the project according to Clean Architecture, implemented the ProductModel, and updated the documentation. The project structure is now clean and maintainable, with clear documentation on architecture and data flow.
