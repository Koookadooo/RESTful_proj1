# Businesses

## Add a Business
Request: POST /businesses
Request body:
{
  "name" (string, required): "Business Name",
  "streetAddress" (string, required): "1234 Main St",
  "city" (string, required): "Anytown",
  "state" (string, required): "Anystate",
  "zipCode" (string, required): "12345",
  "phoneNumber" (string, required): "123-456-7890",
  "category" (string, required): "Restaurant",
  "subcategory" (string, required): "Pizza",
  "website" (string, optional): "http://example.com",
  "email" (string, optional): "contact@example.com"
}
Response body:
{
  "id" (string): 12345,
  "message" (string): "Business added successfully."
}

## Update a Business
Request: PUT /businesses/{businessId}
Request body:
{
  "name" (string, optional): "Updated Business Name",
  "phoneNumber" (string, optional): "321-654-0987",
  // Other fields that can be updated...
}
Response body:
{
  "message" (string): "Business updated successfully."
}

## Remove a Business
Request: DELETE /businesses/{businessId}
Request body: –
Response body:
{
  "message" (string): "Business removed successfully."
}

## List All Businesses
Request: GET /businesses
Request body: –
Response body:
[
  {
    "id" (string): 12345,
    "name" (string): "Business Name",
    "address" (string): "1234 Main St, Anytown, Anystate, 12345",
    // Other business details...
  },
  // More businesses...
]


# Reviews

## Write a Review
Request: PUT /businesses/{businessId}/reviews
Request body:
{
  "starRating" (string, optional): 4,
  "dollarSignRating" (string, optionl): 2,
  "writtenReview" (string, optional): "Great experience!"
}
Response body:
{
  "reviewID" (string): "1234"
  "message" (string): "Review added successfully."
}

## Modify a Review
Request: PUT /reviews/{reviewId}
Request body:
{
  "starRating" (string, optional): 5,
  // Other fields that can be updated...
}
Response body:
{
  "message" (string): "Review updated successfully."
}

## Delete a Review
Request: DELETE /reviews/{reviewId}
Request body: –
Response body:
{
  "message" (string): "Review deleted successfully."
}


# Photos

## Upload a Photo
Request: POST /business/{businessId}/photos
Request body:
{
  "caption" (string, optional): "Front view of the restaurant",
  // File would be uploaded through multipart/form-data
}
Response body:
{
  "photoID" (string): "67890" 
  "message" (string): "Photo uploaded successfully."
}

## Remove a Photo
Request: DELETE /photos/{photoId}
Request body: –
Response body:
{
  "message" (string): "Photo removed successfully."
}

## Modify a Photo Caption
Request: PUT /photos/{photoId}
Request body:
{
  "caption" (string, optional): "Updated caption"
}
Response body:
{
  "message": "Caption updated successfully."
}


# Users

# List Businesses Owned by User
Request: GET /users/{userId}/businesses
Request body: –
Response body:
[
  {
    "id" (string): 12345,
    "name" (string): "Business Name",
    // Other business details...
  },
  // More businesses...
]

# List Photos Uploaded by User
Request: GET /users/{userId}/photos
Request body: –
Response body:
[
  {
    "photoId" (string): "67890",
    "caption" (string): "Front view of the restaurant",
    // Other photo details...
  },
  // More photos...
]

# List Reviews Uploaded by User
Request: GET /users/{userID}/reviews
Request body: -
Response body:
[
  {
    "starRating" (string, optional): 4,
    "dollarSignRating" (string, optionl): 2,
    "writtenReview" (string, optional): "Great experience!"
  },
  // More reviews...
]
