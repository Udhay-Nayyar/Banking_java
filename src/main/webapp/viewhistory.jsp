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
<title>Transaction History — SecureBank</title>
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
	--color-green-border: #bbf7d0;
	--color-red: #dc2626;
	--color-red-light: #fef2f2;
	--color-red-border: #fecaca;
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
       PAGE LAYOUT
    ───────────────────────────────────────── */
.page-wrapper {
	max-width: 1000px;
	margin: 0 auto;
	padding: 40px 32px 72px;
}

/* ── Page header ── */
.page-header {
	display: flex;
	align-items: flex-end;
	justify-content: space-between;
	margin-bottom: 28px;
	gap: 16px;
	flex-wrap: wrap;
}

.page-header-left {
	
}

.page-eyebrow {
	font-size: 11.5px;
	font-weight: 600;
	letter-spacing: 0.8px;
	text-transform: uppercase;
	color: var(--color-accent);
	margin-bottom: 6px;
}

.page-title {
	font-size: 24px;
	font-weight: 600;
	letter-spacing: -0.5px;
	color: var(--color-navy);
	margin-bottom: 4px;
}

.page-subtitle {
	font-size: 13.5px;
	color: var(--color-text-muted);
}

/* ─────────────────────────────────────────
       SUMMARY STRIP
    ───────────────────────────────────────── */
.summary-strip {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 14px;
	margin-bottom: 24px;
}

.summary-card {
	background: var(--color-surface);
	border: 1px solid var(--color-border);
	border-radius: var(--radius-md);
	padding: 18px 20px;
	box-shadow: var(--shadow-card);
	display: flex;
	align-items: center;
	gap: 14px;
}

.summary-icon {
	width: 38px;
	height: 38px;
	border-radius: var(--radius-sm);
	display: flex;
	align-items: center;
	justify-content: center;
	flex-shrink: 0;
}

.summary-icon svg {
	width: 17px;
	height: 17px;
	fill: none;
	stroke-width: 2;
	stroke-linecap: round;
	stroke-linejoin: round;
}

.summary-icon.total {
	background: var(--color-accent-light);
}

.summary-icon.total svg {
	stroke: var(--color-accent);
}

.summary-icon.credit {
	background: var(--color-green-light);
}

.summary-icon.credit svg {
	stroke: var(--color-green);
}

.summary-icon.debit {
	background: var(--color-red-light);
}

.summary-icon.debit svg {
	stroke: var(--color-red);
}

.summary-info {
	
}

.summary-label {
	font-size: 11.5px;
	font-weight: 500;
	color: var(--color-text-muted);
	letter-spacing: 0.2px;
	margin-bottom: 3px;
}

.summary-value {
	font-size: 20px;
	font-weight: 600;
	letter-spacing: -0.4px;
	color: var(--color-text-primary);
}

/* ─────────────────────────────────────────
       FILTER BAR
    ───────────────────────────────────────── */
.filter-bar {
	display: flex;
	align-items: center;
	gap: 8px;
	margin-bottom: 16px;
	flex-wrap: wrap;
}

.filter-btn {
	padding: 6px 14px;
	border-radius: 100px;
	font-size: 12.5px;
	font-weight: 500;
	font-family: var(--font);
	cursor: pointer;
	border: 1px solid var(--color-border);
	background: var(--color-surface);
	color: var(--color-text-secondary);
	transition: all 0.15s ease;
}

.filter-btn:hover, .filter-btn.active {
	background: var(--color-accent);
	border-color: var(--color-accent);
	color: #ffffff;
}

.filter-btn.active-green {
	background: var(--color-green);
	border-color: var(--color-green);
	color: #ffffff;
}

.filter-btn.active-red {
	background: var(--color-red);
	border-color: var(--color-red);
	color: #ffffff;
}

