<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Traffic_lights_Web.Home" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Traffic Light Simulation</title>
    <link rel="stylesheet" type="text/css" href="Styles/site.css" />
    <script src="Scripts/site.js"></script>
    <style>
        body {
            margin: 0;
            overflow: hidden;
            background-color: #a8d8e5; /* Sky background */
        }
        .container {
            position: relative;
            width: 100%;
            height: 100vh;
            overflow: hidden;
        }
        .road {
            position: absolute;
            top: 50%;
            left: 0;
            width: 100%;
            height: 200px;
            background-color: #555;
            border-top: 5px solid white;
            border-bottom: 5px solid white;
            box-shadow: inset 0 0 10px rgba(0, 0, 0, 0.5);
        }
        .zebra-crossing {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 100%;
            height: 20px;
            background: repeating-linear-gradient(
                90deg,
                white,
                white 10px,
                black 10px,
                black 20px
            );
        }
        .car {
            width: 80px;
            height: 40px;
            background-color: blue;
            position: absolute;
            top: 50%;
            left: 10%;
            border-radius: 5px;
            transition: left 1s linear;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
        }
        .pedestrian {
            width: 20px;
            height: 50px;
            background-color: #ffcc00; /* Yellow for visibility */
            position: absolute;
            bottom: 100px; /* Adjust position above the crossing */
            left: 10%; /* Initial position */
            border-radius: 5px;
            display: none; /* Hidden initially */
            transition: left 3s linear; /* Smooth crossing */
        }
        .pedestrian:before {
            content: '';
            width: 20px;
            height: 50px;
            background-color: #f0a500; /* Skin color */
            position: absolute;
            left: 0;
            bottom: 0;
            border-radius: 5px;
        }
        .pedestrian:after {
            content: '';
            width: 15px;
            height: 15px;
            background-color: black; /* Head */
            position: absolute;
            left: 2.5px;
            bottom: 50px;
            border-radius: 50%;
        }
        .traffic-light {
            width: 100px;
            height: 300px;
            background-color: #333;
            border-radius: 10px;
            display: flex;
            flex-direction: column;
            justify-content: space-around;
            padding: 10px;
            position: absolute;
            top: 10%;
            left: 10%;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
        }
        .light {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            background-color: grey;
            margin: auto;
        }
        .red { background-color: red; }
        .yellow { background-color: yellow; }
        .green { background-color: green; }
        .off { background-color: grey; }
        .pedestrian-button {
            width: 100px;
            height: 30px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            position: absolute;
            bottom: -40px;
            left: 50%;
            transform: translateX(-50%);
        }
        .button-container {
            position: absolute;
            top: 400px;
            left: 50%;
            transform: translateX(-50%);
            text-align: center;
        }
        .button {
            padding: 10px 20px;
            margin: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        footer {
            text-align: center;
            position: absolute;
            bottom: 10px;
            width: 100%;
            color: #333;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="road">
                <div class="zebra-crossing"></div>
                <div class="car" id="car"></div>
                <div class="pedestrian" id="pedestrian"></div>
            </div>
            <div class="traffic-light">
                <div id="redLight" class="light off"></div>
                <div id="yellowLight" class="light off"></div>
                <div id="greenLight" class="light off"></div>
                <button type="button" class="pedestrian-button" onclick="requestCross()">Cross</button>
            </div>
            <div class="button-container">
                <button type="button" class="button" onclick="changeLight('red')">Red</button>
                <button type="button" class="button" onclick="changeLight('yellow')">Yellow</button>
                <button type="button" class="button" onclick="changeLight('green')">Green</button>
            </div>
        </div>
        <footer>
            &copy; <span id="currentYear"></span> All Rights Reserved Tobias Kakooza
        </footer>
    </form>
    <script>
        // Automatically set the copyright year
        document.getElementById('currentYear').innerText = new Date().getFullYear();
    </script>
</body>
</html>
