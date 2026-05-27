<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup Page</title>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: Arial;
}

body {
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	background: #f5f5f5;
}

.container {
	width: 400px;
	background: white;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
}

h2 {
	text-align: center;
	margin-bottom: 20px;
}

.input-group {
	margin-bottom: 15px;
}

.input-group label {
	display: block;
	margin-bottom: 5px;
}

.input-group input {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

button {
	width: 100%;
	padding: 10px;
	border: none;
	background: #007bff;
	color: white;
	font-size: 16px;
	border-radius: 5px;
	cursor: pointer;
}

button:hover {
	background: #0056b3;
}
</style>

</head>
<body>

	<div class="container">

		<h2>Create Account</h2>

		<form action="signup" method="post">

			<div class="input-group">
				<label>Username</label> <input type="text" name="username" required>
			</div>

			<div class="input-group">
				<label>Email</label> <input type="email" name="email" required>
			</div>

			<div class="input-group">
				<label>Password</label> <input type="password" name="password"
					required>
			</div>

			<div class="input-group">
				<label>Balance</label> <input type="number" step="0.01"
					name="balance" required>
			</div>

			<div class="input-group">
				<label>Account Number</label> <input type="text"
					name="account_number" required>
			</div>

			<button type="submit">Signup</button>

		</form>

	</div>

</body>
</html>