/* ─────────────────────────────────────────
       TABLE SECTION
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

.table-title {
	font-size: 14px;
	font-weight: 600;
	color: var(--color-text-primary);
	letter-spacing: -0.1px;
}

.table-count {
	font-size: 12px;
	color: var(--color-text-muted);
	background: var(--color-bg);
	border: 1px solid var(--color-border);
	border-radius: 100px;
	padding: 3px 10px;
	font-weight: 500;
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

table thead th:nth-child(2), table thead th:nth-child(3) {
	text-align: right;
}

table tbody tr {
	transition: background 0.12s ease;
}

table tbody tr:hover td {
	background: #fafbfc;
}

table tbody td {
	padding: 15px 24px;
	font-size: 13.5px;
	color: var(--color-text-primary);
	border-bottom: 1px solid #f3f4f6;
	vertical-align: middle;
}

table tbody td:nth-child(2), table tbody td:nth-child(3) {
	text-align: right;
}

table tbody tr:last-child td {
	border-bottom: none;
}

/* Row index */
.row-index {
	font-size: 12px;
	color: var(--color-text-muted);
	font-weight: 500;
	min-width: 24px;
	display: inline-block;
}

/* Type badge */
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

/* Amount */
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

.tx-amount.default {
	color: var(--color-text-primary);
}

/* Date */
.tx-date {
	font-size: 13px;
	color: var(--color-text-muted);
	white-space: nowrap;
}

/* ── Empty state ── */
.empty-state {
	padding: 72px 24px;
	text-align: center;
}

.empty-icon {
	width: 48px;
	height: 48px;
	border-radius: 50%;
	background: var(--color-bg);
	border: 1px solid var(--color-border);
	display: flex;
	align-items: center;
	justify-content: center;
	margin: 0 auto 16px;
}

.empty-icon svg {
	width: 22px;
	height: 22px;
	stroke: var(--color-text-muted);
	fill: none;
	stroke-width: 1.8;
	stroke-linecap: round;
	stroke-linejoin: round;
}

.empty-title {
	font-size: 15px;
	font-weight: 600;
	color: var(--color-text-secondary);
	margin-bottom: 6px;
}

.empty-desc {
	font-size: 13.5px;
	color: var(--color-text-muted);
}

/* ── Table footer ── */
.table-footer {
	padding: 14px 24px;
	border-top: 1px solid var(--color-border);
	background: #f8fafc;
	font-size: 12.5px;
	color: var(--color-text-muted);
	display: flex;
	align-items: center;
	justify-content: space-between;
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
	.summary-strip {
		grid-template-columns: 1fr;
		gap: 10px;
	}
	table thead th:nth-child(3), table tbody td:nth-child(3) {
		display: none;
	}
}

