<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login</title>
  <link rel="stylesheet" href="css/signup-style.css">
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Arial', sans-serif;
      background: linear-gradient(135deg, #6e8efb, #a777e3);
      color: #333; 
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    #container {
      width: 80%;
      max-width: 900px;
      display: flex;
      flex-wrap: wrap;
      background-color: #fff;
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
      border-radius: 10px;
      overflow: hidden;
    }

    .signup, .whysignLogin {
      width: 50%;
      padding: 40px;
    }

    .signup {
      background-color: #f9f9f9;
    }

    .whysignLogin {
      background-color: #6e8efb;
      color: white;
      display: flex;
      flex-direction: column;
      justify-content: center;
    }

    .signup form {
      display: flex;
      flex-direction: column;
    }

    .signup input {
      margin-bottom: 20px;
      padding: 10px;
      border: 1px solid #ddd;
      border-radius: 5px;
      font-size: 16px;
      width: 100%;
    }

    .signup input[type="submit"] {
      background-color: #6e8efb;
      color: white;
      cursor: pointer;
      transition: background-color 0.3s ease;
      border: none;
    }

    .signup input[type="submit"]:hover {
      background-color: #5a78d4;
    }

    .signup h2 a {
      color: #6e8efb;
      text-decoration: none;
      font-size: 14px;
    }

    .signup h2 a:hover {
      text-decoration: underline;
    }

    .whysignLogin h1 {
      font-size: 24px;
      margin-bottom: 20px;
    }

    .whysignLogin h2 {
      font-size: 22px;
      margin-bottom: 10px;
    }

    .whysignLogin p {
      font-size: 16px;
      line-height: 1.6;
    }

    @media screen and (max-width: 768px) {
      .signup, .whysignLogin {
        width: 100%;
      }
    }
  </style>
</head>
<body>
  <div id="container">
    <div class="signup">
      <form action="loginAction.jsp" method="post">
        <input type="email" name="email" placeholder="Enter Email" required>
        <input type="password" name="password" placeholder="Enter Password" required>
        <input type="submit" value="Login">
      </form>
      <h2><a href="signup.jsp">SignUp</a></h2>
      <h2><a href="forgotPassword.jsp">Forgot Password?</a></h2>
    </div>

    <div class="whysignLogin">
      <% String msg = request.getParameter("msg"); if ("notexist".equals(msg)) { %>
      <h1>Incorrect Username or Password</h1>
      <% } %> 
      <% if ("invalid".equals(msg)) { %>
      <h1>Something Went Wrong! Try Again!</h1>
      <% } %>
      
      <h2>The E-Market</h2>
      <p>The Online Shopping System allows users to shop online without the hassle of visiting physical stores.</p>
    </div>
  </div>
</body>
</html>
