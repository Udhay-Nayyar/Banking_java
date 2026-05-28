<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Top Up — SecureBank</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet">

<style>

    *, *::before, *::after {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    :root {
        --color-bg:             #f0f2f5;
        --color-surface:        #ffffff;
        --color-border:         #e2e6ea;
        --color-border-focus:   #2563eb;
        --color-text-primary:   #0f1923;
        --color-text-secondary: #6b7280;
        --color-text-muted:     #9ca3af;
        --color-accent:         #1d4ed8;
        --color-navy:           #0f172a;
        --color-green:          #16a34a;
        --color-green-hover:    #15803d;
        --color-green-light:    #f0fdf4;
        --color-green-border:   #bbf7d0;
        --radius-sm:            6px;
        --radius-md:            10px;
        --radius-lg:            14px;
        --shadow-card:          0 1px 3px rgba(0,0,0,0.06), 0 4px 16px rgba(0,0,0,0.07);
        --font:                 'Inter', sans-serif;
        --nav-height:           64px;
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

    a { text-decoration: none; color: inherit; }

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
        align-items: center;
        justify-content: center;
        padding: 40px 16px;
    }

    .card-wrapper {
        width: 100%;
        max-width: 420px;
    }

    /* ── Card ── */
    .card {
        background: var(--color-surface);
        border: 1px solid var(--color-border);
        border-radius: var(--radius-lg);
        box-shadow: var(--shadow-card);
        overflow: hidden;
    }

    .card-accent-bar {
        height: 3px;
        background: var(--color-green);
    }

    .card-inner {
        padding: 36px 32px 32px;
    }

    /* ── Header ── */
    .card-header {
        display: flex;
        align-items: flex-start;
        gap: 14px;
        margin-bottom: 28px;
    }

    .card-header-icon {
        width: 42px;
        height: 42px;
        border-radius: var(--radius-sm);
        background: var(--color-green-light);
        border: 1px solid var(--color-green-border);
        display: flex;
        align-items: center;
        justify-content: center;
        flex-shrink: 0;
    }

    .card-header-icon svg {
        width: 19px;
        height: 19px;
        stroke: var(--color-green);
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
    }

    /* ── Quick amount chips ── */
    .quick-label {
        font-size: 12px;
        font-weight: 500;
        color: var(--color-text-muted);
        letter-spacing: 0.2px;
        margin-bottom: 10px;
    }

    .quick-amounts {
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 8px;
        margin-bottom: 22px;
    }

    .quick-chip {
        padding: 8px 4px;
        border: 1px solid var(--color-border);
        border-radius: var(--radius-sm);
        background: var(--color-bg);
        font-size: 12.5px;
        font-weight: 500;
        color: var(--color-text-secondary);
        font-family: var(--font);
        cursor: pointer;
        text-align: center;
        transition: background 0.15s ease, border-color 0.15s ease, color 0.15s ease;
    }

    .quick-chip:hover {
        background: var(--color-green-light);
        border-color: var(--color-green-border);
        color: var(--color-green);
    }

    /* ── Input ── */
    .input-group {
        margin-bottom: 20px;
    }

    .input-group label {
        display: block;
        font-size: 13px;
        font-weight: 500;
        color: var(--color-text-primary);
        margin-bottom: 6px;
        letter-spacing: 0.1px;
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

    .input-group input {
        width: 100%;
        padding: 10px 13px 10px 28px;
        font-size: 14px;
        font-family: var(--font);
        color: var(--color-text-primary);
        background: #ffffff;
        border: 1px solid var(--color-border);
        border-radius: var(--radius-sm);
        outline: none;
        transition: border-color 0.15s ease, box-shadow 0.15s ease;
        -webkit-appearance: none;
        -moz-appearance: textfield;
    }

    .input-group input::-webkit-inner-spin-button,
    .input-group input::-webkit-outer-spin-button {
        -webkit-appearance: none;
    }

    .input-group input::placeholder {
        color: var(--color-text-muted);
    }

    .input-group input:focus {
        border-color: var(--color-border-focus);
        box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.10);
    }

    .input-hint {
        margin-top: 6px;
        font-size: 12px;
        color: var(--color-text-muted);
    }

    /* ── Info notice ── */
    .info-notice {
        display: flex;
        align-items: flex-start;
        gap: 10px;
        background: var(--color-green-light);
        border: 1px solid var(--color-green-border);
        border-radius: var(--radius-sm);
        padding: 11px 14px;
        margin-bottom: 22px;
    }

    .info-notice svg {
        flex-shrink: 0;
        width: 15px;
        height: 15px;
        margin-top: 1px;
        stroke: var(--color-green);
        fill: none;
        stroke-width: 2;
        stroke-linecap: round;
        stroke-linejoin: round;
    }

    .info-notice p {
        font-size: 12.5px;
        color: var(--color-green);
        line-height: 1.5;
    }

    /* ── Submit button ── */
    .btn-topup {
        width: 100%;
        padding: 11px;
        border: none;
        background: var(--color-green);
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

    .btn-topup svg {
        width: 15px;
        height: 15px;
        stroke: #fff;
        fill: none;
        stroke-width: 2;
        stroke-linecap: round;
        stroke-linejoin: round;
    }

    .btn-topup:hover {
        background: var(--color-green-hover);
        box-shadow: 0 2px 8px rgba(22, 163, 74, 0.25);
    }

    .btn-topup:active {
        background: var(--color-green-hover);
        box-shadow: none;
    }

    /* ── Cancel ── */
    .cancel-row {
        text-align: center;
        margin-top: 16px;
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
       RESPONSIVE
    ───────────────────────────────────────── */
    @media (max-width: 480px) {
        .navbar   { padding: 0 20px; }
        .card-inner { padding: 28px 22px 24px; }
        .quick-amounts { grid-template-columns: repeat(2, 1fr); }
    }

</style>
</head>
<body>

    <!-- ── Navbar ── -->
    <nav class="navbar">
        <div class="nav-brand">
            <div class="nav-brand-icon">
                <svg viewBox="0 0 24 24"><path d="M12 2L3 7v5c0 5.25 3.75 10.15 9 11.25C17.25 22.15 21 17.25 21 12V7L12 2z"/></svg>
            </div>
            <span class="nav-brand-name">SecureBank</span>
        </div>

        <a href="dashboard">
            <button class="nav-back">
                <svg viewBox="0 0 24 24"><polyline points="15 18 9 12 15 6"/></svg>
                Back to Dashboard
            </button>
        </a>
    </nav>


    <!-- ── Page body ── -->
    <div class="page-body">
        <div class="card-wrapper">

            <div class="card">

                <div class="card-accent-bar"></div>

                <div class="card-inner">

                    <!-- Header -->
                    <div class="card-header">
                        <div class="card-header-icon">
                            <svg viewBox="0 0 24 24"><line x1="12" y1="19" x2="12" y2="5"/><polyline points="5 12 12 5 19 12"/></svg>
                        </div>
                        <div>
                            <h1 class="card-title">Add Funds</h1>
                            <p class="card-subtitle">Credit your account balance instantly</p>
                        </div>
                    </div>

                    <!-- Quick amounts -->
                    <p class="quick-label">Quick select</p>
                    <div class="quick-amounts">
                        <button type="button" class="quick-chip" onclick="setAmount(500)">&#8377;500</button>
                        <button type="button" class="quick-chip" onclick="setAmount(1000)">&#8377;1,000</button>
                        <button type="button" class="quick-chip" onclick="setAmount(5000)">&#8377;5,000</button>
                        <button type="button" class="quick-chip" onclick="setAmount(10000)">&#8377;10,000</button>
                    </div>

                    <form action="topup" method="post">

                        <!-- Amount input -->
                        <div class="input-group">
                            <label for="amount">Enter Amount</label>
                            <div class="input-wrapper">
                                <span class="input-prefix">&#8377;</span>
                                <input
                                    type="number"
                                    id="amount"
                                    name="amount"
                                    min="1"
                                    max="100000"
                                    placeholder="0.00"
                                    required
                                >
                            </div>
                            <p class="input-hint">Min &#8377;1 &nbsp;&middot;&nbsp; Max &#8377;1,00,000</p>
                        </div>

                        <!-- Info notice -->
                        <div class="info-notice">
                            <svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/></svg>
                            <p>Funds will be credited to your account immediately after confirmation.</p>
                        </div>

                        <button type="submit" class="btn-topup">
                            <svg viewBox="0 0 24 24"><line x1="12" y1="19" x2="12" y2="5"/><polyline points="5 12 12 5 19 12"/></svg>
                            Add Money
                        </button>

                    </form>

                    <div class="cancel-row">
                        <a href="dashboard" class="cancel-link">Cancel and go back</a>
                    </div>

                </div>
            </div>

        </div>
    </div>

    <script>
        function setAmount(value) {
            document.getElementById('amount').value = value;
        }
    </script>

</body>
</html>