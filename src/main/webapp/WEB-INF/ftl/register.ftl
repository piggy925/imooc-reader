<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>会员注册-慕课书评网</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1.0,user-scalable=no">

    <link rel="stylesheet" href="/resources/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="/resources/raty/lib/jquery.raty.css">
    <script src="/resources/jquery.3.3.1.min.js"></script>
    <script src="/resources/bootstrap/bootstrap.min.js"></script>
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
                <h4 class="float-left">会员注册</h4>
                <h6 class="float-right pt-2"><a href="/login.html">会员登录</a></h6>
                <div class="clearfix"></div>
                <div class="alert d-none mt-2" id="tips" role="alert">

                </div>

                <div class="input-group  mt-2 ">
                    <input type="text" id="username" name="username" class="form-control p-4" placeholder="请输入用户名">
                </div>

                <div class="input-group  mt-4 ">
                    <input id="password" name="password" class="form-control p-4" placeholder="请输入密码" type="password">
                </div>

                <div class="input-group  mt-4 ">
                    <input type="text" id="nickname" name="nickname" class="form-control p-4" placeholder="请输入用户名"
                    >
                </div>

                <div class="input-group mt-4 ">
                    <div class="col-5 p-0">
                        <input type="text" id="verifyCode" name="vc" class="form-control p-4" placeholder="验证码">
                    </div>
                    <div class="col-4 p-0 pl-2 pt-0">
                        <!-- 验证码图片 -->
                        <img id="imgVerifyCode" src="/verifyCode"
                             style="width: 120px;height:50px;cursor: pointer">
                    </div>

                </div>

                <a id="btnSubmit" class="btn btn-success  btn-block mt-4 text-white pt-3 pb-3">注&nbsp;&nbsp;&nbsp;&nbsp;册</a>
            </div>
        </form>

    </div>
</div>


<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-body">
                您已注册成功
            </div>
            <div class="modal-footer">
                <a href="/login.html" type="button" class="btn btn-primary">去登录</a>
            </div>
        </div>
    </div>
</div>


<script>
    //控制错误信息的显示与隐藏
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

    //重新发送请求,刷新验证码
    function reloadVerifyCode() {
        $("#imgVerifyCode").attr("src", "/verifyCode?ts=" + new Date().getTime());
    }

    //点击验证码图片刷新验证码
    $("#imgVerifyCode").click(function () {
        reloadVerifyCode();
    });

    //点击提交按钮,向/registe发起ajax请求
    //提交请求包含四个参数
    //vc:前台输入验证码  username:用户名 password:密码 nickname:昵称
    $("#btnSubmit").click(function () {
        //表单校验
        var username = $.trim($("#username").val());
        var regex = /^.{6,10}$/;
        if (!regex.test(username)) {
            showTips(true, "alert-danger", "用户名请输入正确格式（6-10位）");
            return;
        } else {
            showTips(false);
        }

        var password = $.trim($("#password").val());

        if (!regex.test(password)) {
            showTips(true, "alert-danger", "密码请输入正确格式（6-10位）");
            return;
        } else {
            showTips(false);
        }

        $btnReg = $(this);

        $btnReg.text("正在处理...");
        $btnReg.attr("disabled", "disabled");

        //发送ajax请求
        $.ajax({
            url: "/register",
            type: "post",
            dataType: "json",
            data: $("#frmLogin").serialize(),
            success: function (data) {
                //结果处理,根据服务器返回code判断服务器处理状态
                //服务器要求返回JSON格式:
                //{"code":"0","msg":"处理消息"}
                console.info("服务器响应:", data);
                if (data.code == "0") {
                    //显示注册成功对话框
                    $("#exampleModalCenter").modal({});
                    $("#exampleModalCenter").modal("show");
                } else {
                    //服务器校验异常,提示错误信息
                    showTips(true, "alert-danger", data.msg);
                    reloadVerifyCode();
                    $btnReg.text("注    册");
                    $btnReg.removeAttr("disabled");
                }
            }
        });
        return false;
    });


</script>
</body>
</html>