<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>

<style>

    *{
        margin:0;
        padding:0;
        box-sizing:border-box;
        font-family:Arial;
    }

    body{
        background:#f5f5f5;
    }

    .navbar{
        width:100%;
        padding:20px;
        background:#007bff;
        color:white;
        display:flex;
        justify-content:space-between;
        align-items:center;
    }

    .navbar h2{
        font-size:24px;
    }

    .logout-btn{
        padding:10px 20px;
        background:white;
        color:#007bff;
        border:none;
        border-radius:5px;
        cursor:pointer;
        font-weight:bold;
    }

    .container{
        width:90%;
        margin:auto;
        margin-top:30px;
    }

    .cards{
        display:flex;
        gap:20px;
        margin-bottom:30px;
    }

    .card{
        flex:1;
        background:white;
        padding:20px;
        border-radius:10px;
        box-shadow:0px 0px 10px rgba(0,0,0,0.1);
    }

    .card h3{
        margin-bottom:10px;
        color:#555;
    }

    .card p{
        font-size:22px;
        font-weight:bold;
    }

    .actions{
        display:flex;
        gap:20px;
        margin-bottom:30px;
    }

    .action-btn{
        padding:12px 25px;
        background:#007bff;
        color:white;
        text-decoration:none;
        border-radius:5px;
        font-weight:bold;
    }

    table{
        width:100%;
        background:white;
        border-collapse:collapse;
        border-radius:10px;
        overflow:hidden;
        box-shadow:0px 0px 10px rgba(0,0,0,0.1);
    }

    table th{
        background:#007bff;
        color:white;
        padding:15px;
    }

    table td{
        padding:15px;
        text-align:center;
        border-bottom:1px solid #ddd;
    }

</style>

</head>
<body>

    <div class="navbar">

        <h2>Banking Dashboard</h2>

        <button class="logout-btn">
            Logout
        </button>

    </div>



    <div class="container">

        <div class="cards">

            <div class="card">
                <h3>Username</h3>
                <p>Udhay</p>
            </div>

            <div class="card">
                <h3>Account Number</h3>
                <p>ACC102938</p>
            </div>

            <div class="card">
                <h3>Balance</h3>
                <p>₹50,000</p>
            </div>

        </div>



        <div class="actions">

            <a href="topup.jsp" class="action-btn">
                Topup
            </a>

            <a href="withdraw.jsp" class="action-btn">
                Withdraw
            </a>

        </div>



        <table>

            <tr>
                <th>Transaction Type</th>
                <th>Amount</th>
                <th>Date</th>
            </tr>

            <tr>
                <td>TOPUP</td>
                <td>₹5000</td>
                <td>2026-05-27</td>
            </tr>

            <tr>
                <td>WITHDRAW</td>
                <td>₹2000</td>
                <td>2026-05-26</td>
            </tr>

            <tr>
                <td>TOPUP</td>
                <td>₹10000</td>
                <td>2026-05-25</td>
            </tr>

        </table>

    </div>

</body>
</html>