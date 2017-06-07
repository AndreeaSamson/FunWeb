<!DOCTYPE html>
<html>
<head>
    <title>IO chat</title>
    <link rel = "stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/2.0.2/socket.io.js"></script>
    <style >
        body{
            margin-top: 30px;
        }

    </style>
</head>
<body>
<div class = "container">

    <%--<div id = "userFormArea" class= "row">--%>
    <%--<div class = "col-md-12">--%>
    <%--<form id = "userForm">--%>
    <%--<div class = "form-group">--%>
    <%--<label>Enter Username</label>--%>
    <%--<input class = "form-control" id = "username">--%>
    <%--<br/>--%>
    <%--<input type="submit" class = "btn btn-primary" value = " Login"/>--%>
    <%--</div>--%>
    <%--</form>--%>

    <%--</div>--%>
    <%--</div>--%>
    <div class = "row" id = "messageArea">
        <div class = "col-md-4">
            <div class = "well">
                <h3> Online users </h3>
                <ul class = "list-group" id = "users"> </ul>

            </div>

        </div>
        <div class = "col-md-8">
            <div class="chat" id = "chat"> </div>

            <form id = "messageForm">
                <div class = "form-group">
                    <label>Enter Message</label>
                    <textarea class = "form-control" id = "message"> </textarea>
                    <br/>
                    <input type="submit" class = "btn btn-primary" value = "Send Message"/>
                </div>
            </form>
        </div>

    </div>

</div>
<script>
    // TODO: refactor this to external file
    $(function(){
        var socket = io.connect("http://localhost:3000");
        var $messageForm = $('#messageForm');
        var $message = $('#message');
        var $chat = $('#chat');
        var $userFormArea = $('#userFormArea');
        var $userForm = $('#userForm');
        var $messageArea = $('#messageArea');
        var $users = $('#users');
        var $username = '${username}';// This value is provided by spring

        setTimeout(function () {
            socket.emit('new user', $username, function (data) {
                console.log("dfsdf");
            });
        }, 1000);

        $messageForm.submit(function(e){
            e.preventDefault();
            socket.emit('send message', $message.val());
            $message.val('');
        });

        socket.on('new message', function(data){
            $chat.append('<div class = "well"><strong>'+data.user+'</strong>:' + data.msg + '<div>');
        });

//        $userForm.submit(function(e){
//            e.preventDefault();
//            socket.emit('new user', $username.val(),function(data){
//                if(data){
//                    $userFormArea.hide();
//                    $messageArea.show();
//                }
//            });
//            $username.val('');
//        });
        socket.on('get users', function(data){
            var html = '';
            for (var i = 0; i < data.length; i++){
                html +='<li class = "list-group-item" >' + data[i]+ '</li>';
            }
            $users.html(html);
        });
    });

</script>
</body>
</html>