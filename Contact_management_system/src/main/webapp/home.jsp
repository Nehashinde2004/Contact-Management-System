<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to Eco Eats</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: #f8f9fa; }
        .hero-section { background: #219150; color: #fff; padding: 60px 0 40px 0; }
        .card { border: none; border-radius: 16px; }
        .card-title { font-weight: 600; }
        .category-card .card-title { font-size: 1.3em; }
        .category-card .btn { margin-top: 10px; }
        .footer { background: #fff; color: #888; padding: 20px 0 0 0; font-size: 0.95em; }
    </style>
</head>
<body>
    <!-- Hero Section -->
    <div class="hero-section text-center">
        <div class="container">
            <h1 class="display-4 fw-bold">Welcome to Eco Eats</h1>
            <p class="lead mb-4">Your one-stop destination for fresh, organic groceries and eco-friendly products. We believe in sustainable living and healthy eating.</p>
            <a href="products" class="btn btn-light btn-lg px-4">Shop Now</a>
        </div>
    </div>

    <!-- Feature Cards Section -->
    <div class="container my-5">
        <div class="row text-center">
            <div class="col-md-4 mb-4">
                <div class="card h-100 shadow-sm">
                    <div class="card-body">
                        <h3 class="card-title"><span style="font-size:2em;">🌱</span> <span class="text-success">Fresh & Organic</span></h3>
                        <p class="card-text">All our products are carefully selected for freshness and quality. We source directly from local farmers.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card h-100 shadow-sm">
                    <div class="card-body">
                        <h3 class="card-title"><span style="font-size:2em;">♻️</span> <span class="text-success">Eco-Friendly</span></h3>
                        <p class="card-text">We offer a wide range of sustainable and eco-friendly products to help you live a greener lifestyle.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card h-100 shadow-sm">
                    <div class="card-body">
                        <h3 class="card-title"><span style="font-size:2em;">🚚</span> <span class="text-success">Fast Delivery</span></h3>
                        <p class="card-text">Quick and reliable delivery to your doorstep. We ensure your groceries arrive fresh and on time.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Shop by Category Section -->
    <div class="container my-5">
        <h2 class="text-center mb-4">Shop by Category</h2>
        <div class="row text-center">
            <div class="col-md-3 mb-4">
                <div class="card h-100 shadow-sm category-card">
                    <div class="card-body">
                        <h4 class="card-title"><span style="font-size:1.5em;">🍎</span> Fruits</h4>
                        <p class="card-text">Fresh and seasonal fruits</p>
                        <a href="products?category=fruits" class="btn btn-outline-success">View Fruits</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-4">
                <div class="card h-100 shadow-sm category-card">
                    <div class="card-body">
                        <h4 class="card-title"><span style="font-size:1.5em;">🥦</span> Vegetables</h4>
                        <p class="card-text">Organic vegetables</p>
                        <a href="products?category=vegetables" class="btn btn-outline-success">View Vegetables</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-4">
                <div class="card h-100 shadow-sm category-card">
                    <div class="card-body">
                        <h4 class="card-title"><span style="font-size:1.5em;">🥛</span> Dairy</h4>
                        <p class="card-text">Fresh dairy products</p>
                        <a href="products?category=dairy" class="btn btn-outline-success">View Dairy</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-4">
                <div class="card h-100 shadow-sm category-card">
                    <div class="card-body">
                        <h4 class="card-title"><span style="font-size:1.5em;">🌿</span> Eco-Friendly</h4>
                        <p class="card-text">Sustainable products</p>
                        <a href="products?category=eco" class="btn btn-outline-success">View Eco Products</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <div class="footer text-center">
        &copy; 2025 Eco Eats Explorers. All rights reserved.
    </div>
</body>
</html> 