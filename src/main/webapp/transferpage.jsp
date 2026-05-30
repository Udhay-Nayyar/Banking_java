<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Transfer Funds — SecureBank</title>
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
	--color-accent-border: #bfdbfe;
	--color-navy: #0f172a;
	--color-green: #16a34a;
	--color-green-light: #f0fdf4;
	--color-green-border: #bbf7d0;
	--color-amber: #d97706;
	--color-amber-light: #fffbeb;
	--color-amber-border: #fde68a;
	--radius-sm: 6px;
	--radius-md: 10px;
	--radius-lg: 14px;
	--shadow-card: 0 1px 3px rgba(0, 0, 0, 0.06), 0 4px 16px
		rgba(0, 0, 0, 0.07);
	--font: 'Inter', sans-serif;
	--nav-height: 64px;
}

body {
	min-height: 100vh;
	background-color: var(--color-bg);
	font-family: var(--font);
	color: var(--color-text-primary);
	-webkit-font-smoothing: antialiased;
	display: flex;
	flex-direction: column;
}

a {
	text-decoration: none;
	color: inherit;
}

/* ─────────────────────────────────────────
       NAVBAR
    ───────────────────────────────────────── */
.navbar {
	width: 100%;
	height: var(--nav-height);
	background: var(--color-surface);
	border-bottom: 1px solid var(--color-border);
	display: flex;
	align-items: center;
	padding: 0 40px;
	justify-content: space-between;
	flex-shrink: 0;
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
}

.nav-brand-icon svg {
	width: 17px;
	height: 17px;
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
}

.nav-back {
	display: inline-flex;
	align-items: center;
	gap: 7px;
	padding: 7px 14px;
	font-size: 13px;
	font-weight: 500;
	color: var(--color-text-secondary);
	border: 1px solid var(--color-border);
	border-radius: var(--radius-sm);
	background: transparent;
	cursor: pointer;
	font-family: var(--font);
	transition: background 0.15s ease, border-color 0.15s ease;
}

.nav-back svg {
	width: 14px;
	height: 14px;
	stroke: currentColor;
	fill: none;
	stroke-width: 2;
	stroke-linecap: round;
	stroke-linejoin: round;
}

.nav-back:hover {
	background: var(--color-bg);
	border-color: #c4c9d0;
}

/* ─────────────────────────────────────────
       PAGE BODY
    ───────────────────────────────────────── */
.page-body {
	flex: 1;
	display: flex;
	align-items: flex-start;
	justify-content: center;
	padding: 48px 16px 72px;
}

.page-grid {
	width: 100%;
	max-width: 860px;
	display: grid;
	grid-template-columns: 1fr 340px;
	gap: 24px;
	align-items: start;
}

/* ─────────────────────────────────────────
       MAIN CARD
    ───────────────────────────────────────── */
.card {
	background: var(--color-surface);
	border: 1px solid var(--color-border);
	border-radius: var(--radius-lg);
	box-shadow: var(--shadow-card);
	overflow: hidden;
}

.card-accent-bar {
	height: 3px;
	background: var(--color-accent);
}

.card-inner {
	padding: 36px 32px 32px;
}

/* ── Card header ── */
.card-header {
	display: flex;
	align-items: flex-start;
	gap: 14px;
	margin-bottom: 32px;
}

.card-header-icon {
	width: 44px;
	height: 44px;
	border-radius: var(--radius-sm);
	background: var(--color-accent-light);
	border: 1px solid var(--color-accent-border);
	display: flex;
	align-items: center;
	justify-content: center;
	flex-shrink: 0;
}

.card-header-icon svg {
	width: 20px;
	height: 20px;
	stroke: var(--color-accent);
	fill: none;
	stroke-width: 2;
	stroke-linecap: round;
	stroke-linejoin: round;
}

.card-title {
	font-size: 18px;
	font-weight: 600;
	letter-spacing: -0.3px;
	color: var(--color-navy);
	margin-bottom: 3px;
}

.card-subtitle {
	font-size: 13px;
	color: var(--color-text-muted);
	line-height: 1.5;
}

/* ── Section divider ── */
.form-section-label {
	font-size: 11px;
	font-weight: 600;
	letter-spacing: 0.7px;
	text-transform: uppercase;
	color: var(--color-text-muted);
	margin-bottom: 14px;
	margin-top: 28px;
	padding-bottom: 10px;
	border-bottom: 1px solid var(--color-border);
}

.form-section-label:first-of-type {
	margin-top: 0;
}

/* ── Input group ── */
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

.input-group .label-row {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-bottom: 6px;
}

.input-group .label-row label {
	margin-bottom: 0;
}

.input-group .label-hint {
	font-size: 11.5px;
	color: var(--color-text-muted);
}

.input-wrapper {
	position: relative;
}

