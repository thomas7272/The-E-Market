<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Signup</title>
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

    .signup, .whysign {
      width: 50%;
      padding: 40px;
    }

    .signup {
      background-color: #f9f9f9;
    }

    .whysign {
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

    .signup input, .signup select {
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

    .whysign h1 {
      font-size: 24px;
      margin-bottom: 20px;
    }

    .whysign h2 {
      font-size: 22px;
      margin-bottom: 10px;
    }

    .whysign p {
      font-size: 16px;
      line-height: 1.6;
    }

    @media screen and (max-width: 768px) {
      .signup, .whysign {
        width: 100%;
      }
    }
  </style>
</head>
<body>
  <div id="container">
    <div class="signup">
      <form action="signupAction.jsp" method="post">
        <input type="text" name="name" placeholder="Enter Name" required>
        <input type="email" name="email" placeholder="Enter Email" required>
        <input type="number" name="mobileNumber" placeholder="Enter Mobile Number" required>
        <select name="securityQuestion" required>
          <option value="What was your first car?">What was your first car?</option>
          <option value="What is the name of your first pet?">What is the name of your first pet?</option>
          <option value="What elementary school did you attend?">What elementary school did you attend?</option>
          <option value="What is the name of the town where you were born?">What is the name of the town where you were born?</option>
        </select>
        <input type="text" name="answer" placeholder="Enter Answer" required>
        <input type="password" name="password" placeholder="Enter Password" required>
        <input type="submit" value="Signup">
      </form>
      <h2><a href="login.jsp">Login</a></h2>
    </div>
    
    <div class="whysign">
      <% String msg = request.getParameter("msg"); if("valid".equals(msg)) { %>
      <h1>Successfully Registered</h1>
      <% } %> 
      <% if("invalid".equals(msg)) { %>
      <h1>Something Went Wrong! Try Again!</h1>
      <% } %>
      
      <h2>The E-Market</h2>
      <p>The Online Shopping System allows users to shop online without the hassle of visiting physical stores.</p>
    </div>
  </div>
</body>
</html>
