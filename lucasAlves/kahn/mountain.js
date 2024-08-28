var r  = new Random(1);
var tree = function(x, y, i){
    // Adapted from Dan Shiffman, natureofcode.com
    if (random(1) <= 0.4){
        var posY = r.nextGaussian() * y/3 + height - y/2;
        stroke(110/(i*2), 220/(i*2), 120/(i*2));
        ellipse(x, constrain(posY, height - y, height), 2, 2);
    }
};


var drawRange = function(alt, incAmount, s) {
    for (var t = 0; t < incAmount*width; t += incAmount) {
        var n = noise(t);
        var y = map(n, 0, 1, 0, height/alt);
        stroke(s);
        rect(t*100, height-y, 3, y);
        tree(t*100, y, alt);
    }
};

var cloud = function(){
    // Adapted from Dan Shiffman, natureofcode.com

    var xoff = 0.0;
    for (var x = 0; x < 400; x++) {
        var yoff = 0.0;
        for (var y = 0; y < 400; y++) {
            var bright = map(noise(xoff, yoff), 0, 1, 0, 255);
            stroke(bright * 0.5, bright * 1.2, bright*1.8);
            point(x, y);
            yoff += 0.01;
        }
        xoff += 0.01;
    }
};


var drawBird = function(){
    var dx = 100;
    var dy = 25;
    var mx = 200;
    var my = 70;
    var nx = r.nextGaussian();
    var ny = r.nextGaussian();
    var x = nx * dx + mx;
    var y = ny * dy + my;
    fill(0);
    text('V', x, y);
    //ellipse(x, y, 5, 5);
};

cloud();

fill(219, 145, 48);
ellipse(300, 50, 50, 50);
for (var i=1; i<=3; i++){
    var s = i * 80;
    drawRange(i, 0.01, s);
}

for (; i < 60; i++){
    drawBird();
}





