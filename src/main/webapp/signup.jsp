<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Create Account — SecureBank</title>
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
	--color-section-bg: #f8fafc;
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
	padding: 32px 16px;
}

/* ── Brand ── */
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
	max-width: 460px;
	background: var(--color-surface);
	border-radius: var(--radius-lg);
	box-shadow: var(--shadow-card);
	border: 1px solid var(--color-border);
	padding: 40px 36px;
}

/* ── Header ── */
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

/* ── Section labels ── */
.section-label {
	font-size: 11px;
	font-weight: 600;
	letter-spacing: 0.7px;
	text-transform: uppercase;
	color: var(--color-text-muted);
	margin-bottom: 14px;
	margin-top: 24px;
}

.section-label:first-of-type {
	margin-top: 0;
}

/* ── Field group ── */
.input-group {
	margin-bottom: 16px;
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

/* Remove number input spinners */
.input-group input[type="number"]::-webkit-inner-spin-button,
	.input-group input[type="number"]::-webkit-outer-spin-button {
	-webkit-appearance: none;
}

.input-group input[type="number"] {
	-moz-appearance: textfield;
}

/* ── Inline field row ── */
.field-row {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 14px;
}

/* ── Divider ── */
.divider {
	height: 1px;
	background: var(--color-border);
	margin: 24px 0;
}

/* ── Notice ── */
.notice {
	display: flex;
	align-items: flex-start;
	gap: 10px;
	background: var(--color-accent-light);
	border: 1px solid #bfdbfe;
	border-radius: var(--radius-sm);
	padding: 11px 14px;
	margin-bottom: 20px;
}

.error-box {
	background: #ffe5e5;
	color: #d32f2f;
	border: 1px solid #ffb3b3;
	padding: 12px;
	border-radius: 6px;
	margin-bottom: 16px;
	font-size: 14px;
}

.notice svg {
	flex-shrink: 0;
	width: 15px;
	height: 15px;
	margin-top: 1px;
	stroke: var(--color-accent);
	fill: none;
	stroke-width: 2;
	stroke-linecap: round;
	stroke-linejoin: round;
}

.notice p {
	font-size: 12.5px;
	color: var(--color-accent);
	line-height: 1.5;
}

/* ── Submit ── */
.btn-primary {
	width: 100%;
	padding: 11px;
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

/* ── Footer ── */
.card-footer {
	text-align: center;
	font-size: 13.5px;
	color: var(--color-text-secondary);
	margin-top: 20px;
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
@media ( max-width : 520px) {
	.card {
		padding: 32px 22px;
	}
	.field-row {
		grid-template-columns: 1fr;
	}
}
</style>
</head>
<body>

	<div style="width: 100%; max-width: 460px;">

		<!-- Brand -->
		<div class="brand">
			<div class="brand-icon">
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
				<h1 class="card-title">Open an account</h1>
				<p class="card-subtitle">Fill in your details to get started</p>
			</div>


			<%
			String error = (String) request.getAttribute("error");

			if (error != null) {
			%>

			<div class="error-box">
				<%=error%>
			</div>

			<%
			}
			%>

			<form action="signup" method="post">

				<!-- Personal Information -->
				<p class="section-label">Personal Information</p>

				<div class="input-group">
					<label for="username">Username</label> <input type="text"
						id="username" name="username" placeholder="Enter a username"
						required autocomplete="username">
				</div>

				<div class="input-group">
					<label for="email">Email address</label> <input type="email"
						id="email" name="email" placeholder="you@example.com" required
						autocomplete="email">
				</div>

				<div class="input-group">
					<label for="password">Password</label> <input type="password"
						id="password" name="password" placeholder="Create a password"
						required autocomplete="new-password">
				</div>

				<!-- Account Details -->
				<p class="section-label">Account Details</p>

				<div class="field-row">
					<div class="input-group">
						<label for="balance">Opening Balance</label> <input type="number"
							id="balance" name="balance" step="0.01" placeholder="0.00"
							required min="1" max="100000">
					</div>

					<div class="input-group" style="font-size: 15px; margin-top: 20px;">
						Account number will be provided after sign up</div>
				</div>

				<!-- Notice -->
				<div class="notice">
					<svg viewBox="0 0 24 24">
						<circle cx="12" cy="12" r="10" />
						
						<line x1="12" y1="8" x2="12" y2="12" />
						
						<line x1="12" y1="16" x2="12.01" y2="16" /></svg>
					<p>Your account details are encrypted and stored securely.</p>
				</div>

				<button type="submit" class="btn-primary">Create Account</button>

			</form>

			<div class="divider"></div>

			<div class="card-footer">
				Already have an account? <a href="login.jsp">Sign in</a>
			</div>

		</div>

	</div>

</body>
</html>