<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SecureBank — Modern Digital Banking</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap"
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
	--color-text-primary: #0f1923;
	--color-text-secondary: #6b7280;
	--color-text-muted: #9ca3af;
	--color-accent: #1d4ed8;
	--color-accent-hover: #1e40af;
	--color-accent-light: #eff6ff;
	--color-navy: #0f172a;
	--radius-sm: 6px;
	--radius-md: 10px;
	--radius-lg: 14px;
	--shadow-card: 0 1px 3px rgba(0, 0, 0, 0.06), 0 4px 16px
		rgba(0, 0, 0, 0.07);
	--shadow-nav: 0 1px 0 rgba(0, 0, 0, 0.08);
	--font: 'Inter', sans-serif;
	--nav-height: 64px;
}

html {
	scroll-behavior: smooth;
}

body {
	background-color: var(--color-bg);
	font-family: var(--font);
	color: var(--color-text-primary);
	-webkit-font-smoothing: antialiased;
}

a {
	text-decoration: none;
	color: inherit;
}

/* ─────────────────────────────────────────
       NAVBAR
    ───────────────────────────────────────── */
.navbar {
	position: sticky;
	top: 0;
	z-index: 100;
	width: 100%;
	height: var(--nav-height);
	background: var(--color-surface);
	border-bottom: 1px solid var(--color-border);
	box-shadow: var(--shadow-nav);
	display: flex;
	align-items: center;
	padding: 0 48px;
	justify-content: space-between;
}

.nav-brand {
	display: flex;
	align-items: center;
	gap: 10px;
}

.nav-brand-icon {
	width: 32px;
	height: 32px;
	background: var(--color-accent);
	border-radius: var(--radius-sm);
	display: flex;
	align-items: center;
	justify-content: center;
	flex-shrink: 0;
}

.nav-brand-icon svg {
	width: 18px;
	height: 18px;
	fill: none;
	stroke: #fff;
	stroke-width: 2;
	stroke-linecap: round;
	stroke-linejoin: round;
}

.nav-brand-name {
	font-size: 16px;
	font-weight: 600;
	letter-spacing: -0.3px;
	color: var(--color-text-primary);
}

.nav-buttons {
	display: flex;
	align-items: center;
	gap: 10px;
}

.btn-ghost {
	padding: 8px 18px;
	border: 1px solid var(--color-border);
	border-radius: var(--radius-sm);
	background: transparent;
	color: var(--color-text-primary);
	font-size: 13.5px;
	font-weight: 500;
	font-family: var(--font);
	cursor: pointer;
	transition: background 0.15s ease, border-color 0.15s ease;
}

.btn-ghost:hover {
	background: var(--color-bg);
	border-color: #c4c9d0;
}

.btn-solid {
	padding: 8px 18px;
	border: none;
	border-radius: var(--radius-sm);
	background: var(--color-accent);
	color: #ffffff;
	font-size: 13.5px;
	font-weight: 500;
	font-family: var(--font);
	cursor: pointer;
	transition: background 0.15s ease, box-shadow 0.15s ease;
}

.btn-solid:hover {
	background: var(--color-accent-hover);
	box-shadow: 0 2px 8px rgba(29, 78, 216, 0.25);
}

/* ─────────────────────────────────────────
       HERO
    ───────────────────────────────────────── */
.hero {
	max-width: 1120px;
	margin: 0 auto;
	padding: 88px 48px 80px;
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 64px;
	align-items: center;
}

/* Left column */
.hero-left {
	display: flex;
	flex-direction: column;
	gap: 0;
}

.hero-badge {
	display: inline-flex;
	align-items: center;
	gap: 7px;
	background: var(--color-accent-light);
	border: 1px solid #bfdbfe;
	color: var(--color-accent);
	font-size: 12px;
	font-weight: 500;
	letter-spacing: 0.2px;
	padding: 5px 12px;
	border-radius: 100px;
	width: fit-content;
	margin-bottom: 24px;
}

