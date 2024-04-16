#!/bin/sh

status() {
    printf "\n=====================================================\n"
    printf "%s\n" "$1"
    printf -- "-----------------------------------------------------\n"
}

# Test POST /businesses (Add a Business)
status 'POST /businesses should succeed with complete and correct data'
curl -X POST http://localhost:3000/businesses \
    -H 'Content-Type: application/json' \
    -d '{
        "name": "New Business",
        "streetAddress": "123 Elm St",
        "city": "Metropolis",
        "state": "NY",
        "zipCode": "10101",
        "phoneNumber": "202-555-0171",
        "category": "Restaurant",
        "subcategory": "Pizza",
        "website": "http://newbusiness.com",
        "email": "info@newbusiness.com"
      }'

status 'POST /businesses should fail with incomplete data'
curl -X POST http://localhost:3000/businesses \
    -H 'Content-Type: application/json' \
    -d '{
        "name": "Incomplete Business",
        "city": "Metropolis",
        "state": "NY"
      }'

# Test PUT /businesses/{businessId} (Update a Business)
status 'PUT /businesses/{businessId} should succeed'
curl -X PUT http://localhost:3000/businesses/12345 \
    -H 'Content-Type: application/json' \
    -d '{
        "name": "Updated Business Name",
        "phoneNumber": "202-555-0199"
      }'

status 'PUT /businesses/{businessId} should fail with non-existent ID'
curl -X PUT http://localhost:3000/businesses/99999 \
    -H 'Content-Type: application/json' \
    -d '{
        "name": "No Business"
      }'

# Test DELETE /businesses/{businessId} (Remove a Business)
status 'DELETE /businesses/{businessId} should succeed'
curl -X DELETE http://localhost:3000/businesses/12345

status 'DELETE /businesses/{businessId} should fail with non-existent ID'
curl -X DELETE http://localhost:3000/businesses/99999

# Test GET /businesses (List All Businesses)
status 'GET /businesses should succeed'
curl http://localhost:3000/businesses

# Test PUT /businesses/{businessId}/reviews (Write a Review)
status 'PUT /businesses/{businessId}/reviews should succeed'
curl -X PUT http://localhost:3000/businesses/12345/reviews \
    -H 'Content-Type: application/json' \
    -d '{
        "starRating": "5",
        "dollarSignRating": "3",
        "writtenReview": "Fantastic service!"
      }'

# Test PUT /reviews/{reviewId} (Modify a Review)
status 'PUT /reviews/{reviewId} should succeed'
curl -X PUT http://localhost:3000/reviews/67890 \
    -H 'Content-Type: application/json' \
    -d '{
        "starRating": "4"
      }'

# Test DELETE /reviews/{reviewId} (Delete a Review)
status 'DELETE /reviews/{reviewId} should succeed'
curl -X DELETE http://localhost:3000/reviews/67890

# Test POST /businesses/{businessId}/photos (Upload a Photo)
status 'POST /businesses/{businessId}/photos should succeed'
curl -X POST http://localhost:3000/businesses/12345/photos \
    -H 'Content-Type: application/json' \
    -d '{"caption": "Front of the Business"}'

# Test DELETE /photos/{photoId} (Remove a Photo)
status 'DELETE /photos/{photoId} should succeed'
curl -X DELETE http://localhost:3000/photos/67890

# Test PUT /photos/{photoId} (Modify a Photo Caption)
status 'PUT /photos/{photoId} should succeed'
curl -X PUT http://localhost:3000/photos/67890 \
    -H 'Content-Type: application/json' \
    -d '{"caption": "Updated Front of the Business"}'
