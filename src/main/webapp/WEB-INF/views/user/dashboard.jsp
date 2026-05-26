<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>TaskFlow &mdash; My Tasks</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet"/>
  <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;500;700&family=DM+Sans:wght@300;400&display=swap" rel="stylesheet"/>

  <style>
    :root {
      --accent:      #4f8ef7;
      --accent-glow: rgba(79,142,247,0.18);
      --surface:     #0f1623;
      --surface2:    #161f2e;
      --surface3:    #1c2840;
      --border:      rgba(255,255,255,0.07);
      --text-muted:  rgba(255,255,255,0.38);
    }
    * { box-sizing: border-box; }
    body {
      font-family: 'DM Sans', sans-serif;
      background: var(--surface);
      color: #e2e8f0;
      min-height: 100vh;
    }

    /* ── Sidebar ── */
    .sidebar {
      width: 240px;
      background: var(--surface2);
      border-right: 1px solid var(--border);
      min-height: 100vh;
      position: fixed;
      top: 0; left: 0;
      display: flex;
      flex-direction: column;
      padding: 1.5rem 1rem;
      z-index: 100;
    }
    .brand {
      font-family: 'Space Grotesk', sans-serif;
      font-weight: 700;
      font-size: 1.3rem;
      color: #fff;
      padding: 0 0.5rem 1.5rem;
      border-bottom: 1px solid var(--border);
      margin-bottom: 1.5rem;
    }
    .brand span { color: var(--accent); }
    .nav-item-custom {
      display: flex;
      align-items: center;
      gap: 0.75rem;
      padding: 0.65rem 0.75rem;
      border-radius: 10px;
      color: var(--text-muted);
      font-size: 0.9rem;
      font-weight: 500;
      cursor: pointer;
      transition: all 0.2s;
      text-decoration: none;
      margin-bottom: 0.25rem;
    }
    .nav-item-custom:hover, .nav-item-custom.active {
      background: rgba(79,142,247,0.12);
      color: var(--accent);
    }
    .nav-item-custom i { font-size: 1.1rem; }
    .sidebar-bottom {
      margin-top: auto;
      border-top: 1px solid var(--border);
      padding-top: 1rem;
    }
    .user-pill {
      display: flex;
      align-items: center;
      gap: 0.75rem;
      padding: 0.5rem 0.75rem;
      border-radius: 10px;
    }
    .avatar {
      width: 34px; height: 34px;
      background: var(--accent);
      border-radius: 50%;
      display: flex; align-items: center; justify-content: center;
      font-family: 'Space Grotesk', sans-serif;
      font-weight: 700;
      font-size: 0.85rem;
      color: #fff;
      flex-shrink: 0;
    }
    .user-name { font-size: 0.875rem; font-weight: 500; color: #fff; }
    .user-role { font-size: 0.75rem; color: var(--text-muted); }

    /* ── Main ── */
    .main-content {
      margin-left: 240px;
      padding: 2rem 2.5rem;
      min-height: 100vh;
    }
    .page-header {
      margin-bottom: 2rem;
    }
    .page-header h2 {
      font-family: 'Space Grotesk', sans-serif;
      font-weight: 700;
      font-size: 1.6rem;
      color: #fff;
      margin: 0;
    }
    .page-header p { color: var(--text-muted); margin: 0.25rem 0 0; font-size: 0.9rem; }

    /* ── Stat cards ── */
    .stat-card {
      background: var(--surface2);
      border: 1px solid var(--border);
      border-radius: 14px;
      padding: 1.25rem 1.5rem;
    }
    .stat-label { font-size: 0.8rem; color: var(--text-muted); text-transform: uppercase; letter-spacing: 0.6px; }
    .stat-value {
      font-family: 'Space Grotesk', sans-serif;
      font-size: 2rem;
      font-weight: 700;
      color: #fff;
      line-height: 1;
      margin-top: 0.25rem;
    }
    .stat-icon {
      width: 40px; height: 40px;
      border-radius: 10px;
      display: flex; align-items: center; justify-content: center;
      font-size: 1.2rem;
    }

    /* ── Task table ── */
    .tasks-card {
      background: var(--surface2);
      border: 1px solid var(--border);
      border-radius: 14px;
      overflow: hidden;
    }
    .tasks-card-header {
      padding: 1.25rem 1.5rem;
      border-bottom: 1px solid var(--border);
      display: flex;
      align-items: center;
      justify-content: space-between;
    }
    .tasks-card-header h5 {
      font-family: 'Space Grotesk', sans-serif;
      font-weight: 600;
      margin: 0;
      font-size: 1rem;
    }
    .table {
      margin: 0;
      color: #e2e8f0;
    }
    .table thead th {
      background: var(--surface3);
      color: var(--text-muted);
      font-size: 0.75rem;
      text-transform: uppercase;
      letter-spacing: 0.7px;
      font-weight: 600;
      border-bottom: 1px solid var(--border);
      padding: 0.85rem 1.5rem;
    }
    .table tbody td {
      padding: 1rem 1.5rem;
      border-bottom: 1px solid var(--border);
      vertical-align: middle;
      font-size: 0.9rem;
    }
    .table tbody tr:last-child td { border-bottom: none; }
    .table tbody tr:hover td { background: rgba(79,142,247,0.04); }

    /* Deadline badge */
    .deadline-badge {
      display: inline-flex;
      align-items: center;
      gap: 0.4rem;
      font-size: 0.8rem;
      padding: 0.3rem 0.7rem;
      border-radius: 20px;
    }
    .deadline-upcoming { background: rgba(79,142,247,0.15); color: #7db3ff; }
    .deadline-soon     { background: rgba(255,193,7,0.15);  color: #ffc107; }
    .deadline-overdue  { background: rgba(220,53,69,0.15);  color: #f87171; }

    /* Empty state */
    .empty-state {
      padding: 4rem 2rem;
      text-align: center;
    }
    .empty-icon {
      font-size: 3rem;
      color: var(--text-muted);
      margin-bottom: 1rem;
    }
    .empty-state h6 { color: #fff; font-family: 'Space Grotesk', sans-serif; }
    .empty-state p  { color: var(--text-muted); font-size: 0.875rem; }

    /* Alert strip */
    .alert-success-custom {
      background: rgba(25,135,84,0.15);
      border: 1px solid rgba(25,135,84,0.3);
      border-radius: 10px;
      color: #6ee7a0;
      font-size: 0.875rem;
      padding: 0.75rem 1rem;
    }
  </style>
</head>
<body>

  <!-- ── Sidebar ── -->
  <aside class="sidebar">
    <div class="brand"><i class="bi bi-check2-square me-1"></i>Task<span>Flow</span></div>

    <a href="${pageContext.request.contextPath}/app/user/dashboard" class="nav-item-custom active">
      <i class="bi bi-grid-1x2"></i> Dashboard
    </a>
    <a href="#" class="nav-item-custom">
      <i class="bi bi-list-check"></i> My Tasks
    </a>

    <div class="sidebar-bottom">
      <div class="user-pill">
        <div class="avatar">${loggedUser.name.substring(0,1).toUpperCase()}</div>
        <div>
          <div class="user-name">${loggedUser.name}</div>
          <div class="user-role">Member</div>
        </div>
      </div>
      <a href="${pageContext.request.contextPath}/logout" class="nav-item-custom mt-2" style="color:#f87171;">
        <i class="bi bi-box-arrow-left"></i> Logout
      </a>
    </div>
  </aside>

  <!-- ── Main ── -->
  <main class="main-content">

    <div class="page-header d-flex align-items-start justify-content-between">
      <div>
        <h2>My Tasks</h2>
        <p>Here's everything assigned to you</p>
      </div>
    </div>

    <!-- Flash messages -->
    <c:if test="${not empty param.success}">
      <div class="alert-success-custom d-flex align-items-center gap-2 mb-4">
        <i class="bi bi-check-circle-fill"></i> Task updated successfully.
      </div>
    </c:if>

    <!-- Stat row -->
    <div class="row g-3 mb-4">
      <div class="col-sm-4">
        <div class="stat-card d-flex align-items-center justify-content-between">
          <div>
            <div class="stat-label">Total Tasks</div>
            <div class="stat-value">${tasks.size()}</div>
          </div>
          <div class="stat-icon" style="background:rgba(79,142,247,0.15);color:var(--accent);">
            <i class="bi bi-clipboard2-check"></i>
          </div>
        </div>
      </div>
      <div class="col-sm-4">
        <div class="stat-card d-flex align-items-center justify-content-between">
          <div>
            <div class="stat-label">Due This Week</div>
            <div class="stat-value">
              <c:set var="weekCount" value="0"/>
              <c:forEach var="t" items="${tasks}">
                <%-- Count done in servlet ideally; here's a placeholder --%>
              </c:forEach>
              —
            </div>
          </div>
          <div class="stat-icon" style="background:rgba(255,193,7,0.12);color:#ffc107;">
            <i class="bi bi-clock"></i>
          </div>
        </div>
      </div>
      <div class="col-sm-4">
        <div class="stat-card d-flex align-items-center justify-content-between">
          <div>
            <div class="stat-label">Hello</div>
            <div class="stat-value" style="font-size:1.1rem;padding-top:4px;">${loggedUser.name}</div>
          </div>
          <div class="stat-icon" style="background:rgba(79,142,247,0.15);color:var(--accent);">
            <i class="bi bi-person-check"></i>
          </div>
        </div>
      </div>
    </div>

    <!-- Tasks table -->
    <div class="tasks-card">
      <div class="tasks-card-header">
        <h5><i class="bi bi-list-task me-2" style="color:var(--accent);"></i>Assigned Tasks</h5>
        <span class="badge" style="background:var(--surface3);color:var(--text-muted);font-size:0.78rem;border-radius:20px;padding:.35rem .75rem;">
          ${tasks.size()} total
        </span>
      </div>

      <c:choose>
        <c:when test="${empty tasks}">
          <div class="empty-state">
            <div class="empty-icon"><i class="bi bi-inbox"></i></div>
            <h6>No tasks yet</h6>
            <p>Tasks assigned by your admin will appear here.</p>
          </div>
        </c:when>
        <c:otherwise>
          <div class="table-responsive">
            <table class="table table-borderless">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Task Name</th>
                  <th>Description</th>
                  <th>Deadline</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="task" items="${tasks}" varStatus="s">
                  <tr>
                    <td style="color:var(--text-muted);font-size:0.8rem;">${s.index + 1}</td>
                    <td style="font-weight:500;">${task.task_name}</td>
                    <td style="color:rgba(255,255,255,0.6);max-width:300px;">${task.task_description}</td>
                    <td>
                      <span class="deadline-badge deadline-upcoming">
                        <i class="bi bi-calendar3"></i> ${task.deadline}
                      </span>
                    </td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </c:otherwise>
      </c:choose>
    </div>

  </main>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
