<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>TaskFlow &mdash; Admin</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;500;700&family=DM+Sans:wght@300;400&display=swap"
	rel="stylesheet" />

<style>
:root {
	--accent: #4f8ef7;
	--accent-glow: rgba(79, 142, 247, 0.18);
	--surface: #0f1623;
	--surface2: #161f2e;
	--surface3: #1c2840;
	--border: rgba(255, 255, 255, 0.07);
	--text-muted: rgba(255, 255, 255, 0.38);
	--danger: #f87171;
	--warning: #ffc107;
	--success: #6ee7a0;
}

body {
	font-family: 'DM Sans', sans-serif;
	background: var(--surface);
	color: #e2e8f0;
	min-height: 100vh;
}

/* Sidebar */
.sidebar {
	width: 240px;
	background: var(--surface2);
	border-right: 1px solid var(--border);
	min-height: 100vh;
	position: fixed;
	top: 0;
	left: 0;
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

.brand span {
	color: var(--accent);
}

.nav-label {
	font-size: 0.68rem;
	text-transform: uppercase;
	letter-spacing: 1px;
	color: var(--text-muted);
	padding: 0 0.75rem;
	margin-bottom: 0.5rem;
	margin-top: 0.5rem;
}

.nav-item-custom {
	display: flex;
	align-items: center;
	gap: 0.75rem;
	padding: 0.65rem 0.75rem;
	border-radius: 10px;
	color: var(--text-muted);
	font-size: 0.9rem;
	font-weight: 500;
	text-decoration: none;
	margin-bottom: 0.25rem;
	transition: all 0.2s;
}

.nav-item-custom:hover, .nav-item-custom.active {
	background: rgba(79, 142, 247, 0.12);
	color: var(--accent);
}

.nav-item-custom i {
	font-size: 1.1rem;
}

.sidebar-bottom {
	margin-top: auto;
	border-top: 1px solid var(--border);
	padding-top: 1rem;
}

.avatar {
	width: 34px;
	height: 34px;
	background: var(--accent);
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	font-family: 'Space Grotesk', sans-serif;
	font-weight: 700;
	font-size: 0.85rem;
	color: #fff;
	flex-shrink: 0;
}

.admin-badge {
	display: inline-block;
	background: rgba(79, 142, 247, 0.2);
	color: var(--accent);
	font-size: 0.65rem;
	font-weight: 700;
	letter-spacing: 0.5px;
	padding: 0.15rem 0.5rem;
	border-radius: 20px;
	text-transform: uppercase;
}

/* Main */
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

.page-header p {
	color: var(--text-muted);
	margin: 0.25rem 0 0;
	font-size: 0.9rem;
}

/* Stat cards */
.stat-card {
	background: var(--surface2);
	border: 1px solid var(--border);
	border-radius: 14px;
	padding: 1.25rem 1.5rem;
}

.stat-label {
	font-size: 0.78rem;
	color: var(--text-muted);
	text-transform: uppercase;
	letter-spacing: 0.6px;
}

.stat-value {
	font-family: 'Space Grotesk', sans-serif;
	font-size: 2rem;
	font-weight: 700;
	color: #fff;
	line-height: 1;
	margin-top: 0.25rem;
}

.stat-icon {
	width: 40px;
	height: 40px;
	border-radius: 10px;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 1.2rem;
}

/* Cards */
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
	font-size: 0.72rem;
	text-transform: uppercase;
	letter-spacing: 0.7px;
	font-weight: 600;
	border-bottom: 1px solid var(--border);
	padding: 0.85rem 1.5rem;
}

.table tbody td {
	padding: 0.9rem 1.5rem;
	border-bottom: 1px solid var(--border);
	vertical-align: middle;
	font-size: 0.875rem;
}

.table tbody tr:last-child td {
	border-bottom: none;
}

.table tbody tr:hover td {
	background: rgba(79, 142, 247, 0.03);
}

.btn-action {
	border: none;
	background: transparent;
	padding: 0.35rem 0.5rem;
	border-radius: 8px;
	font-size: 0.85rem;
	transition: all 0.15s;
	line-height: 1;
}

.btn-edit {
	color: var(--accent);
}

.btn-edit:hover {
	background: rgba(79, 142, 247, 0.15);
}

.btn-del {
	color: var(--danger);
}

.btn-del:hover {
	background: rgba(248, 113, 113, 0.15);
}

.btn-primary-custom {
	background: var(--accent);
	border: none;
	border-radius: 9px;
	font-family: 'Space Grotesk', sans-serif;
	font-weight: 600;
	font-size: 0.85rem;
	padding: 0.55rem 1.1rem;
	color: #fff;
	text-decoration: none;
	display: inline-flex;
	align-items: center;
	gap: 0.4rem;
	transition: opacity 0.2s, transform 0.15s;
}

.btn-primary-custom:hover {
	opacity: 0.88;
	transform: translateY(-1px);
	color: #fff;
}