.hero-badge svg {
	width: 12px;
	height: 12px;
	stroke: var(--color-accent);
	fill: none;
	stroke-width: 2.5;
	stroke-linecap: round;
	stroke-linejoin: round;
}

.hero-title {
	font-size: 52px;
	font-weight: 700;
	letter-spacing: -1.5px;
	line-height: 1.1;
	color: var(--color-navy);
	margin-bottom: 20px;
}

.hero-title span {
	color: var(--color-accent);
}

.hero-desc {
	font-size: 16px;
	color: var(--color-text-secondary);
	line-height: 1.75;
	max-width: 440px;
	margin-bottom: 36px;
}

.hero-actions {
	display: flex;
	gap: 12px;
	align-items: center;
}

.btn-hero-primary {
	display: inline-flex;
	align-items: center;
	gap: 8px;
	padding: 12px 24px;
	border: none;
	border-radius: var(--radius-sm);
	background: var(--color-accent);
	color: #ffffff;
	font-size: 14px;
	font-weight: 500;
	font-family: var(--font);
	cursor: pointer;
	transition: background 0.15s ease, box-shadow 0.15s ease;
}

.btn-hero-primary svg {
	width: 15px;
	height: 15px;
	stroke: #fff;
	fill: none;
	stroke-width: 2;
	stroke-linecap: round;
	stroke-linejoin: round;
}

.btn-hero-primary:hover {
	background: var(--color-accent-hover);
	box-shadow: 0 3px 10px rgba(29, 78, 216, 0.28);
}

.btn-hero-secondary {
	display: inline-flex;
	align-items: center;
	gap: 8px;
	padding: 12px 24px;
	border: 1px solid var(--color-border);
	border-radius: var(--radius-sm);
	background: var(--color-surface);
	color: var(--color-text-primary);
	font-size: 14px;
	font-weight: 500;
	font-family: var(--font);
	cursor: pointer;
	transition: background 0.15s ease, border-color 0.15s ease;
}

.btn-hero-secondary:hover {
	background: var(--color-bg);
	border-color: #c4c9d0;
}

/* Trust strip */
.trust-strip {
	margin-top: 40px;
	display: flex;
	align-items: center;
	gap: 20px;
}

.trust-item {
	display: flex;
	align-items: center;
	gap: 6px;
	font-size: 12.5px;
	color: var(--color-text-muted);
}

.trust-item svg {
	width: 14px;
	height: 14px;
	stroke: #22c55e;
	fill: none;
	stroke-width: 2.5;
	stroke-linecap: round;
	stroke-linejoin: round;
	flex-shrink: 0;
}

.trust-divider {
	width: 1px;
	height: 14px;
	background: var(--color-border);
}

/* ── Right: terminal card ── */
.hero-right {
	display: flex;
	flex-direction: column;
	gap: 16px;
}

.terminal-card {
	background: var(--color-navy);
	border-radius: var(--radius-lg);
	overflow: hidden;
	box-shadow: 0 8px 32px rgba(0, 0, 0, 0.16);
}

.terminal-topbar {
	display: flex;
	align-items: center;
	gap: 8px;
	padding: 13px 16px;
	background: rgba(255, 255, 255, 0.05);
	border-bottom: 1px solid rgba(255, 255, 255, 0.07);
}

.dot {
	width: 12px;
	height: 12px;
	border-radius: 50%;
	flex-shrink: 0;
}

.dot-red {
	background: #ff5f57;
}

.dot-yellow {
	background: #febc2e;
}

.dot-green {
	background: #28c840;
}

.terminal-label {
	margin-left: 6px;
	font-size: 12px;
	color: rgba(255, 255, 255, 0.35);
	font-family: 'SF Mono', 'Fira Code', monospace;
	letter-spacing: 0.2px;
}

.terminal-body {
	padding: 24px;
	font-family: 'SF Mono', 'Fira Code', 'Consolas', monospace;
	font-size: 13px;
	line-height: 1.9;
}