.input-prefix {
	position: absolute;
	left: 13px;
	top: 50%;
	transform: translateY(-50%);
	font-size: 14px;
	font-weight: 500;
	color: var(--color-text-muted);
	pointer-events: none;
	user-select: none;
}

.input-icon {
	position: absolute;
	right: 12px;
	top: 50%;
	transform: translateY(-50%);
	pointer-events: none;
}

.input-icon svg {
	width: 15px;
	height: 15px;
	stroke: var(--color-text-muted);
	fill: none;
	stroke-width: 2;
	stroke-linecap: round;
	stroke-linejoin: round;
	display: block;
}

.input-group input, .input-group textarea {
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

.input-group input.has-prefix {
	padding-left: 28px;
}

.input-group input.has-icon {
	padding-right: 36px;
}

.input-group input[type="number"] {
	-moz-appearance: textfield;
}

.input-group input[type="number"]::-webkit-inner-spin-button,
	.input-group input[type="number"]::-webkit-outer-spin-button {
	-webkit-appearance: none;
}

.input-group input::placeholder, .input-group textarea::placeholder {
	color: var(--color-text-muted);
}

.input-group input:focus, .input-group textarea:focus {
	border-color: var(--color-border-focus);
	box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.10);
}

.input-group textarea {
	resize: vertical;
	min-height: 82px;
	line-height: 1.55;
}

.input-hint {
	margin-top: 5px;
	font-size: 12px;
	color: var(--color-text-muted);
}