@media ( max-width : 480px) {
	.page-header {
		flex-direction: column;
		align-items: flex-start;
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


	<!-- ── Page wrapper ── -->
	<div class="page-wrapper">

		<!-- Page header -->
		<div class="page-header">
			<div class="page-header-left">
				<p class="page-eyebrow">Account Activity</p>
				<h1 class="page-title">Transaction History</h1>
				<p class="page-subtitle">Complete record of all credits and
					debits on your account</p>
			</div>
		</div>

		<%
		int totalCount = 0;
		int creditCount = 0;
		int debitCount = 0;

		if (transactions != null) {
			totalCount = transactions.size();

			for (Transaction tx : transactions) {

				String t = tx.getTransaction_type();

				if (t != null) {

			if (t.equalsIgnoreCase("topup")) {
				creditCount++;
			} else if (t.equalsIgnoreCase("withdraw")) {
				debitCount++;
			}

				}
			}
		}
		%>
		<!-- Summary strip -->
		<div class="summary-strip">

			<div class="summary-card">
				<div class="summary-icon total">
					<svg viewBox="0 0 24 24">
						<polyline points="22 12 18 12 15 21 9 3 6 12 2 12" /></svg>
				</div>
				<div class="summary-info">
					<p class="summary-label">Total Transactions</p>
					<p class="summary-value"><%=totalCount%></p>
				</div>
			</div>

			<div class="summary-card">
				<div class="summary-icon credit">
					<svg viewBox="0 0 24 24">
						<line x1="12" y1="19" x2="12" y2="5" />
						<polyline points="5 12 12 5 19 12" /></svg>
				</div>
				<div class="summary-info">
					<p class="summary-label">Credits (Top Ups)</p>
					<p class="summary-value"><%=creditCount%></p>
				</div>
			</div>

			<div class="summary-card">
				<div class="summary-icon debit">
					<svg viewBox="0 0 24 24">
						<line x1="12" y1="5" x2="12" y2="19" />
						<polyline points="19 12 12 19 5 12" /></svg>
				</div>
				<div class="summary-info">
					<p class="summary-label">Debits (Withdrawals)</p>
					<p class="summary-value"><%=debitCount%></p>
				</div>
			</div>

		</div>

		<!-- Filter bar -->
		<div class="filter-bar">
			<button class="filter-btn active" id="filter-all"
				onclick="filterTable('all')">All</button>
			<button class="filter-btn" id="filter-deposit"
				onclick="filterTable('deposit')">Credits</button>
			<button class="filter-btn" id="filter-withdraw"
				onclick="filterTable('withdraw')">Debits</button>
		</div>

		<!-- Table -->
		<div class="table-section">

			<div class="table-header">
				<span class="table-title">All Transactions</span> <span
					class="table-count" id="visible-count"><%=totalCount%>
					records</span>
			</div>

			<%
			if (transactions != null && !transactions.isEmpty()) {
			%>

			<table id="tx-table">
				<thead>
					<tr>
						<th>Type</th>
						<th>Amount</th>
						<th>Date & Time</th>
					</tr>
				</thead>

				<tbody>

					<%
					for (Transaction tx : transactions) {

						String type = tx.getTransaction_type();
						String typeLower = (type != null) ? type.toLowerCase() : "";

						String badgeClass = typeLower.contains("topup")
						? "deposit"
						: typeLower.contains("withdraw") ? "withdraw" : "default";
					%>

					<tr data-type="<%=badgeClass%>">

						<td><span class="tx-badge <%=badgeClass%>"> <%
 if (badgeClass.equals("deposit")) {
 %> <svg viewBox="0 0 24 24">
                            <line x1="12" y1="19" x2="12" y2="5" />
                            <polyline points="5 12 12 5 19 12" />
                        </svg> <%
 } else if (badgeClass.equals("withdraw")) {
 %> <svg viewBox="0 0 24 24">
                            <line x1="12" y1="5" x2="12" y2="19" />
                            <polyline points="19 12 12 19 5 12" />
                        </svg> <%
 }
 %> <%=tx.getTransaction_type().toUpperCase()%>

						</span></td>

						<td>
							<%
							if (badgeClass.equals("deposit")) {
							%> <span class="tx-amount deposit"> +₹<%=tx.getAmount()%>
						</span> <%
 } else {
 %> <span class="tx-amount withdraw"> -₹<%=tx.getAmount()%>
						</span> <%
 }
 %>

						</td>

						<td class="tx-date"><%=tx.getCreated_at()%></td>

					</tr>

					<%
					}
					%>

				</tbody>
			</table>

			<div class="table-footer">
				<span>Showing <span id="footer-count"><%=totalCount%></span>
					of <%=totalCount%> transactions
				</span> <span>Account: <%=request.getAttribute("account_number")%></span>
			</div>

			<%
			} else {
			%>

			<div class="empty-state">
				<div class="empty-icon">
					<svg viewBox="0 0 24 24">
						<polyline points="22 12 18 12 15 21 9 3 6 12 2 12" /></svg>
				</div>
				<p class="empty-title">No transactions yet</p>
				<p class="empty-desc">Your transaction history will appear here
					once you make your first deposit or withdrawal.</p>
			</div>

			<%
			}
			%>

		</div>

	</div>


	<script>
		function filterTable(type) {
			const rows = document.querySelectorAll('#tx-table tbody tr');
			const allBtn = document.getElementById('filter-all');
			const depositBtn = document.getElementById('filter-deposit');
			const withdrawBtn = document.getElementById('filter-withdraw');
			const countBadge = document.getElementById('visible-count');
			const footerCount = document.getElementById('footer-count');
			const total = rows.length;

			// Reset button states
			allBtn.className = 'filter-btn';
			depositBtn.className = 'filter-btn';
			withdrawBtn.className = 'filter-btn';

			if (type === 'all')
				allBtn.classList.add('active');
			if (type === 'deposit')
				depositBtn.classList.add('active-green');
			if (type === 'withdraw')
				withdrawBtn.classList.add('active-red');

			let visible = 0;
			rows.forEach(function(row) {
				const rowType = row.getAttribute('data-type');
				if (type === 'all' || rowType === type) {
					row.style.display = '';
					visible++;
				} else {
					row.style.display = 'none';
				}
			});

			const label = type === 'all' ? 'records'
					: type === 'deposit' ? 'credits' : 'debits';
			countBadge.textContent = visible + ' ' + label;
			footerCount.textContent = visible;
		}
	</script>

</body>
</html>