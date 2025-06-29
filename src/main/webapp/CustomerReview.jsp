<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Customer Reviews</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .review-card {
      border-radius: 10px;
      background: #f8f9fa;
      padding: 15px;
      margin-top: 15px;
      box-shadow: 0 0 5px rgba(0,0,0,0.1);
    }
    .star {
      color: gold;
    }
  </style>
</head>
<body>

<div class="container py-4">
  <h2 class="text-center mb-4">Customer Reviews</h2>

  <!-- Review Form -->
  <div class="card p-4 mb-4">
    <h5>Submit Your Review</h5>
    <form id="reviewForm">
      <div class="mb-3">
        <label class="form-label">Your Name</label>
        <input type="text" class="form-control" id="reviewerName" required>
      </div>
      <div class="mb-3">
        <label class="form-label">Your Review</label>
        <textarea class="form-control" id="reviewText" rows="3" required></textarea>
      </div>
      <div class="mb-3">
        <label class="form-label">Rating</label>
        <select class="form-select" id="reviewRating" required>
          <option value="">Choose rating</option>
          <option value="5">⭐⭐⭐⭐⭐</option>
          <option value="4">⭐⭐⭐⭐</option>
          <option value="3">⭐⭐⭐</option>
          <option value="2">⭐⭐</option>
          <option value="1">⭐</option>
        </select>
      </div>
      <button type="submit" class="btn btn-primary">Submit Review</button>
    </form>
  </div>

  <!-- Reviews Display Section -->
  <div id="reviewList">
    <!-- New reviews will be inserted here -->
  </div>
</div>

<script>
  document.getElementById('reviewForm').addEventListener('submit', function(e) {
    e.preventDefault();

    const name = document.getElementById('reviewerName').value;
    const text = document.getElementById('reviewText').value;
    const rating = document.getElementById('reviewRating').value;

    const stars = '⭐'.repeat(rating);

    const newReview = document.createElement('div');
    newReview.classList.add('review-card');
    newReview.innerHTML = `
      <h6>${name}</h6>
      <div class="mb-2">${stars}</div>
      <p>${text}</p>
    `;

    document.getElementById('reviewList').prepend(newReview);

    // Clear form
    document.getElementById('reviewForm').reset();
  });
</script>

</body>
</html>
