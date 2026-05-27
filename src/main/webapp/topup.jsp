<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Topup</title>

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
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

h2 {
	text-align: center;
	margin-bottom: 25px;
	color: #007bff;
}

.input-group {
	margin-bottom: 20px;
}

.input-group label {
	display: block;
	margin-bottom: 8px;
	font-weight: bold;
}

.input-group input {
	width: 100%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 16px;
}

button {
	width: 100%;
	padding: 12px;
	border: none;
	background: #007bff;
	color: white;
	font-size: 16px;
	border-radius: 5px;
	cursor: pointer;
	font-weight: bold;
}

button:hover {
	background: #0056b3;
}
</style>

</head>
<body>

	<div class="container">

		<h2>Topup Balance</h2>

		<form action="topup" method="post">

			<div class="input-group">

				<label>Enter Amount</label> <input type="number" name="amount"
					min="1" max="100000" required>

			</div>





				<button type="submit">Add Money</button>

		</form>

	</div>

</body>
</html>