.t-comment {
	color: #4b5563;
}

.t-key {
	color: #93c5fd;
}

.t-string {
	color: #6ee7b7;
}

.t-number {
	color: #fde68a;
}

.t-label {
	color: #c4b5fd;
}

.t-dim {
	color: rgba(255, 255, 255, 0.25);
}

.t-white {
	color: rgba(255, 255, 255, 0.80);
}

.t-green {
	color: #34d399;
}

/* Mini stat cards below the terminal */
.stat-row {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 12px;
}

.stat-card {
	background: var(--color-surface);
	border: 1px solid var(--color-border);
	border-radius: var(--radius-md);
	padding: 18px 20px;
	box-shadow: var(--shadow-card);
}

.stat-card-label {
	font-size: 11.5px;
	color: var(--color-text-muted);
	font-weight: 500;
	letter-spacing: 0.2px;
	margin-bottom: 6px;
	display: flex;
	align-items: center;
	gap: 6px;
}

.stat-card-label svg {
	width: 13px;
	height: 13px;
	stroke: var(--color-text-muted);
	fill: none;
	stroke-width: 2;
	stroke-linecap: round;
	stroke-linejoin: round;
}

.stat-card-value {
	font-size: 22px;
	font-weight: 600;
	letter-spacing: -0.5px;
	color: var(--color-text-primary);
}

.stat-card-sub {
	font-size: 11.5px;
	color: #22c55e;
	font-weight: 500;
	margin-top: 3px;
}

/* ─────────────────────────────────────────
       FEATURES
    ───────────────────────────────────────── */
.features-section {
	max-width: 1120px;
	margin: 0 auto;
	padding: 0 48px 96px;
}

.section-header {
	margin-bottom: 36px;
}

.section-eyebrow {
	font-size: 11.5px;
	font-weight: 600;
	letter-spacing: 0.8px;
	text-transform: uppercase;
	color: var(--color-accent);
	margin-bottom: 10px;
}

.section-title {
	font-size: 28px;
	font-weight: 600;
	letter-spacing: -0.5px;
	color: var(--color-navy);
}

.features-grid {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 18px;
}

.feature-card {
	background: var(--color-surface);
	border: 1px solid var(--color-border);
	border-radius: var(--radius-lg);
	padding: 28px 26px;
	box-shadow: var(--shadow-card);
	transition: box-shadow 0.2s ease, border-color 0.2s ease;
}

.feature-card:hover {
	box-shadow: 0 4px 24px rgba(0, 0, 0, 0.10);
	border-color: #d0d7de;
}

.feature-icon {
	width: 40px;
	height: 40px;
	border-radius: var(--radius-sm);
	background: var(--color-accent-light);
	display: flex;
	align-items: center;
	justify-content: center;
	margin-bottom: 18px;
}

.feature-icon svg {
	width: 19px;
	height: 19px;
	stroke: var(--color-accent);
	fill: none;
	stroke-width: 2;
	stroke-linecap: round;
	stroke-linejoin: round;
}

.feature-title {
	font-size: 15px;
	font-weight: 600;
	color: var(--color-text-primary);
	margin-bottom: 8px;
	letter-spacing: -0.2px;
}

.feature-desc {
	font-size: 13.5px;
	color: var(--color-text-secondary);
	line-height: 1.65;
}

/* ─────────────────────────────────────────
       RESPONSIVE
    ───────────────────────────────────────── */
@media ( max-width : 960px) {
	.hero {
		grid-template-columns: 1fr;
		padding: 60px 32px 56px;
		gap: 48px;
	}
	.hero-title {
		font-size: 40px;
	}
	.features-section {
		padding: 0 32px 72px;
	}
	.features-grid {
		grid-template-columns: 1fr 1fr;
	}
}

