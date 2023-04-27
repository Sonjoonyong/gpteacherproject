<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>GPTeacher</title>
  <style>
    body {
      background: #060e1b;
      overflow: hidden;
      margin: 0;
      display: flex;
      align-items: center;
      justify-content: center;
      height: 100vh;
    }

    canvas {
      position: absolute;
      top: 0;
      left: 0;
      //opacity: 0.5;
    }

    #content {
      position: relative;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
    }

    #logo {
      margin-top: 100px;
      margin-bottom: 300px;
      width: 900px;
      height: auto;
      position: relative;
    }

    .title-text {
      position: absolute;
      font-size: 2.5rem;
      color: #E9E9E9;
      text-align: center;
      top: 54%;
      left: 50%;
      transform: translate(-50%, -50%);
      z-index: 2;
    }

    #start-button {
      position: absolute;
      background-color: #5DB99D;
      border: none;
      border-radius: 10px;
      padding: 10px 20px;
      font-size: 1.5rem;
      color: #716FAA;
      cursor: pointer;
      top: 50%;
      left: 50%;
      transform: translate(-50%, 150px);
    }

    #start-button:hover {
      background-color: #716FAA;
      color: #5DB99D;
      transition: all 0.2s ease-in-out;
    }

  </style>
</head>
<body>
<canvas id="canvas"></canvas>
<div id="content">
  <img id="logo" src="/images/logoremove.png" alt="Logo">
  <button id="start-button">Start</button>
  <div class="title-text">ChatGPT와 함께하는<br/>체계적인 AI 영어공부 시스템</div>
</div>

<script>
  "use strict";

  var canvas = document.getElementById('canvas'),
          ctx = canvas.getContext('2d'),
          w = canvas.width = window.innerWidth,
          h = canvas.height = window.innerHeight,

          hue = 217,
          stars = [],
          count = 0,
          maxStars = 1400;

  var canvas2 = document.createElement('canvas'),
          ctx2 = canvas2.getContext('2d');
  canvas2.width = 100;
  canvas2.height = 100;
  var half = canvas2.width/2,
          gradient2 = ctx2.createRadialGradient(half, half, 0, half, half, half);
  gradient2.addColorStop(0.025, '#fff');
  gradient2.addColorStop(0.1, 'hsl(160, 48%, 47%)');
  gradient2.addColorStop(0.25, 'hsl(160, 48%, 20%)');
  gradient2.addColorStop(1, 'transparent');

  ctx2.fillStyle = gradient2;
  ctx2.beginPath();
  ctx2.arc(half, half, half, 0, Math.PI * 2);
  ctx2.fill();

  function random(min, max) {
    if (arguments.length < 2) {
      max = min;
      min = 0;
    }

    if (min > max) {
      var hold = max;
      max = min;
      min = hold;
    }

    return Math.floor(Math.random() * (max - min + 1)) + min;
  }

  function maxOrbit(x,y) {
    var max = Math.max(x,y),
            diameter = Math.round(Math.sqrt(max*max + max*max));
    return diameter/2;
  }

  var Star = function() {

    this.orbitRadius = random(maxOrbit(w,h));
    this.radius = random(60, this.orbitRadius) / 12;
    this.orbitX = w / 2;
    this.orbitY = h / 2;
    this.timePassed = random(0, maxStars);
    this.speed = random(this.orbitRadius) / 100000;
    this.alpha = random(2, 10) / 10;

    count++;
    stars[count] = this;
  }

  Star.prototype.draw = function() {
    var x = Math.sin(this.timePassed) * this.orbitRadius + this.orbitX,
            y = Math.cos(this.timePassed) * this.orbitRadius + this.orbitY,
            twinkle = random(10);

    if (twinkle === 1 && this.alpha > 0) {
      this.alpha -= 0.05;
    } else if (twinkle === 2 && this.alpha < 1) {
      this.alpha += 0.05;
    }

    ctx.globalAlpha = this.alpha;
    ctx.drawImage(canvas2, x - this.radius / 2, y - this.radius / 2, this.radius, this.radius);
    this.timePassed += this.speed;
  }

  for (var i = 0; i < maxStars; i++) {
    new Star();
  }

  function animation() {
    ctx.globalCompositeOperation = 'source-over';
    ctx.globalAlpha = 0.8;
    ctx.fillStyle = 'hsla(' + hue + ', 64%, 6%, 1)';
    ctx.fillRect(0, 0, w, h)

    ctx.globalCompositeOperation = 'lighter';
    for (var i = 1, l = stars.length; i < l; i++) {
      stars[i].draw();
    };

    window.requestAnimationFrame(animation);
  }

  animation();

  document.getElementById('start-button').addEventListener('click', function() {
    window.location.href = "/main";
  });
</script>
</body>
</html>