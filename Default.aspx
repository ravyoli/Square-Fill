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

        function doMove() {
            var me = findme();
            me.css("background-color", "Olive");  // on

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

            var me = findme();
            me.css("background-color", "Green");  // me

            // stop moving when reached a wall
            //if (oldx == x && oldy == y)
                //clearInterval(intervalID);
        }

        function findme() {
            return $("#board tr").eq(y).children().eq(x)
        }

        $(document).ready(function() {
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
