<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Banking Application</title>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: Arial;
}

body {
	background: #f5f5f5;
}

.navbar {
	width: 100%;
	padding: 20px 60px;
	background: #007bff;
	display: flex;
	justify-content: space-between;
	align-items: center;
	color: white;
}

.navbar h2 {
	font-size: 30px;
}

.nav-buttons {
	display: flex;
	gap: 15px;
}

.nav-buttons button {
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-weight: bold;
}

.login-btn {
	background: white;
	color: #007bff;
}

.signup-btn {
	background: #0056b3;
	color: white;
}

.hero {
	width: 90%;
	margin: auto;
	min-height: 90vh;
	display: flex;
	align-items: center;
	justify-content: space-between;
	gap: 50px;
}

.left {
	flex: 1;
}

.left h1 {
	font-size: 65px;
	margin-bottom: 20px;
	color: #222;
}

.left p {
	font-size: 18px;
	color: #555;
	line-height: 1.8;
	margin-bottom: 30px;
}

.hero-buttons {
	display: flex;
	gap: 20px;
}

.hero-buttons button {
	padding: 14px 28px;
	border: none;
	border-radius: 8px;
	font-size: 16px;
	font-weight: bold;
	cursor: pointer;
}

.dashboard-btn {
	background: #007bff;
	color: white;
}

.explore-btn {
	background: white;
	border: 2px solid #007bff;
	color: #007bff;
}

.right {
	flex: 1;
	background: white;
	padding: 30px;
	border-radius: 15px;
	box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
}

.window-header {
	display: flex;
	gap: 10px;
	margin-bottom: 20px;
}

.circle {
	width: 15px;
	height: 15px;
	border-radius: 50%;
}

.red {
	background: red;
}

.yellow {
	background: orange;
}

.green {
	background: green;
}

pre {
	font-size: 15px;
	line-height: 1.8;
	overflow-x: auto;
}

.features {
	width: 90%;
	margin: auto;
	margin-bottom: 60px;
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 20px;
}

.card {
	background: white;
	padding: 30px;
	border-radius: 12px;
	text-align: center;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

.card h3 {
	margin-bottom: 15px;
	color: #007bff;
}

.card p {
	color: #555;
	line-height: 1.7;
}
</style>

</head>
<body>

	<div class="navbar">

		<h2>Banking App</h2>

		<div class="nav-buttons">

			<button class="login-btn">Login</button>

			<button class="signup-btn">Signup</button>

		</div>

	</div>



	<section class="hero">

		<div class="left">

			<h1>Modern Digital Banking</h1>

			<p>Build and manage your banking system with secure
				authentication, balance tracking, transaction history, and dashboard
				management using Java, Servlets, JSP, JDBC, and MySQL.</p>


			<div class="hero-buttons">

				<a href="./dashboard">
					<button class="dashboard-btn">Dashboard</button>
				</a>

				<button class="explore-btn">Explore Features</button>

			</div>

		</div>



		<div class="right">

			<div class="window-header">

				<div class="circle red"></div>
				<div class="circle yellow"></div>
				<div class="circle green"></div>

			</div>


			<pre>

</pre>

		</div>

	</section>



	<section class="features">

		<div class="card">

			<h3>Secure Login</h3>

			<p>Authentication using sessions, JDBC, and servlet-based
				backend.</p>

		</div>


		<div class="card">

			<h3>Transaction Handling</h3>

			<p>Deposit and withdraw money with database-backed operations.</p>

		</div>


		<div class="card">

			<h3>User Dashboard</h3>

			<p>Dynamic dashboard with balance, profile, and transaction
				details.</p>

		</div>

	</section>

</body>
</html>