@media ( max-width : 640px) {
	.navbar {
		padding: 0 20px;
	}
	.hero {
		padding: 48px 20px 48px;
	}
	.hero-title {
		font-size: 34px;
	}
	.hero-actions {
		flex-direction: column;
		align-items: flex-start;
	}
	.btn-hero-primary, .btn-hero-secondary {
		width: 100%;
		justify-content: center;
	}
	.trust-strip {
		flex-wrap: wrap;
		gap: 10px;
	}
	.trust-divider {
		display: none;
	}
	.features-section {
		padding: 0 20px 60px;
	}
	.features-grid {
		grid-template-columns: 1fr;
	}
	.stat-row {
		grid-template-columns: 1fr 1fr;
	}
}
</style>
</head>
<body>

	<!-- ── Navbar ── -->
	<nav class="navbar">

		<div class="nav-brand">
			<div class="nav-brand-icon">
				<svg viewBox="0 0 24 24">
					<path
						d="M12 2L3 7v5c0 5.25 3.75 10.15 9 11.25C17.25 22.15 21 17.25 21 12V7L12 2z" /></svg>
			</div>
			<span class="nav-brand-name">SecureBank</span>
		</div>

		<div class="nav-buttons">
			<a href="login.jsp"><button class="btn-ghost">Login</button></a> <a
				href="signup.jsp"><button class="btn-solid">Signup</button></a>
		</div>

	</nav>

	<!-- ── Hero ── -->
	<section class="hero">

		<div class="hero-left">

			<div class="hero-badge">
				<svg viewBox="0 0 24 24">
					<polyline points="20 6 9 17 4 12" /></svg>
				Java &middot; Servlets &middot; JSP &middot; JDBC &middot; MySQL
			</div>

			<h1 class="hero-title">
				Modern<br> <span>Digital</span><br> Banking
			</h1>

			<p class="hero-desc">Manage your accounts with secure
				authentication, real-time balance tracking, full transaction
				history, and a clean personal dashboard.</p>

			<div class="hero-actions">

				<a href="./dashboard">
					<button class="btn-hero-primary">
						<svg viewBox="0 0 24 24">
							<rect x="3" y="3" width="7" height="7" />
							<rect x="14" y="3" width="7" height="7" />
							<rect x="14" y="14" width="7" height="7" />
							<rect x="3" y="14" width="7" height="7" /></svg>
						Go to Dashboard
					</button>
				</a> <a href="#features">
					<button class="btn-hero-secondary">Explore Features</button>
				</a>

			</div>

			<div class="trust-strip">
				<div class="trust-item">
					<svg viewBox="0 0 24 24">
						<polyline points="20 6 9 17 4 12" /></svg>
					Session-secured
				</div>
				<div class="trust-divider"></div>
				<div class="trust-item">
					<svg viewBox="0 0 24 24">
						<polyline points="20 6 9 17 4 12" /></svg>
					JDBC-backed
				</div>
				<div class="trust-divider"></div>
				<div class="trust-item">
					<svg viewBox="0 0 24 24">
						<polyline points="20 6 9 17 4 12" /></svg>
					MySQL persistent
				</div>
			</div>

		</div>


		<div class="hero-right">

			<!-- Terminal card -->
			<div class="terminal-card">

				<div class="terminal-topbar">
					<div class="dot dot-red"></div>
					<div class="dot dot-yellow"></div>
					<div class="dot dot-green"></div>
					<span class="terminal-label">account_summary.json</span>
				</div>

				<div class="terminal-body">
					<span class="t-dim">{</span><br> &nbsp;&nbsp;<span
						class="t-key">"account"</span><span class="t-dim">:</span> <span
						class="t-dim">{</span><br> &nbsp;&nbsp;&nbsp;&nbsp;<span
						class="t-key">"holder"</span><span class="t-dim">:</span> <span
						class="t-string">"Alex Morgan"</span><span class="t-dim">,</span><br>
					&nbsp;&nbsp;&nbsp;&nbsp;<span class="t-key">"account_number"</span><span
						class="t-dim">:</span> <span class="t-string">"SB-7841-0032"</span><span
						class="t-dim">,</span><br> &nbsp;&nbsp;&nbsp;&nbsp;<span
						class="t-key">"balance"</span><span class="t-dim">:</span> <span
						class="t-number">24850.00</span><span class="t-dim">,</span><br>
					&nbsp;&nbsp;&nbsp;&nbsp;<span class="t-key">"currency"</span><span
						class="t-dim">:</span> <span class="t-string">"USD"</span><br>
					&nbsp;&nbsp;<span class="t-dim">},</span><br> &nbsp;&nbsp;<span
						class="t-key">"last_transaction"</span><span class="t-dim">:</span>
					<span class="t-dim">{</span><br> &nbsp;&nbsp;&nbsp;&nbsp;<span
						class="t-key">"type"</span><span class="t-dim">:</span> <span
						class="t-string">"DEPOSIT"</span><span class="t-dim">,</span><br>
					&nbsp;&nbsp;&nbsp;&nbsp;<span class="t-key">"amount"</span><span
						class="t-dim">:</span> <span class="t-number">1200.00</span><span
						class="t-dim">,</span><br> &nbsp;&nbsp;&nbsp;&nbsp;<span
						class="t-key">"status"</span><span class="t-dim">:</span> <span
						class="t-green">"SUCCESS"</span><br> &nbsp;&nbsp;<span
						class="t-dim">}</span><br> <span class="t-dim">}</span>
				</div>

			</div>

			<!-- Stat cards -->
			<div class="stat-row">

				<div class="stat-card">
					<div class="stat-card-label">
						<svg viewBox="0 0 24 24">
							<line x1="12" y1="1" x2="12" y2="23" />
							<path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6" /></svg>
						Current Balance
					</div>
					<div class="stat-card-value">$24,850</div>
					<div class="stat-card-sub">+$1,200 today</div>
				</div>

				<div class="stat-card">
					<div class="stat-card-label">
						<svg viewBox="0 0 24 24">
							<polyline points="22 12 18 12 15 21 9 3 6 12 2 12" /></svg>
						Transactions
					</div>
					<div class="stat-card-value">138</div>
					<div class="stat-card-sub">All time</div>
				</div>

			</div>

		</div>

	</section>


	<!-- ── Features ── -->
	<section class="features-section" id="features">

		<div class="section-header">
			<p class="section-eyebrow">Platform Features</p>
			<h2 class="section-title">Everything you need to manage your
				finances</h2>
		</div>

		<div class="features-grid">

			<div class="feature-card">
				<div class="feature-icon">
					<svg viewBox="0 0 24 24">
						<rect x="3" y="11" width="18" height="11" rx="2" ry="2" />
						<path d="M7 11V7a5 5 0 0 1 10 0v4" /></svg>
				</div>
				<h3 class="feature-title">Secure Authentication</h3>
				<p class="feature-desc">Session-based login with servlet-driven
					backend and JDBC-verified credentials stored in MySQL.</p>
			</div>

			<div class="feature-card">
				<div class="feature-icon">
					<svg viewBox="0 0 24 24">
						<line x1="12" y1="1" x2="12" y2="23" />
						<path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6" /></svg>
				</div>
				<h3 class="feature-title">Transaction Handling</h3>
				<p class="feature-desc">Deposit and withdraw funds with
					real-time balance updates backed by atomic database operations.</p>
			</div>

			<div class="feature-card">
				<div class="feature-icon">
					<svg viewBox="0 0 24 24">
						<rect x="3" y="3" width="7" height="7" />
						<rect x="14" y="3" width="7" height="7" />
						<rect x="14" y="14" width="7" height="7" />
						<rect x="3" y="14" width="7" height="7" /></svg>
				</div>
				<h3 class="feature-title">User Dashboard</h3>
				<p class="feature-desc">A dynamic personal dashboard displaying
					live account balance, profile details, and full transaction
					history.</p>
			</div>

		</div>

	</section>

</body>
</html>