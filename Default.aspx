<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <style type="text/css">
            td { height:10px; width:10px; padding: 0px 0px 0px 0px; background-color:Blue }
            table { border: solid 1px black; }
            td.me { background-color:Green; } 
            td.on { background-color:Olive; }
    </style>
    <script type="text/javascript" src="jquery-1.5.js"></script>          
    <script type="text/javascript">
        var x = 0, y = 0;
        var N = 50;
        var dir = 0;
        var intervalID;
        var Board;
        var ball_x = N / 2 + 3;
        var ball_y = N / 2;
        var ball_dir = 1;

        function getNextBallDir() {
            old_x = ball_x;
            old_y = ball_y;
            switch (ball_dir) {
                case 0:
                    ball_x++;
                    ball_y++;
                    break;
                case 1:
                    ball_x--;
                    ball_y--;
                    break;
                case 2:
                    ball_x++;
                    ball_y--;
                    break;
                case 3:
                    ball_x--;
                    ball_y++;
                    break;
            }
            
            if (Board[ball_x][ball_y] == 1) {
                ball_x = old_x;
                ball_y = old_y;
                return false;
            }
            return true;
        }

        function moveBalls() {
            old_x = ball_x;
            old_y = ball_y;
            getcell(ball_x, ball_y).css("background-color", "Blue"); // off

            times = 0;
            while (!getNextBallDir()) {
                ball_dir = Math.floor(Math.random() * 4);
                times++;
                if (times > 10)
                    break;  
            }

            getcell(ball_x, ball_y).css("background-color", "White"); // ball
                //if (Math.random() < 0.1)
                    //change = true;

        }

        function fillBall(x, y) {
            if (Board[x][y] == 9 || Board[x][y] == 1)
                return;
            Board[x][y] = 9;
            
            fillBall(x + 1, y);
            fillBall(x - 1, y);
            fillBall(x, y + 1);
            fillBall(x, y - 1);
        }

        function doFill() {
            fillBall(ball_x, ball_y);
            
            for (i = 0; i < N; ++i) {
                for (j = 0; j < N; ++j) {
                    if (Board[i][j] == 0) {
                        // make mine
                        Board[i][j] = 1;
                        getcell(i, j).css("background-color", "Olive");  // on
                    }
                    else if (Board[i][j] == 9) {
                        // return to ball
                        Board[i][j] = 0;
                    }
                }
            }

        }

        var risk = false;
        
        function doMove() {
            findme().css("background-color", "Olive");  // on

            oldx = x, oldy = y;
            
            if (dir == 37) // left
                x--;
            if (dir == 38) // up
                y--;
            if (dir == 39) // right
                x++;
            if (dir == 40) // down
                y++;

            if (x < 0) x = 0;
            if (x > N - 1) x = N - 1;
            if (y < 0) y = 0;
            if (y > N - 1) y = N - 1;

            if (!risk) {
                if (Board[x][y] == 0)
                    risk = true;
            }
            else {
                if (Board[x][y] == 1) {
                    // returned to safety
                    risk = false;
                    doFill();
                }
                
            }
            
            Board[x][y] = 1;

            findme().css("background-color", "Green");  // me

            moveBalls();
        }

        function getcell(x, y) {
            return $("#board tr").eq(y).children().eq(x)
        }

        function findme() {
            return $("#board tr").eq(y).children().eq(x)
        }

        $(document).ready(function() {
            Board = new Array(N);
            for (i = 0; i < N; ++i)
                Board[i] = new Array(N);

            for (i = 0; i < N; ++i)
                for (j = 0; j < N; ++j)
                if (i < 2 || i > N - 3 || j < 2 || j > N - 3) {
                    Board[i][j] = 1;
                    getcell(i, j).css("background-color", "Olive");
                }
            else
                Board[i][j] = 0;

            findme().css("background-color", "Green");  // me
            intervalID = setInterval(doMove, 50);
        });

        $(document).keydown(function(e) {
            dir = e.which;
        });                       
    </script> 
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Literal ID="table1" runat="server"></asp:Literal>
    </div>
    </form>
</body>
</html>
