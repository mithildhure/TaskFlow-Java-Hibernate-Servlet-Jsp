<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>TaskFlow &mdash; Update Task</title>
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
	--accent-glow: rgba(79, 142, 247, 0.2);
	--surface: #0f1623;
	--surface2: #161f2e;
	--surface3: #1c2840;
	--border: rgba(255, 255, 255, 0.07);
	--text-muted: rgba(255, 255, 255, 0.38);
}

body {
	font-family: 'DM Sans', sans-serif;
	background: var(--surface);
	color: #e2e8f0;
	min-height: 100vh;
}

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
	padding: 0.15rem 0.5rem;
	border-radius: 20px;
	text-transform: uppercase;
}

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

.breadcrumb-custom {
	color: var(--text-muted);
	font-size: 0.85rem;
}

.breadcrumb-custom a {
	color: var(--accent);
	text-decoration: none;
}

.form-card {
	background: var(--surface2);
	border: 1px solid var(--border);
	border-radius: 16px;
	padding: 2rem;
	max-width: 580px;
	animation: slideUp 0.35s ease;
}

@
keyframes slideUp {from { opacity:0;
	transform: translateY(16px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
.form-card h4 {
	font-family: 'Space Grotesk', sans-serif;
	font-weight: 700;
	font-size: 1.2rem;
	margin-bottom: 0.5rem;
	color: #fff;
}

.form-card .task-meta {
	font-size: 0.82rem;
	color: var(--text-muted);
	margin-bottom: 1.75rem;
	padding-bottom: 1.25rem;
	border-bottom: 1px solid var(--border);
}

.form-floating label {
	color: var(--text-muted);
	font-size: 0.9rem;
}

.form-floating .form-control {
	background: rgba(255, 255, 255, 0.04);
	border: 1px solid var(--border);
	border-radius: 10px;
	color: #fff;
	font-size: 0.9rem;
	transition: border-color 0.2s, box-shadow 0.2s;
}

.form-floating .form-control:focus {
	background: rgba(255, 255, 255, 0.06);
	border-color: var(--accent);
	box-shadow: 0 0 0 3px var(--accent-glow);
}

textarea.form-control {
	resize: vertical;
	min-height: 100px;
}

input[type="date"]::-webkit-calendar-picker-indicator {
	filter: invert(1);
	opacity: 0.5;
}

/* Assigned-to chip (read-only) */
.assigned-chip {
	display: inline-flex;
	align-items: center;
	gap: 0.5rem;
	background: rgba(79, 142, 247, 0.1);
	border: 1px solid rgba(79, 142, 247, 0.2);
	border-radius: 8px;
	padding: 0.65rem 1rem;
	font-size: 0.875rem;
	color: rgba(255, 255, 255, 0.7);
}

.assigned-chip strong {
	color: #fff;
}

.btn-submit {
	background: var(--accent);
	border: none;
	border-radius: 10px;
	font-family: 'Space Grotesk', sans-serif;
	font-weight: 600;
	font-size: 0.95rem;
	padding: 0.75rem 2rem;
	color: #fff;
	transition: opacity 0.2s, transform 0.15s;
}

.btn-submit:hover {
	opacity: 0.88;
	transform: translateY(-1px);
}

.btn-cancel {
	background: rgba(255, 255, 255, 0.06);
	border: 1px solid var(--border);
	border-radius: 10px;
	font-size: 0.9rem;
	padding: 0.75rem 1.5rem;
	color: var(--text-muted);
	text-decoration: none;
	transition: background 0.2s;
}

.btn-cancel:hover {
	background: rgba(255, 255, 255, 0.1);
	color: #fff;
}

.alert-danger-custom {
	background: rgba(220, 53, 69, 0.15);
	border: 1px solid rgba(220, 53, 69, 0.3);
	border-radius: 10px;
	color: #f87171;
	font-size: 0.875rem;
	padding: 0.75rem 1rem;
	margin-bottom: 1.5rem;
}
</style>
</head>
<body>

	<aside class="sidebar">
		<div class="brand">
			<i class="bi bi-check2-square me-1"></i>Task<span>Flow</span>
		</div>
		<div class="nav-label">Overview</div>
		<a href="${pageContext.request.contextPath}/app/admin/dashboard"
			class="nav-item-custom"> <i class="bi bi-grid-1x2"></i> Dashboard
		</a>
		<div class="nav-label mt-2">Manage</div>
		<a href="${pageContext.request.contextPath}/app/admin/tasks/add"
			class="nav-item-custom"> <i class="bi bi-plus-square"></i> Add
			Task
		</a> <a
			href="${pageContext.request.contextPath}/app/admin/dashboard#users"
			class="nav-item-custom"> <i class="bi bi-people"></i> Users
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

	<main class="main-content">

		<div class="page-header">
			<div class="breadcrumb-custom mb-1">
				<a href="${pageContext.request.contextPath}/app/admin/dashboard">Dashboard</a>
				<span class="mx-2">/</span>Edit Task
			</div>
			<h2>Update Task</h2>
		</div>

		<div class="form-card">
			<h4>
				<i class="bi bi-pencil-square me-2" style="color: var(--accent);"></i>Edit
				Task
			</h4>
			<div class="task-meta">
				Task ID #${task.task_id} &nbsp;·&nbsp; Assigned to <strong
					style="color: rgba(255, 255, 255, 0.7);">${task.user.name}</strong>
			</div>

			<c:if test="${not empty error}">
				<div class="alert-danger-custom d-flex align-items-center gap-2">
					<i class="bi bi-exclamation-circle-fill"></i> ${error}
				</div>
			</c:if>

			<form
				action="${pageContext.request.contextPath}/app/admin/tasks/update"
				method="post" novalidate>
				<!-- Hidden fields to carry the task id -->
				<input type="hidden" name="task_id" value="${task.task_id}" />

				<div class="form-floating mb-3">
					<input type="text" class="form-control" id="task_name"
						name="task_name" placeholder="Task Name" value="${task.task_name}"
						required /> <label for="task_name"><i
						class="bi bi-pencil me-1"></i>Task Name</label>
				</div>

				<div class="form-floating mb-3">
					<textarea class="form-control" id="task_description"
						name="task_description" placeholder="Description"
						style="height: 110px;" required>${task.task_description}</textarea>
					<label for="task_description"><i
						class="bi bi-text-paragraph me-1"></i>Description</label>
				</div>

				<div class="form-floating mb-4">
					<input type="date" class="form-control" id="deadline"
						name="deadline" placeholder="Deadline" value="${task.deadline}"
						required /> <label for="deadline"><i
						class="bi bi-calendar3 me-1"></i>Deadline</label>
				</div>

				<!-- Assigned user — shown but not editable (reassign = delete + new task) -->
				<div class="form-floating mb-4">
					<select class="form-control" id="user_id" name="user_id" required
						style="background: rgba(255, 255, 255, 0.04); border: 1px solid var(--border); color: #fff;">
						<option value="" disabled>Select a user</option>

						<c:forEach var="u" items="${users}">
							<option value="${u.user_id}" style="color: #000;"
								<c:if test="${u.user_id == task.user.user_id}">selected</c:if>>
								${u.name} (@${u.username})</option>
						</c:forEach>

					</select> <label for="user_id"><i class="bi bi-person-badge me-1"></i>Reassign
						To</label>
				</div>

				<div class="d-flex align-items-center gap-3">
					<button type="submit" class="btn-submit">
						<i class="bi bi-check-lg me-1"></i>Save Changes
					</button>
					<a href="${pageContext.request.contextPath}/app/admin/dashboard"
						class="btn-cancel"> Cancel </a>
				</div>

			</form>
		</div>
	</main>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
