<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>

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
        border-radius:10px;
        box-shadow:0px 0px 10px rgba(0,0,0,0.2);
    }

    h2{
        text-align:center;
        margin-bottom:25px;
    }

    .input-group{
        margin-bottom:20px;
    }

    .input-group label{
        display:block;
        margin-bottom:5px;
        font-weight:bold;
    }

    .input-group input{
        width:100%;
        padding:10px;
        border:1px solid #ccc;
        border-radius:5px;
    }

    button{
        width:100%;
        padding:12px;
        border:none;
        background:#007bff;
        color:white;
        font-size:16px;
        border-radius:5px;
        cursor:pointer;
    }

    button:hover{
        background:#0056b3;
    }

    .signup-link{
        text-align:center;
        margin-top:15px;
    }

    .signup-link a{
        text-decoration:none;
        color:#007bff;
    }

</style>

</head>
<body>

    <div class="container">

        <h2>Login</h2>

        <form action="login" method="post">

            <div class="input-group">

                <label>Email</label>

                <input
                    type="email"
                    name="email"
                    required
                >

            </div>


            <div class="input-group">

                <label>Password</label>

                <input
                    type="password"
                    name="password"
                    required
                >

            </div>


            <button type="submit">
                Login
            </button>

        </form>


        <div class="signup-link">

            Don't have an account?
            <a href="signup.jsp">
                Signup
            </a>

        </div>

    </div>

</body>
</html>