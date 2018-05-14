/**
 * Created by Administrator on 2017/11/23 0023.
 */
var canvas = document.getElementById("canvas");
var ctx = canvas.getContext("2d");
//调整画布的大小
var cw = canvas.width = window.innerWidth,
    cx = cw / 2;
var ch = canvas.height = window.innerHeight,
    cy = ch / 2;

ctx.fillStyle = "#000";
var linesNum = 16;
var linesRy = [];
var requestId = null;
//偶数是  h
//奇数是  v
//使用了  lineNum次此方法，即创建了lineNum个对象
//最终这 lineNum个对象被放在了linesRy数组里面
function Line(flag) {
    this.flag = flag;
    this.a = {};
    this.b = {};
    if (flag == "v") {//做了8次
        this.a.y = 0;
        this.b.y = ch;
        this.a.x = randomIntFromInterval(0, ch);//返回 0-ch的整数，如a(1123,0)
        this.b.x = randomIntFromInterval(0, ch);//返回 0-ch的整数，如b(1123,0)
    } else if (flag == "h") {//做了8次
        this.a.x = 0;
        this.b.x = cw;
        this.a.y = randomIntFromInterval(0, cw);
        this.b.y = randomIntFromInterval(0, cw);
    }
    this.va = randomIntFromInterval(25, 100) / 100;
    this.vb = randomIntFromInterval(25, 100) / 100;

    this.draw = function() {
        ctx.strokeStyle = "#ccc";
        ctx.beginPath();
        ctx.moveTo(this.a.x, this.a.y);
        ctx.lineTo(this.b.x, this.b.y);
        ctx.stroke();
    }

    this.update = function() {
        if (this.flag == "v") {
            this.a.x += this.va;
            this.b.x += this.vb;
        } else if (flag == "h") {
            this.a.y += this.va;
            this.b.y += this.vb;
        }

        this.edges();
    }

    this.edges = function() {
        if (this.flag == "v") {
            if (this.a.x < 0 || this.a.x > cw) {
                this.va *= -1;
            }
            if (this.b.x < 0 || this.b.x > cw) {
                this.vb *= -1;
            }
        } else if (flag == "h") {
            if (this.a.y < 0 || this.a.y > ch) {
                this.va *= -1;
            }
            if (this.b.y < 0 || this.b.y > ch) {
                this.vb *= -1;
            }
        }
    }

}

for (var i = 0; i < linesNum; i++) {
    var flag = i % 2 == 0 ? "h" : "v";
    var l = new Line(flag);
    linesRy.push(l);
}

function Draw() {
    requestId = window.requestAnimationFrame(Draw);
    ctx.clearRect(0, 0, cw, ch);

    for (var i = 0; i < linesRy.length; i++) {
        var l = linesRy[i];
        l.draw();
        l.update();
    }
    for (var i = 0; i < linesRy.length; i++) {
        var l = linesRy[i];
        for (var j = i + 1; j < linesRy.length; j++) {
            var l1 = linesRy[j]
            Intersect2lines(l, l1);
        }
    }
}

function Init() {
    linesRy.length = 0;
    for (var i = 0; i < linesNum; i++) {
        var flag = i % 2 == 0 ? "h" : "v";
        var l = new Line(flag);
        linesRy.push(l);
    }

    if (requestId) {
        window.cancelAnimationFrame(requestId);
        requestId = null;
    }

    cw = canvas.width = window.innerWidth,
        cx = cw / 2;
    ch = canvas.height = window.innerHeight,
        cy = ch / 2;

    Draw();
};

setTimeout(function() {
    Init();

    addEventListener('resize', Init, false);
}, 15);

function Intersect2lines(l1, l2) {
    var p1 = l1.a,
        p2 = l1.b,
        p3 = l2.a,
        p4 = l2.b;
    var denominator = (p4.y - p3.y) * (p2.x - p1.x) - (p4.x - p3.x) * (p2.y - p1.y);
    var ua = ((p4.x - p3.x) * (p1.y - p3.y) - (p4.y - p3.y) * (p1.x - p3.x)) / denominator;
    var ub = ((p2.x - p1.x) * (p1.y - p3.y) - (p2.y - p1.y) * (p1.x - p3.x)) / denominator;
    var x = p1.x + ua * (p2.x - p1.x);
    var y = p1.y + ua * (p2.y - p1.y);
    if (ua > 0 && ub > 0) {
        markPoint({
            x: x,
            y: y
        })
    }
}

function markPoint(p) {
    ctx.beginPath();
    ctx.arc(p.x, p.y, 2, 0, 2 * Math.PI);
    ctx.fill();
}

function randomIntFromInterval(mn, mx) {
    return ~~(Math.random() * (mx - mn + 1) + mn);
}