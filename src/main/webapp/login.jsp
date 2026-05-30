<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login — SecureBank</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600&display=swap"
	rel="stylesheet">

<style>
*, *::before, *::after {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

:root {
	--color-bg: #f0f2f5;
	--color-surface: #ffffff;
	--color-border: #e2e6ea;
	--color-border-focus: #2563eb;
	--color-text-primary: #0f1923;
	--color-text-secondary: #6b7280;
	--color-text-muted: #9ca3af;
	--color-accent: #1d4ed8;
	--color-accent-hover: #1e40af;
	--color-accent-light: #eff6ff;
	--color-error: #dc2626;
	--radius-sm: 6px;
	--radius-md: 10px;
	--radius-lg: 16px;
	--shadow-card: 0 1px 3px rgba(0, 0, 0, 0.06), 0 4px 16px
		rgba(0, 0, 0, 0.07);
	--font: 'Inter', sans-serif;
}

body {
	min-height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
	background-color: var(--color-bg);
	font-family: var(--font);
	color: var(--color-text-primary);
	padding: 24px 16px;
}

/* ── Brand strip ── */
.brand {
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 10px;
	margin-bottom: 28px;
}

.brand-icon {
	width: 36px;
	height: 36px;
	background: var(--color-accent);
	border-radius: var(--radius-sm);
	display: flex;
	align-items: center;
	justify-content: center;
}

.brand-icon svg {
	width: 20px;
	height: 20px;
	fill: none;
	stroke: #ffffff;
	stroke-width: 2;
	stroke-linecap: round;
	stroke-linejoin: round;
}

.brand-name {
	font-size: 18px;
	font-weight: 600;
	letter-spacing: -0.3px;
	color: var(--color-text-primary);
}

/* ── Card ── */
.card {
	width: 100%;
	max-width: 420px;
	background: var(--color-surface);
	border-radius: var(--radius-lg);
	box-shadow: var(--shadow-card);
	border: 1px solid var(--color-border);
	padding: 40px 36px;
}

/* ── Heading ── */
.card-header {
	margin-bottom: 28px;
}

.card-title {
	font-size: 22px;
	font-weight: 600;
	letter-spacing: -0.4px;
	color: var(--color-text-primary);
	margin-bottom: 6px;
}

.card-subtitle {
	font-size: 14px;
	color: var(--color-text-secondary);
	font-weight: 400;
	line-height: 1.5;
}

/* ── Form fields ── */
.input-group {
	margin-bottom: 18px;
}

.input-group label {
	display: block;
	font-size: 13px;
	font-weight: 500;
	color: var(--color-text-primary);
	margin-bottom: 6px;
	letter-spacing: 0.1px;
}

.input-group input {
	width: 100%;
	padding: 10px 13px;
	font-size: 14px;
	font-family: var(--font);
	color: var(--color-text-primary);
	background: #ffffff;
	border: 1px solid var(--color-border);
	border-radius: var(--radius-sm);
	outline: none;
	transition: border-color 0.15s ease, box-shadow 0.15s ease;
	-webkit-appearance: none;
}

.input-group input::placeholder {
	color: var(--color-text-muted);
}

.input-group input:focus {
	border-color: var(--color-border-focus);
	box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.10);
}

/* ── Submit button ── */
.btn-primary {
	width: 100%;
	padding: 11px;
	margin-top: 8px;
	border: none;
	background: var(--color-accent);
	color: #ffffff;
	font-size: 14px;
	font-weight: 500;
	font-family: var(--font);
	letter-spacing: 0.1px;
	border-radius: var(--radius-sm);
	cursor: pointer;
	transition: background 0.15s ease, box-shadow 0.15s ease;
}

.btn-primary:hover {
	background: var(--color-accent-hover);
	box-shadow: 0 2px 8px rgba(29, 78, 216, 0.25);
}

.btn-primary:active {
	background: var(--color-accent-hover);
	box-shadow: none;
}

/* ── Divider ── */
.divider {
	height: 1px;
	background: var(--color-border);
	margin: 24px 0;
}

/* ── Footer link ── */
.card-footer {
	text-align: center;
	font-size: 13.5px;
	color: var(--color-text-secondary);
}

.card-footer a {
	color: var(--color-accent);
	text-decoration: none;
	font-weight: 500;
	transition: color 0.15s ease;
}

.card-footer a:hover {
	color: var(--color-accent-hover);
	text-decoration: underline;
}

/* ── Responsive ── */
@media ( max-width : 480px) {
	.card {
		padding: 32px 24px;
	}
}
</style>
</head>
<body>

	<div style="width: 100%; max-width: 420px;">

		<!-- Brand -->
		<div class="brand">
			<div class="brand-icon">
				<!-- Shield / bank icon -->
				<svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path
						d="M12 2L3 7v5c0 5.25 3.75 10.15 9 11.25C17.25 22.15 21 17.25 21 12V7L12 2z" />
                </svg>
			</div>
			<span class="brand-name">SecureBank</span>
		</div>

		<!-- Card -->
		<div class="card">

			<div class="card-header">
				<h1 class="card-title">Welcome back</h1>
				<p class="card-subtitle">Sign in to access your account</p>
			</div>

			<form action="login" method="post">

				<div class="input-group">
					<label for="email">Email address</label> <input type="email"
						id="email" name="email" placeholder="you@example.com" required
						autocomplete="email">
				</div>

				<div class="input-group">
					<label for="password">Password</label> <input type="password"
						id="password" name="password" placeholder="Enter your password"
						required autocomplete="current-password">
				</div>



				<button type="submit" class="btn-primary">Sign In</button>

			</form>

			<div class="divider"></div>

			<div class="card-footer">
				Don't have an account? <a href="signup.jsp">Create one</a>
			</div>

		</div>

	</div>

</body>
</html>