/* ── From account display ── */
.from-account-display {
	width: 100%;
	padding: 10px 13px;
	font-size: 14px;
	font-family: var(--font);
	color: var(--color-text-secondary);
	background: #f8fafc;
	border: 1px solid var(--color-border);
	border-radius: var(--radius-sm);
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.from-account-display .acct-number {
	font-weight: 500;
	color: var(--color-text-primary);
	letter-spacing: 0.3px;
}

.from-account-display .acct-badge {
	font-size: 11px;
	font-weight: 500;
	background: var(--color-green-light);
	color: var(--color-green);
	border: 1px solid var(--color-green-border);
	border-radius: 100px;
	padding: 2px 9px;
}

/* ── Transfer arrow ── */
.transfer-arrow {
	display: flex;
	align-items: center;
	justify-content: center;
	margin: 20px 0 4px;
}

.transfer-arrow-inner {
	width: 32px;
	height: 32px;
	background: var(--color-accent-light);
	border: 1px solid var(--color-accent-border);
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
}

.transfer-arrow-inner svg {
	width: 15px;
	height: 15px;
	stroke: var(--color-accent);
	fill: none;
	stroke-width: 2.5;
	stroke-linecap: round;
	stroke-linejoin: round;
}

/* ── Warning notice ── */
.notice {
	display: flex;
	align-items: flex-start;
	gap: 10px;
	border-radius: var(--radius-sm);
	padding: 11px 14px;
	margin-bottom: 24px;
}

.notice svg {
	flex-shrink: 0;
	width: 15px;
	height: 15px;
	margin-top: 1px;
	fill: none;
	stroke-width: 2;
	stroke-linecap: round;
	stroke-linejoin: round;
}

.notice p {
	font-size: 12.5px;
	line-height: 1.55;
}

.notice.amber {
	background: var(--color-amber-light);
	border: 1px solid var(--color-amber-border);
}

.notice.amber svg {
	stroke: var(--color-amber);
}

.notice.amber p {
	color: #92400e;
}

/* ── Submit ── */
.btn-transfer {
	width: 100%;
	padding: 12px;
	border: none;
	background: var(--color-accent);
	color: #ffffff;
	font-size: 14px;
	font-weight: 500;
	font-family: var(--font);
	letter-spacing: 0.1px;
	border-radius: var(--radius-sm);
	cursor: pointer;
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 8px;
	transition: background 0.15s ease, box-shadow 0.15s ease;
}

.btn-transfer svg {
	width: 15px;
	height: 15px;
	stroke: #fff;
	fill: none;
	stroke-width: 2;
	stroke-linecap: round;
	stroke-linejoin: round;
}

.btn-transfer:hover {
	background: var(--color-accent-hover);
	box-shadow: 0 2px 8px rgba(29, 78, 216, 0.28);
}

.btn-transfer:active {
	background: var(--color-accent-hover);
	box-shadow: none;
}

.cancel-row {
	text-align: center;
	margin-top: 14px;
}

.cancel-link {
	font-size: 13px;
	color: var(--color-text-muted);
	transition: color 0.15s ease;
}

.cancel-link:hover {
	color: var(--color-text-secondary);
	text-decoration: underline;
}

/* ─────────────────────────────────────────
       SIDE PANEL
    ───────────────────────────────────────── */
.side-panel {
	display: flex;
	flex-direction: column;
	gap: 16px;
}

/* Balance card */
.side-card {
	background: var(--color-surface);
	border: 1px solid var(--color-border);
	border-radius: var(--radius-lg);
	box-shadow: var(--shadow-card);
	padding: 22px 22px 20px;
}

.side-card-label {
	font-size: 11.5px;
	font-weight: 600;
	letter-spacing: 0.5px;
	text-transform: uppercase;
	color: var(--color-text-muted);
	margin-bottom: 14px;
	display: flex;
	align-items: center;
	gap: 7px;
}

.side-card-label svg {
	width: 13px;
	height: 13px;
	stroke: var(--color-text-muted);
	fill: none;
	stroke-width: 2;
	stroke-linecap: round;
	stroke-linejoin: round;
}

.balance-display {
	font-size: 30px;
	font-weight: 700;
	letter-spacing: -1px;
	color: var(--color-navy);
	margin-bottom: 4px;
}

.balance-sub {
	font-size: 12px;
	color: var(--color-text-muted);
}

.balance-divider {
	height: 1px;
	background: var(--color-border);
	margin: 16px 0;
}

.balance-after-row {
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.balance-after-label {
	font-size: 12.5px;
	color: var(--color-text-muted);
}

.balance-after-value {
	font-size: 14px;
	font-weight: 600;
	color: var(--color-text-primary);
	letter-spacing: -0.2px;
}

/* Tips card */
.tips-list {
	display: flex;
	flex-direction: column;
	gap: 12px;
}

.tip-item {
	display: flex;
	align-items: flex-start;
	gap: 10px;
}

.tip-dot {
	width: 6px;
	height: 6px;
	border-radius: 50%;
	background: var(--color-accent);
	margin-top: 6px;
	flex-shrink: 0;
}

.tip-text {
	font-size: 12.5px;
	color: var(--color-text-secondary);
	line-height: 1.55;
}
.error-box{
    background:#ffe5e5;
    color:#d32f2f;
    border:1px solid #ffb3b3;
    padding:12px;
    border-radius:6px;
    margin-bottom:15px;
}

/* ─────────────────────────────────────────
       RESPONSIVE
    ───────────────────────────────────────── */
@media ( max-width : 820px) {
	.page-grid {
		grid-template-columns: 1fr;
		max-width: 520px;
	}
	.side-panel {
		display: grid;
		grid-template-columns: 1fr 1fr;
		gap: 14px;
	}
}

@media ( max-width : 540px) {
	.navbar {
		padding: 0 20px;
	}
	.page-body {
		padding: 32px 16px 56px;
	}
	.card-inner {
		padding: 28px 22px 24px;
	}
	.side-panel {
		grid-template-columns: 1fr;
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

		<a href="dashboard">
			<button class="nav-back">
				<svg viewBox="0 0 24 24">
					<polyline points="15 18 9 12 15 6" /></svg>
				Back to Dashboard
			</button>
		</a>
	</nav>


	<!-- ── Page body ── -->
	<div class="page-body">
		<div class="page-grid">

			<!-- ── Main form card ── -->
			<div class="card">

				<div class="card-accent-bar"></div>

				<div class="card-inner">

					<!-- Header -->
					<div class="card-header">
						<div class="card-header-icon">
							<svg viewBox="0 0 24 24">
								<line x1="22" y1="2" x2="11" y2="13" />
								<polygon points="22 2 15 22 11 13 2 9 22 2" /></svg>
						</div>
						<div>
							<h1 class="card-title">Transfer Funds</h1>
							<p class="card-subtitle">Send money securely to another
								account</p>
						</div>
					</div>

					<%
					String error = (String) session.getAttribute("error");

					if (error != null) {
					%>

					<div class="error-box">
						<%=error%>
					</div>

					<%
					session.removeAttribute("error");
					}
					%>

					<form action="transfer" method="post">

						<!-- From section -->
						<p class="form-section-label">From</p>

						<div class="input-group">
							<label>Your Account</label>
							<div class="from-account-display">
								<span class="acct-number"><%=request.getAttribute("account_number")%></span>
								<span class="acct-badge">Your Account</span>
							</div>
							<!-- Hidden field so the servlet knows the sender -->
							<input type="hidden" name="from_account"
								value="<%=request.getAttribute("account_number")%>">
						</div>

						<!-- Arrow -->
						<div class="transfer-arrow">
							<div class="transfer-arrow-inner">
								<svg viewBox="0 0 24 24">
									<line x1="12" y1="5" x2="12" y2="19" />
									<polyline points="19 12 12 19 5 12" /></svg>
							</div>
						</div>

						<!-- To section -->
						<p class="form-section-label">To</p>

						<div class="input-group">
							<label for="to_account">Recipient Account Number</label>
							<div class="input-wrapper">
								<input type="text" id="to_account" name="to_account"
									class="has-icon" placeholder="Enter recipient account number"
									required autocomplete="off">
								<div class="input-icon">
									<svg viewBox="0 0 24 24">
										<path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2" />
										<circle cx="12" cy="7" r="4" /></svg>
								</div>
							</div>
							<p class="input-hint">Double-check the account number before
								confirming.</p>
						</div>

						<!-- Transfer details section -->
						<p class="form-section-label">Transfer Details</p>

						<div class="input-group">
							<div class="label-row">
								<label for="amount">Amount</label> <span class="label-hint">Max
									&#8377;<%=request.getAttribute("balance")%></span>
							</div>
							<div class="input-wrapper">
								<span class="input-prefix">&#8377;</span> <input type="number"
									id="amount" name="amount" class="has-prefix" min="1"
									max="<%=request.getAttribute("balance")%>" placeholder="0.00"
									required oninput="updateBalanceAfter(this.value)">
							</div>
							<p class="input-hint">
								Min &#8377;1 &nbsp;&middot;&nbsp; Max &#8377;<%=request.getAttribute("balance")%></p>
						</div>

						<div class="input-group">
							<label for="note">Note <span
								style="color: var(--color-text-muted); font-weight: 400;">(optional)</span></label>
							<textarea id="note" name="note"
								placeholder="e.g. Rent for May, Shared dinner, etc."></textarea>
						</div>

						<!-- Warning -->
						<div class="notice amber" style="margin-top: 4px;">
							<svg viewBox="0 0 24 24">
								<path
									d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z" />
								<line x1="12" y1="9" x2="12" y2="13" />
								<line x1="12" y1="17" x2="12.01" y2="17" /></svg>
							<p>Transfers are processed immediately and cannot be
								reversed. Verify the recipient account number carefully.</p>
						</div>

						<button type="submit" class="btn-transfer">
							<svg viewBox="0 0 24 24">
								<line x1="22" y1="2" x2="11" y2="13" />
								<polygon points="22 2 15 22 11 13 2 9 22 2" /></svg>
							Confirm Transfer
						</button>

					</form>

					<div class="cancel-row">
						<a href="dashboard" class="cancel-link">Cancel and go back</a>
					</div>

				</div>
			</div>


			<!-- ── Side panel ── -->
			<div class="side-panel">

				<!-- Balance card -->
				<div class="side-card">
					<p class="side-card-label">
						<svg viewBox="0 0 24 24">
							<line x1="12" y1="1" x2="12" y2="23" />
							<path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6" /></svg>
						Available Balance
					</p>
					<p class="balance-display">
						&#8377;<%=request.getAttribute("balance")%></p>
					<p class="balance-sub">Current account balance</p>

					<div class="balance-divider"></div>

					<div class="balance-after-row">
						<span class="balance-after-label">Balance after transfer</span> <span
							class="balance-after-value" id="balance-after">&#8377;<%=request.getAttribute("balance")%></span>
					</div>
				</div>

				<!-- Tips card -->
				<div class="side-card">
					<p class="side-card-label">
						<svg viewBox="0 0 24 24">
							<circle cx="12" cy="12" r="10" />
							<line x1="12" y1="8" x2="12" y2="12" />
							<line x1="12" y1="16" x2="12.01" y2="16" /></svg>
						Before You Transfer
					</p>
					<div class="tips-list">
						<div class="tip-item">
							<div class="tip-dot"></div>
							<p class="tip-text">Always verify the recipient's account
								number before submitting.</p>
						</div>
						<div class="tip-item">
							<div class="tip-dot"></div>
							<p class="tip-text">Transfers are instant and cannot be
								reversed once confirmed.</p>
						</div>
						<div class="tip-item">
							<div class="tip-dot"></div>
							<p class="tip-text">You cannot transfer more than your
								available balance.</p>
						</div>
						<div class="tip-item">
							<div class="tip-dot"></div>
							<p class="tip-text">Contact support immediately if you make
								an incorrect transfer.</p>
						</div>
					</div>
				</div>

			</div>

		</div>
	</div>


	<script>
        const currentBalance = parseFloat('<%=request.getAttribute("balance")%>') || 0;

        function updateBalanceAfter(value) {
            const amount  = parseFloat(value) || 0;
            const after   = currentBalance - amount;
            const el      = document.getElementById('balance-after');

            if (amount <= 0 || amount > currentBalance) {
                el.textContent = '\u20B9' + currentBalance.toLocaleString('en-IN', { minimumFractionDigits: 2, maximumFractionDigits: 2 });
                el.style.color = '';
            } else {
                el.textContent = '\u20B9' + after.toLocaleString('en-IN', { minimumFractionDigits: 2, maximumFractionDigits: 2 });
                el.style.color = after < 500 ? '#d97706' : 'var(--color-text-primary)';
            }
        }
    </script>

</body>
</html>