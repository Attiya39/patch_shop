# Online Shop App

# App Description
A Flutter-based application that allows users to view products based on selected categories 
and can sort products by price (ascending and descending order). 
Users can reset the list to its original state by interacting with the sorting buttons.

## Features
- Fetch and display categories data from a fake API.
- Fetch and display product data from a fake API.
- Sort products by:
    - Lowest price first (ascending order).
    - Highest price first (descending order).
- Toggle sorting: Clicking the same button again resets the list to the original order.
- Smooth and responsive UI with button highlighting.

## Screenshots
- All Products : assets/images/screenshots/all_products.png
- Sorted Ascending : assets/images/screenshots/asc_sorted.png
- Sorted Descending : assets/images/screenshots/desc_sorted.png
- Products realted to Category : assets/images/screenshots/category_products.png

## Tech Stack
- **Flutter** for front-end development.
- **GetX** for state management.
- **FakeStoreAPI** for fetching product data.

## How to Use
- Tap **"Category"** to fetch and view products related to the selected category.
- Tap **"Lowest price first"** to sort products by ascending price.
- Tap **"Highest price first"** to sort products by descending price.
- Tap the **same button again** to reset the product list to its original order.

## Known Issues / Assumptions
- The original product list is stored locally to reset the list when needed.
- Sorting operations are done locally for improved performance.
- Assumes a stable API response structure.

## Future Improvements
- Add more sorting options (e.g., sort by name or category).
- Implement persistent state using a local database.
- Improve UI with animations.

## Contact
- **Developer:** Attiya Sheikh
- **Email:** attiyasheikh39@gmail.com
- **GitHub:** https://github.com/Attiya39


