<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Withdraw Money</title>

<style>

    *{
        margin:0;
        padding:0;
        box-sizing:border-box;
        font-family:Arial;
    }

    body{
        height:100vh;
        display:flex;
        justify-content:center;
        align-items:center;
        background:#f5f5f5;
    }

    .container{
        width:400px;
        background:white;
        padding:30px;
        border-radius:12px;
        box-shadow:0px 0px 15px rgba(0,0,0,0.1);
    }

    h2{
        text-align:center;
        margin-bottom:25px;
        color:#dc3545;
    }

    .input-group{
        margin-bottom:20px;
    }

    .input-group label{
        display:block;
        margin-bottom:8px;
        font-weight:bold;
        color:#333;
    }

    .input-group input{
        width:100%;
        padding:12px;
        border:1px solid #ccc;
        border-radius:6px;
        font-size:16px;
    }

    .info{
        margin-bottom:20px;
        color:#666;
        font-size:14px;
    }

    button{
        width:100%;
        padding:12px;
        border:none;
        background:#dc3545;
        color:white;
        font-size:16px;
        border-radius:6px;
        cursor:pointer;
        font-weight:bold;
    }

    button:hover{
        background:#b02a37;
    }

</style>

</head>
<body>

    <div class="container">

        <h2>Withdraw Money</h2>

        <p class="info">
            Enter amount between ₹1 and ₹<%= request.getAttribute("balance") %>
        </p>

        <form action="withdraw" method="post">

            <div class="input-group">

                <label>Withdraw Amount</label>

                <input
                    type="number"
                    name="amount"
                    min="1"
                    max="<%= request.getAttribute("balance") %>"
                    required
                >

            </div>

            <button type="submit">
                Withdraw
            </button>

        </form>

    </div>

</body>
</html>