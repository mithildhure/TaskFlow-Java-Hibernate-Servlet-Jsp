<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>TaskFlow &mdash; Register</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet"/>
  <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;500;700&family=DM+Sans:wght@300;400&display=swap" rel="stylesheet"/>

  <style>
    :root {
      --accent: #4f8ef7;
      --accent-glow: rgba(79,142,247,0.25);
      --surface: #0f1623;
      --surface2: #161f2e;
      --border: rgba(255,255,255,0.08);
    }
    body {
      font-family: 'DM Sans', sans-serif;
      background: var(--surface);
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      position: relative;
      overflow: hidden;
    }
    body::before {
      content: '';
      position: fixed;
      width: 500px; height: 500px;
      background: radial-gradient(circle, rgba(79,142,247,0.10) 0%, transparent 70%);
      top: -150px; right: -100px;
      pointer-events: none;
    }
    h1.brand {
      font-family: 'Space Grotesk', sans-serif;
      font-weight: 700;
      font-size: 1.8rem;
      color: #fff;
      letter-spacing: -0.5px;
    }
    h1.brand span { color: var(--accent); }

    .card {
      background: var(--surface2);
      border: 1px solid var(--border);
      border-radius: 16px;
      width: 100%;
      max-width: 440px;
      padding: 2.5rem 2rem;
      box-shadow: 0 0 60px rgba(0,0,0,0.5);
      animation: slideUp 0.4s ease;
    }
    @keyframes slideUp {
      from { opacity: 0; transform: translateY(20px); }
      to   { opacity: 1; transform: translateY(0); }
    }
    .form-floating label { color: rgba(255,255,255,0.45); font-size: 0.9rem; }
    .form-floating .form-control {
      background: rgba(255,255,255,0.04);
      border: 1px solid var(--border);
      border-radius: 10px;
      color: #fff;
      font-size: 0.95rem;
      transition: border-color 0.2s, box-shadow 0.2s;
    }
    .form-floating .form-control:focus {
      background: rgba(255,255,255,0.06);
      border-color: var(--accent);
      box-shadow: 0 0 0 3px var(--accent-glow);
    }
    .btn-primary {
      background: var(--accent);
      border: none;
      border-radius: 10px;
      font-family: 'Space Grotesk', sans-serif;
      font-weight: 600;
      font-size: 0.95rem;
      padding: 0.75rem;
      transition: opacity 0.2s, transform 0.15s;
    }
    .btn-primary:hover { opacity: 0.88; transform: translateY(-1px); }
    a { color: var(--accent); text-decoration: none; }
    a:hover { text-decoration: underline; }
    .alert-danger {
      background: rgba(220,53,69,0.15);
      border: 1px solid rgba(220,53,69,0.3);
      border-radius: 10px;
      color: #f87171;
      font-size: 0.875rem;
    }
    .text-muted-custom { color: rgba(255,255,255,0.4); font-size: 0.85rem; }
    .step-badge {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      width: 22px; height: 22px;
      background: var(--accent);
      border-radius: 50%;
      font-size: 0.7rem;
      font-weight: 700;
      color: #fff;
      flex-shrink: 0;
    }
  </style>
</head>
<body>
  <div class="card">
    <div class="text-center mb-4">
      <h1 class="brand"><i class="bi bi-check2-square me-1"></i>Task<span>Flow</span></h1>
      <p class="text-muted-custom mt-1">Create your account</p>
    </div>

    <% if (request.getAttribute("error") != null) { %>
      <div class="alert alert-danger d-flex align-items-center gap-2 mb-3">
        <i class="bi bi-exclamation-circle-fill"></i>
        <span>${error}</span>
      </div>
    <% } %>

    <form action="${pageContext.request.contextPath}/register" method="post" novalidate>

      <div class="form-floating mb-3">
        <input type="text" class="form-control" id="name"
               name="name" placeholder="Full Name" required/>
        <label for="name"><i class="bi bi-person-badge me-1"></i>Full Name</label>
      </div>

      <div class="form-floating mb-3">
        <input type="text" class="form-control" id="username"
               name="username" placeholder="username" required autocomplete="username"/>
        <label for="username"><i class="bi bi-at me-1"></i>Username</label>
      </div>

      <div class="form-floating mb-3">
        <input type="email" class="form-control" id="email"
               name="email" placeholder="Email" required autocomplete="email"/>
        <label for="email"><i class="bi bi-envelope me-1"></i>Email address</label>
      </div>

      <div class="form-floating mb-4">
        <input type="password" class="form-control" id="password"
               name="password" placeholder="Password" required autocomplete="new-password"/>
        <label for="password"><i class="bi bi-lock me-1"></i>Password</label>
      </div>

      <button type="submit" class="btn btn-primary w-100">
        Create Account <i class="bi bi-arrow-right ms-1"></i>
      </button>
    </form>

    <p class="text-center text-muted-custom mt-4 mb-0">
      Already have an account? <a href="${pageContext.request.contextPath}/login">Sign in</a>
    </p>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
