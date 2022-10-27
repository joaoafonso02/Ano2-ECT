javascript
let boxs = [];
let img;

let size = document.getElementById("inpSize").value;
let rand = document.getElementById("inpRand").value;

function setup() {
  createCanvas(window.innerWidth, window.innerHeight);
  frameRate(60);
  textAlign(CENTER);
  
  for(let i=0;i<50;i++){
     boxs.push(new Box());
  }
}

function draw() {
  background(0,0,0,10);

  boxs.forEach((elem) => elem.draw());
  boxs.forEach((elem) => {
    elem.dx += (mouseX-elem.x)*0.0001;
    elem.dy += (mouseY-elem.y)*0.0001;
  })
  boxs.forEach((elem) => elem.upd());
  
  fill(0,0,0,230);
  stroke('#700');
  rect(5,height-330,220,300);
  fill('#700')
  stroke(0);
  textSize(35);
  text("Settings",110,height-295);

  testCollisions();
}

function windowResized() {
  resizeCanvas(window.innerWidth,window.innerHeight)
}


function testCollisions() {
  for (let i = 0; i < boxs.length; i++) {
    for (let j = 0; j < boxs.length; j++) {
      if (boxs[i].x + boxs[i].dx + boxs[i].w > boxs[j].x &&
          boxs[i].x + boxs[i].dx < boxs[j].x + boxs[j].w &&
          boxs[i].y + boxs[i].dy + boxs[i].h > boxs[j].y &&
          boxs[i].y + boxs[i].dy < boxs[j].y + boxs[j].h
      ) {
        boxs[i].dx+=((boxs[i].x+boxs[i].w/2)-(boxs[j].x+boxs[j].w/2))*0.002;
        boxs[i].dy+=((boxs[i].y+boxs[i].h/2)-(boxs[j].y+boxs[j].h/2))*0.002;
      }

    }


    
    if(boxs[i].x+boxs[i].w+boxs[i].dx>width){
      boxs[i].dx+=(boxs[i].x+boxs[i].dx-width)*0.01;
    }
    if(boxs[i].y+boxs[i].dy<0){
      boxs[i].dy+=(0-boxs[i].y)*0.01;
    }
    if(boxs[i].x+boxs[i].dx<0){
      boxs[i].dx+=(0-boxs[i].x)*0.01;
    }
    if(boxs[i].y+boxs[i].h+boxs[i].dy>height){
      boxs[i].dy+=(boxs[i].y+boxs[i].dy-height)*0.01;
    }
    
  }
}

class Box {
  constructor() {
    this.w = random(rand)+parseInt(size);
    this.h = this.w;
    this.x = random(width-this.w);
    this.y = random(height-this.h);
    this.dx = random(5)-2.5;
    this.dy = random(5)-2.5;
    this.static=false;
    this.img = loadImage('https://thumbs.dreamstime.com/b/error-webpage-outline-icon-error-webpage-outline-icon-linear-style-sign-mobile-concept-web-design-error-page-not-found-133329694.jpg');
  }

  draw() {
    strokeWeight(1);
    stroke(220);
    fill(255);
    rect(this.x, this.y, this.w, this.h);
    // image(this.img,this.x,this.y,this.w,this.w)
  }

  upd() {
    if(!this.static){
      this.x += this.dx;
      this.y += this.dy;
      this.dx*=1.001;
      this.dy*=1.001;
    }
  }
}

function remove10Box() {
  for(let i=0;i<10;i++) boxs.pop();
}
function removeBox() {
  boxs.pop();
}
function addBox() {
  boxs.push(new Box());
}
function add10Box() {
  for(let i=0;i<10;i++) boxs.push(new Box());
}

function updateInpSize(){
  size = document.getElementById("inpSize").value;
}
function updateInpRand(){
  rand = document.getElementById("inpRand").value;
}
