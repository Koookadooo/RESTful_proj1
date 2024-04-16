const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json()); // Middleware to parse JSON bodies

// Add a Business
app.post('/businesses', (req, res) => {
    const { name, streetAddress, city, state, zipCode, phoneNumber, category, subcategory, website, email } = req.body;
    if (!name || !streetAddress || !city || !state || !zipCode || !phoneNumber || !category || !subcategory) {
        return res.status(400).json({ message: "Missing required fields" });
    }
    res.status(201).json({ id: "12345", message: "Business added successfully." });
});

// Update a Business
app.put('/businesses/:businessId', (req, res) => {
    const { businessId } = req.params;
    if (!businessId) {
        return res.status(404).json({ message: "Business ID is required" });
    }
    res.json({ message: "Business updated successfully." });
});

// Remove a Business
app.delete('/businesses/:businessId', (req, res) => {
    const { businessId } = req.params;
    if (!businessId) {
        return res.status(404).json({ message: "Business not found" });
    }
    res.json({ message: "Business removed successfully." });
});

// List All Businesses
app.get('/businesses', (req, res) => {
    res.json([
        { id: "12345", name: "Business Name", address: "1234 Main St, Anytown, Anystate, 12345" }
    ]);
});

// Write a Review
app.put('/businesses/:businessId/reviews', (req, res) => {
    const { starRating, dollarSignRating, writtenReview } = req.body;
    if (!starRating && !dollarSignRating && !writtenReview) {
        return res.status(400).json({ message: "No review content provided" });
    }
    res.status(201).json({ reviewID: "1234", message: "Review added successfully." });
});

// Modify a Review
app.put('/reviews/:reviewId', (req, res) => {
    const { reviewId } = req.params;
    if (!reviewId) {
        return res.status(404).json({ message: "Review not found" });
    }
    res.json({ message: "Review updated successfully." });
});

// Delete a Review
app.delete('/reviews/:reviewId', (req, res) => {
    const { reviewId } = req.params;
    res.json({ message: "Review deleted successfully." });
});

// Upload a Photo
app.post('/businesses/:businessId/photos', (req, res) => {
  const { businessId } = req.params;
  const { caption } = req.body;  // Assuming file is uploaded and handled separately since we're not storing data
  if (!businessId) {
      return res.status(404).json({ message: "Business not found" });
  }
  res.status(201).json({ photoID: "67890", message: "Photo uploaded successfully.", caption: caption || "No Caption" });
});

// Remove a Photo
app.delete('/photos/:photoId', (req, res) => {
  const { photoId } = req.params;
  if (!photoId) {
      return res.status(404).json({ message: "Photo not found" });
  }
  res.json({ message: "Photo removed successfully." });
});

// Modify a Photo Caption
app.put('/photos/:photoId', (req, res) => {
  const { photoId } = req.params;
  const { caption } = req.body;
  if (!photoId) {
      return res.status(404).json({ message: "Photo not found" });
  }
  if (!caption) {
      return res.status(400).json({ message: "Caption required" });
  }
  res.json({ message: "Caption updated successfully." });
});

// Start the server
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));