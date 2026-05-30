<%@ page import="java.util.ArrayList"%>
<%@ page import="com.app.model.Transaction"%>

<%
ArrayList<Transaction> transactions = (ArrayList<Transaction>) request.getAttribute("transactions");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dashboard — SecureBank</title>
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
	--color-green: #16a34a;
	--color-green-light: #f0fdf4;
	--color-red: #dc2626;
	--color-red-light: #fef2f2;
	--radius-sm: 6px;
	--radius-md: 10px;
	--radius-lg: 14px;
	--shadow-card: 0 1px 3px rgba(0, 0, 0, 0.06), 0 4px 16px
		rgba(0, 0, 0, 0.07);
	--font: 'Inter', sans-serif;
	--nav-height: 64px;
}

body {
	background-color: var(--color-bg);
	font-family: var(--font);
	color: var(--color-text-primary);
	-webkit-font-smoothing: antialiased;
	min-height: 100vh;
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
	display: flex;
	align-items: center;
	padding: 0 40px;
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

.nav-right {
	display: flex;
	align-items: center;
	gap: 16px;
}

.nav-user {
	display: flex;
	align-items: center;
	gap: 8px;
	font-size: 13.5px;
	color: var(--color-text-secondary);
}

.nav-avatar {
	width: 30px;
	height: 30px;
	border-radius: 50%;
	background: var(--color-accent-light);
	border: 1px solid #bfdbfe;
	display: flex;
	align-items: center;
	justify-content: center;
}

.nav-avatar svg {
	width: 15px;
	height: 15px;
	stroke: var(--color-accent);
	fill: none;
	stroke-width: 2;
	stroke-linecap: round;
	stroke-linejoin: round;
}

.logout-btn {
	display: inline-flex;
	align-items: center;
	gap: 7px;
	padding: 7px 15px;
	background: transparent;
	color: var(--color-text-secondary);
	border: 1px solid var(--color-border);
	border-radius: var(--radius-sm);
	font-size: 13px;
	font-weight: 500;
	font-family: var(--font);
	cursor: pointer;
	transition: background 0.15s ease, color 0.15s ease, border-color 0.15s
		ease;
}

.logout-btn svg {
	width: 14px;
	height: 14px;
	stroke: currentColor;
	fill: none;
	stroke-width: 2;
	stroke-linecap: round;
	stroke-linejoin: round;
}

.logout-btn:hover {
	background: #fef2f2;
	color: var(--color-red);
	border-color: #fecaca;
}

/* ─────────────────────────────────────────
       PAGE LAYOUT
    ───────────────────────────────────────── */
.page-wrapper {
	max-width: 1080px;
	margin: 0 auto;
	padding: 36px 32px 64px;
}

.page-header {
	margin-bottom: 28px;
}

.page-title {
	font-size: 22px;
	font-weight: 600;
	letter-spacing: -0.4px;
	color: var(--color-navy);
	margin-bottom: 4px;
}

.page-subtitle {
	font-size: 13.5px;
	color: var(--color-text-muted);
}

/* ─────────────────────────────────────────
       STAT CARDS
    ───────────────────────────────────────── */
.stats-grid {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 16px;
	margin-bottom: 24px;
}

.stat-card {
	background: var(--color-surface);
	border: 1px solid var(--color-border);
	border-radius: var(--radius-lg);
	padding: 22px 24px;
	box-shadow: var(--shadow-card);
}

.stat-card-header {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-bottom: 14px;
}

.stat-card-label {
	font-size: 12px;
	font-weight: 500;
	letter-spacing: 0.2px;
	color: var(--color-text-muted);
	text-transform: uppercase;
}

.stat-card-icon {
	width: 32px;
	height: 32px;
	border-radius: var(--radius-sm);
	background: var(--color-accent-light);
	display: flex;
	align-items: center;
	justify-content: center;
}

.stat-card-icon svg {
	width: 15px;
	height: 15px;
	stroke: var(--color-accent);
	fill: none;
	stroke-width: 2;
	stroke-linecap: round;
	stroke-linejoin: round;
}

.stat-card-value {
	font-size: 24px;
	font-weight: 600;
	letter-spacing: -0.5px;
	color: var(--color-text-primary);
	line-height: 1;
}

.stat-card-value.balance {
	color: var(--color-navy);
}

/* ─────────────────────────────────────────
       ACTION BUTTONS
    ───────────────────────────────────────── */
.actions-row {
	display: flex;
	gap: 10px;
	margin-bottom: 32px;
}

.action-btn {
	display: inline-flex;
	align-items: center;
	gap: 8px;
	padding: 10px 20px;
	border-radius: var(--radius-sm);
	font-size: 13.5px;
	font-weight: 500;
	font-family: var(--font);
	cursor: pointer;
	transition: background 0.15s ease, box-shadow 0.15s ease, border-color
		0.15s ease;
	text-decoration: none;
}

.action-btn svg {
	width: 15px;
	height: 15px;
	stroke: currentColor;
	fill: none;
	stroke-width: 2;
	stroke-linecap: round;
	stroke-linejoin: round;
}

.action-btn-primary {
	background: var(--color-accent);
	color: #ffffff;
	border: 1px solid transparent;
}

.action-btn-primary:hover {
	background: var(--color-accent-hover);
	box-shadow: 0 2px 8px rgba(29, 78, 216, 0.25);
}

.action-btn-outline {
	background: var(--color-surface);
	color: var(--color-text-primary);
	border: 1px solid var(--color-border);
}

.action-btn-outline:hover {
	background: var(--color-bg);
	border-color: #c4c9d0;
}

/* ─────────────────────────────────────────
       TRANSACTION TABLE
    ───────────────────────────────────────── */
.table-section {
	background: var(--color-surface);
	border: 1px solid var(--color-border);
	border-radius: var(--radius-lg);
	box-shadow: var(--shadow-card);
	overflow: hidden;
}

.table-header {
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 18px 24px;
	border-bottom: 1px solid var(--color-border);
}

.tx-badge {
	min-width: 95px;
	justify-content: center;
}

.tx-date {
	white-space: nowrap;
}

.tx-amount {
	font-weight: 700;
}

.table-title {
	font-size: 14px;
	font-weight: 600;
	color: var(--color-text-primary);
	letter-spacing: -0.1px;
}

.table-meta {
	font-size: 12.5px;
	color: var(--color-text-muted);
}

table {
	width: 100%;
	border-collapse: collapse;
}

table thead th {
	padding: 11px 24px;
	text-align: left;
	font-size: 11.5px;
	font-weight: 600;
	letter-spacing: 0.5px;
	text-transform: uppercase;
	color: var(--color-text-muted);
	background: #f8fafc;
	border-bottom: 1px solid var(--color-border);
}

table thead th:last-child {
	text-align: right;
}

table tbody td {
	padding: 14px 24px;
	font-size: 13.5px;
	color: var(--color-text-primary);
	border-bottom: 1px solid #f3f4f6;
	vertical-align: middle;
}

table tbody td:last-child {
	text-align: right;
}

table tbody tr:last-child td {
	border-bottom: none;
}

table tbody tr:hover td {
	background: #fafbfc;
}

/* Transaction type badge */
.tx-badge {
	display: inline-flex;
	align-items: center;
	gap: 6px;
	padding: 3px 10px;
	border-radius: 100px;
	font-size: 12px;
	font-weight: 500;
}

.tx-badge svg {
	width: 11px;
	height: 11px;
	stroke: currentColor;
	fill: none;
	stroke-width: 2.5;
	stroke-linecap: round;
	stroke-linejoin: round;
}

.tx-badge.deposit {
	background: var(--color-green-light);
	color: var(--color-green);
}

.tx-badge.withdraw {
	background: var(--color-red-light);
	color: var(--color-red);
}

.tx-badge.default {
	background: var(--color-accent-light);
	color: var(--color-accent);
}

/* Amount cell */
.tx-amount {
	font-size: 14px;
	font-weight: 600;
	letter-spacing: -0.2px;
}

.tx-amount.deposit {
	color: var(--color-green);
}

.tx-amount.withdraw {
	color: var(--color-red);
}

/* Date cell */
.tx-date {
	color: var(--color-text-muted);
	font-size: 13px;
}

/* Empty state */
.empty-state {
	padding: 56px 24px;
	text-align: center;
}

.empty-icon {
	width: 44px;
	height: 44px;
	border-radius: 50%;
	background: var(--color-bg);
	display: flex;
	align-items: center;
	justify-content: center;
	margin: 0 auto 14px;
}

.empty-icon svg {
	width: 20px;
	height: 20px;
	stroke: var(--color-text-muted);
	fill: none;
	stroke-width: 2;
	stroke-linecap: round;
	stroke-linejoin: round;
}

.empty-state p {
	font-size: 14px;
	color: var(--color-text-muted);
}

/* ─────────────────────────────────────────
       RESPONSIVE
    ───────────────────────────────────────── */
@media ( max-width : 768px) {
	.navbar {
		padding: 0 20px;
	}
	.page-wrapper {
		padding: 28px 20px 56px;
	}
	.stats-grid {
		grid-template-columns: 1fr;
		gap: 12px;
	}
	.actions-row {
		flex-wrap: wrap;
	}
	table thead th:nth-child(3), table tbody td:nth-child(3) {
		display: none;
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

		<div class="nav-right">

			<div class="nav-user">
				<div class="nav-avatar">
					<svg viewBox="0 0 24 24">
						<path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2" />
						<circle cx="12" cy="7" r="4" /></svg>
				</div>
				<%=request.getAttribute("username")%>
			</div>


			<a href="login.jsp">

				<button class="logout-btn">
					<svg viewBox="0 0 24 24">
						<path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4" />
						<polyline points="16 17 21 12 16 7" />
						<line x1="21" y1="12" x2="9" y2="12" /></svg>
					Logout
				</button>

			</a>

		</div>

	</nav>


	<!-- ── Page content ── -->
	<div class="page-wrapper">

		<!-- Page header -->
		<div class="page-header">
			<h1 class="page-title">Account Overview</h1>
			<p class="page-subtitle">
				Welcome back,
				<%=request.getAttribute("username")%></p>
		</div>

		<!-- Stat cards -->
		<div class="stats-grid">

			<div class="stat-card">
				<div class="stat-card-header">
					<span class="stat-card-label">Username</span>
					<div class="stat-card-icon">
						<svg viewBox="0 0 24 24">
							<path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2" />
							<circle cx="12" cy="7" r="4" /></svg>
					</div>
				</div>
				<div class="stat-card-value"><%=request.getAttribute("username")%></div>
			</div>

			<div class="stat-card">
				<div class="stat-card-header">
					<span class="stat-card-label">Account Number</span>
					<div class="stat-card-icon">
						<svg viewBox="0 0 24 24">
							<rect x="1" y="4" width="22" height="16" rx="2" ry="2" />
							<line x1="1" y1="10" x2="23" y2="10" /></svg>
					</div>
				</div>
				<div class="stat-card-value"><%=request.getAttribute("account_number")%></div>
			</div>

			<div class="stat-card">
				<div class="stat-card-header">
					<span class="stat-card-label">Available Balance</span>
					<div class="stat-card-icon">
						<svg viewBox="0 0 24 24">
							<line x1="12" y1="1" x2="12" y2="23" />
							<path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6" /></svg>
					</div>
				</div>
				<div class="stat-card-value balance">
					&#8377;<%=request.getAttribute("balance")%></div>
			</div>

		</div>

		<!-- Actions -->
		<div class="actions-row">

			<a href="topup.jsp" class="action-btn action-btn-primary"> <svg
					viewBox="0 0 24 24">
					<line x1="12" y1="5" x2="12" y2="19" />
					<line x1="5" y1="12" x2="19" y2="12" /></svg> Top Up
			</a> <a href="withdraw" class="action-btn action-btn-outline"> <svg
					viewBox="0 0 24 24">
					<line x1="5" y1="12" x2="19" y2="12" /></svg> Withdraw
			</a> <a href="history" class="action-btn action-btn-outline"> <svg
					viewBox="0 0 24 24">
					<polyline points="22 12 18 12 15 21 9 3 6 12 2 12" /></svg> History
			</a> <a href="transfer" class="action-btn action-btn-outline"> <svg
					viewBox="0 0 24 24">
					<polyline points="22 12 18 12 15 21 9 3 6 12 2 12" /></svg> Transfer
			</a>

		</div>

		<!-- Transaction table -->
		<div class="table-section">

			<div class="table-header">
				<span class="table-title">Transaction History</span> <span
					class="table-meta"> <%=(transactions != null) ? transactions.size() : 0%>
					records
				</span>
			</div>

			<%
			if (transactions != null && !transactions.isEmpty()) {
			%>

			<table>
				<thead>
					<tr>
						<th>Type</th>
						<th>Amount</th>
						<th>Date</th>
					</tr>
				</thead>
				<tbody>
					<%
					for (Transaction tx : transactions) {
						String type = tx.getTransaction_type();
						String typeLower = (type != null) ? type.toLowerCase() : "";
						String badgeClass;

						if (typeLower.contains("topup") || typeLower.contains("received")) {
							badgeClass = "deposit";
						} else if (typeLower.contains("withdraw") || typeLower.contains("send")) {
							badgeClass = "withdraw";
						} else {
							badgeClass = "default";
						}
					%>
					<tr>

						<td><span class="tx-badge <%=badgeClass%>"> <%
 if (badgeClass.equals("deposit")) {
 %> <svg viewBox="0 0 24 24">
									<line x1="12" y1="19" x2="12" y2="5" />
									<polyline points="5 12 12 5 19 12" /></svg> <%
 } else if (badgeClass.equals("withdraw")) {
 %> <svg viewBox="0 0 24 24">
									<line x1="12" y1="5" x2="12" y2="19" />
									<polyline points="19 12 12 19 5 12" /></svg> <%
 }
 %> <%=tx.getTransaction_type().toUpperCase()%>
						</span></td>

						<td><span class="tx-amount <%=badgeClass%>"> <%
 if (badgeClass.equals("deposit")) {
 %> +&#8377;<%=tx.getAmount()%> <%
 } else {
 %> -&#8377;<%=tx.getAmount()%> <%
 }
 %>

						</span></td>

						<td class="tx-date"><%=tx.getCreated_at()%></td>

					</tr>
					<%
					}
					%>
				</tbody>
			</table>

			<%
			} else {
			%>

			<div class="empty-state">
				<div class="empty-icon">
					<svg viewBox="0 0 24 24">
						<polyline points="22 12 18 12 15 21 9 3 6 12 2 12" /></svg>
				</div>
				<p>No transactions found for this account.</p>
			</div>

			<%
			}
			%>

		</div>

	</div>

</body>
</html>