.empty-state {
	padding: 3.5rem 2rem;
	text-align: center;
}

.empty-icon {
	font-size: 2.5rem;
	color: var(--text-muted);
	margin-bottom: 0.75rem;
}

.empty-state h6 {
	color: #fff;
	font-family: 'Space Grotesk', sans-serif;
}

.empty-state p {
	color: var(--text-muted);
	font-size: 0.875rem;
}

.alert-flash {
	border-radius: 10px;
	font-size: 0.875rem;
	padding: 0.75rem 1rem;
	display: flex;
	align-items: center;
	gap: 0.6rem;
	margin-bottom: 1.5rem;
}

.flash-success {
	background: rgba(25, 135, 84, 0.15);
	border: 1px solid rgba(25, 135, 84, 0.3);
	color: var(--success);
}

.flash-error {
	background: rgba(220, 53, 69, 0.15);
	border: 1px solid rgba(220, 53, 69, 0.3);
	color: var(--danger);
}

.user-chip {
	display: inline-flex;
	align-items: center;
	gap: 0.4rem;
	font-size: 0.8rem;
	color: rgba(255, 255, 255, 0.6);
}

.user-dot {
	width: 6px;
	height: 6px;
	background: var(--accent);
	border-radius: 50%;
	display: inline-block;
}
</style>
</head>
<body>

	<!-- Sidebar -->
	<aside class="sidebar">
		<div class="brand">
			<i class="bi bi-check2-square me-1"></i>Task<span>Flow</span>
		</div>

		<div class="nav-label">Overview</div>
		<a href="${pageContext.request.contextPath}/app/admin/dashboard"
			class="nav-item-custom active"> <i class="bi bi-grid-1x2"></i>
			Dashboard
		</a>

		<div class="nav-label mt-2">Manage</div>
		<a href="${pageContext.request.contextPath}/app/admin/tasks/add"
			class="nav-item-custom"> <i class="bi bi-plus-square"></i> Add
			Task
		</a> <a href="#users" class="nav-item-custom"> <i class="bi bi-people"></i>
			Users
		</a>

		<div class="sidebar-bottom">
			<div class="d-flex align-items-center gap-2 px-2 mb-2">
				<div class="avatar">${loggedUser.name.substring(0,1).toUpperCase()}</div>
				<div>
					<div style="font-size: .875rem; font-weight: 500; color: #fff;">${loggedUser.name}</div>
					<span class="admin-badge">Admin</span>
				</div>
			</div>
			<a href="${pageContext.request.contextPath}/logout"
				class="nav-item-custom" style="color: #f87171;"> <i
				class="bi bi-box-arrow-left"></i> Logout
			</a>
		</div>
	</aside>

	<!-- Main -->
	<main class="main-content">

		<div class="page-header">
			<h2>Admin Dashboard</h2>
			<p>Manage all tasks and users from here</p>
		</div>

		<!-- Flash messages -->
		<c:if test="${param.added == 'true'}">
			<div class="alert-flash flash-success">
				<i class="bi bi-check-circle-fill"></i> Task added successfully.
			</div>
		</c:if>
		<c:if test="${param.updated == 'true'}">
			<div class="alert-flash flash-success">
				<i class="bi bi-check-circle-fill"></i> Task updated.
			</div>
		</c:if>
		<c:if test="${param.deleted == 'true'}">
			<div class="alert-flash flash-error">
				<i class="bi bi-trash3-fill"></i> Task deleted.
			</div>
		</c:if>

		<!-- Stats -->
		<div class="row g-3 mb-4">
			<div class="col-sm-6 col-lg-3">
				<div
					class="stat-card d-flex align-items-center justify-content-between">
					<div>
						<div class="stat-label">Total Tasks</div>
						<div class="stat-value">${tasks.size()}</div>
					</div>
					<div class="stat-icon"
						style="background: rgba(79, 142, 247, 0.15); color: var(--accent);">
						<i class="bi bi-clipboard2-check"></i>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-lg-3">
				<div
					class="stat-card d-flex align-items-center justify-content-between">
					<div>
						<div class="stat-label">Total Users</div>
						<div class="stat-value">${users.size()}</div>
					</div>
					<div class="stat-icon"
						style="background: rgba(110, 231, 160, 0.12); color: var(--success);">
						<i class="bi bi-people"></i>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-lg-3">
				<div
					class="stat-card d-flex align-items-center justify-content-between">
					<div>
						<div class="stat-label">Avg Tasks/User</div>
						<div class="stat-value" style="font-size: 1.5rem;">
							<c:choose>
								<c:when test="${users.size() > 0}">
									<fmt:formatNumber value="${tasks.size() / users.size()}"
										maxFractionDigits="1" />
								</c:when>
								<c:otherwise>0</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="stat-icon"
						style="background: rgba(255, 193, 7, 0.12); color: var(--warning);">
						<i class="bi bi-bar-chart"></i>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-lg-3">
				<div
					class="stat-card d-flex align-items-center justify-content-between">
					<div>
						<div class="stat-label">Logged in as</div>
						<div class="stat-value" style="font-size: 1rem; padding-top: 6px;">${loggedUser.name}</div>
					</div>
					<div class="stat-icon"
						style="background: rgba(79, 142, 247, 0.15); color: var(--accent);">
						<i class="bi bi-shield-check"></i>
					</div>
				</div>
			</div>
		</div>

		<!-- All Tasks Table -->
		<div class="tasks-card mb-4">
			<div class="tasks-card-header">
				<h5>
					<i class="bi bi-list-task me-2" style="color: var(--accent);"></i>All
					Tasks
				</h5>
				<a href="${pageContext.request.contextPath}/app/admin/tasks/add"
					class="btn-primary-custom"> <i class="bi bi-plus-lg"></i> Add
					Task
				</a>
			</div>

			<c:choose>
				<c:when test="${empty tasks}">
					<div class="empty-state">
						<div class="empty-icon">
							<i class="bi bi-inbox"></i>
						</div>
						<h6>No tasks yet</h6>
						<p>Click "Add Task" to create the first one.</p>
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
									<th>Assigned To</th>
									<th>Deadline</th>
									<th>Actions</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="task" items="${tasks}" varStatus="s">
									<tr>
										<td style="color: var(--text-muted); font-size: 0.78rem;">${s.index + 1}</td>
										<td style="font-weight: 500;">${task.task_name}</td>
										<td
											style="color: rgba(255, 255, 255, 0.55); max-width: 220px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${task.task_description}</td>
										<td><span class="user-chip"> <span
												class="user-dot"></span> ${task.user.name}
										</span></td>
										<td style="color: var(--text-muted); font-size: 0.82rem;">
											<i class="bi bi-calendar3 me-1"></i>${task.deadline}
										</td>
										<td><a
											href="${pageContext.request.contextPath}/app/admin/tasks/update?id=${task.task_id}"
											class="btn-action btn-edit" title="Edit"> <i
												class="bi bi-pencil-square"></i>
										</a> <a
											href="${pageContext.request.contextPath}/app/admin/tasks/delete?id=${task.task_id}"
											class="btn-action btn-del" title="Delete"
											onclick="return confirm('Delete this task?')"> <i
												class="bi bi-trash3"></i>
										</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</c:otherwise>
			</c:choose>
		</div>

		<!-- Users Table -->
		<div class="tasks-card" id="users">
			<div class="tasks-card-header">
				<h5>
					<i class="bi bi-people me-2" style="color: var(--accent);"></i>All
					Users
				</h5>
				<span class="badge"
					style="background: var(--surface3); color: var(--text-muted); font-size: 0.78rem; border-radius: 20px; padding: .35rem .75rem;">
					${users.size()} registered </span>
			</div>

			<c:choose>
				<c:when test="${empty users}">
					<div class="empty-state">
						<div class="empty-icon">
							<i class="bi bi-people"></i>
						</div>
						<h6>No users yet</h6>
					</div>
				</c:when>
				<c:otherwise>
					<div class="table-responsive">
						<table class="table table-borderless">
							<thead>
								<tr>
									<th>#</th>
									<th>Name</th>
									<th>Username</th>
									<th>Email</th>
									<th>Role</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="u" items="${users}" varStatus="s">
									<tr>
										<td style="color: var(--text-muted); font-size: 0.78rem;">${s.index + 1}</td>
										<td>
											<div class="d-flex align-items-center gap-2">
												<div
													style="width: 28px; height: 28px; background: rgba(79, 142, 247, 0.2); border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 0.75rem; font-weight: 700; color: var(--accent);">
													${u.name.substring(0,1).toUpperCase()}</div>
												<span style="font-weight: 500;">${u.name}</span>
											</div>
										</td>
										<td style="color: var(--text-muted);">@${u.username}</td>
										<td
											style="color: rgba(255, 255, 255, 0.55); font-size: 0.85rem;">${u.email}</td>
										<td><c:choose>
												<c:when test="${u.role == 'ADMIN'}">
													<span
														style="background: rgba(79, 142, 247, 0.18); color: var(--accent); font-size: 0.72rem; font-weight: 700; padding: .25rem .65rem; border-radius: 20px; text-transform: uppercase; letter-spacing: .4px;">Admin</span>
												</c:when>
												<c:otherwise>
													<span
														style="background: rgba(255, 255, 255, 0.07); color: var(--text-muted); font-size: 0.72rem; font-weight: 600; padding: .25rem .65rem; border-radius: 20px; text-transform: uppercase; letter-spacing: .4px;">User</span>
												</c:otherwise>
											</c:choose></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</c:otherwise>
			</c:choose>
		</div>

	</main>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
