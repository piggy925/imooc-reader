<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>会员登录-慕课书评网</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1.0,user-scalable=no">
    <link rel="stylesheet" href="http://cdn.itlaoqi.com./resources/bootstrap4/css/bootstrap.css">
    <link rel="stylesheet" href="./resources/raty/lib/jquery.raty.css">

    <script src="http://cdn.itlaoqi.com./resources/jquery.3.3.1.min.js"></script>
    <script src="http://cdn.itlaoqi.com./resources/bootstrap4/js/bootstrap.min.js"></script>
    <style>
        .container {
            padding: 0px;
            margin: 0px;
        }

        .row {
            padding: 0px;
            margin: 0px;
        }

        .col- * {
            padding: 0px;
        }

        .description p {
            text-indent: 2em;
        }

        .description img {
            width: 100%;
        }

    </style>

</head>
<body>
<!--<div style="width: 375px;margin-left: auto;margin-right: auto;">-->
<div class="container ">
    <nav class="navbar navbar-light bg-white shadow">
        <ul class="nav">
            <li class="nav-item">
                <a href="/">
                    <img src="https://m.imooc.com/static/wap/static/common/img/logo2.png" class="mt-1"
                         style="width: 100px">
                </a>
            </li>
        </ul>
    </nav>


    <div class="container mt-2 p-2 m-0">
        <form id="frmLogin">
            <div class="passport bg-white">
                <h4 class="float-left">会员登录</h4>
                <h6 class="float-right pt-2"><a href="/register.html">会员注册</a></h6>
                <div class="clearfix"></div>
                <div class="alert d-none mt-2" id="tips" role="alert">

                </div>

                <div class="input-group  mt-2 ">
                    <input type="text" id="username" name="username" class="form-control p-4" placeholder="请输入用户名"
                           aria-label="Username" aria-describedby="basic-addon1">
                </div>

                <div class="input-group  mt-4 ">
                    <input id="password" name="password" class="form-control p-4" placeholder="请输入密码" type="password"
                           aria-describedby="basic-addon1">
                </div>

                <div class="input-group mt-4 ">
                    <div class="col-5 p-0">
                        <input type="text" id="verifyCode" name="vc" class="form-control p-4" placeholder="验证码">
                    </div>
                    <div class="col-4 p-0 pl-2 pt-0">
                        <img id="imgVerifyCode" src="/verify_code"
                             style="width: 120px;height:50px;cursor: pointer">
                    </div>

                </div>

                <a id="btnSubmit" class="btn btn-success  btn-block mt-4 text-white pt-3 pb-3">登&nbsp;&nbsp;&nbsp;&nbsp;录</a>
            </div>
        </form>

    </div>
</div>

<script>
    function showTips(isShow, css, text) {
        if (isShow) {
            $("#tips").removeClass("d-none")
            $("#tips").hide();
            $("#tips").addClass(css);
            $("#tips").text(text);
            $("#tips").fadeIn(200);
        } else {
            $("#tips").text("");
            $("#tips").fadeOut(200);
            $("#tips").removeClass();
            $("#tips").addClass("alert")
        }
    }

    function reloadVerifyCode() {
        $("#imgVerifyCode").attr("src", "/verify_code?ts=" + new Date().getTime());
    }

    $("#imgVerifyCode").click(function () {
        reloadVerifyCode();
    });

    $("#btnSubmit").click(function () {
        var username = $.trim($("#username").val());
        var regex = /^.{1,10}$/;
        if (!regex.test(username)) {
            showTips(true, "alert-danger", "用户名请输入正确格式（1-10位）");
            return;
        } else {
            showTips(false);
        }

        var password = $.trim($("#password").val());

        if (!regex.test(password)) {
            showTips(true, "alert-danger", "密码请输入正确格式（1-10位）");
            return;
        } else {
            showTips(false);
        }

        $btnReg = $(this);

        $btnReg.text("正在处理...");
        $btnReg.attr("disabled", "disabled");
        $.ajax({
            url: "/check_login",
            type: "post",
            dataType: "json",
            data: $("#frmLogin").serialize(),
            success: function (data) {
                console.info(data);
                if (data.code == "0") {
                    window.location = "/?ts=" + new Date().getTime();
                } else {
                    showTips(true, "alert-danger", data.msg);
                    reloadVerifyCode();
                    $btnReg.text("登录");
                    $btnReg.removeAttr("disabled");
                }
            }
        });
        return false;
    });


</script>
</body>
</html>