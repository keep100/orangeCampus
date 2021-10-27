<%--
  Created by IntelliJ IDEA.
  User: 16321
  Date: 2021/9/17
  Time: 10:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登录-橘子校园</title>
    <link rel="shortcut icon" href="image/橘子.png" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="css/normalize.css">
    <link rel="stylesheet" type="text/css" href="css/default.css">
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <style>
        body {
            background: url("image/loginBg.jpeg") no-repeat;
            background-size: 100%;
        }

        .forgetPwd {
            display: none;
            position: absolute;
            top: 40%;
            left: 40%;
            width: 200px;
            background-color: rgb(40, 73, 116);
            opacity: 0.8;
            border-radius: 5px;
            color: whitesmoke;
            z-index: 2;
        }

        .forgetPwd .header {
            position: relative;
            margin-left: 20px;
        }

        .forgetPwd .header a {
            position: absolute;
            right: 10%;
            top: 0;
        }

        .forgetPwd .header a:hover {
            color: whitesmoke;
        }

        .forgetPwd .text {
            margin: 10px 10px;
        }

        .forgetPwd .text label {
            font-size: 14px;
            color: rgb(164, 168, 169);
        }

        .forgetPwd .text input {
            margin-top: 5px;
            background-color: rgb(81, 96, 130);
            padding: 3px 0 3px 6px;
            border-radius: 10px;
            color: whitesmoke;
        }

        .forgetPwd button {
            border-radius: 15px;
            border: none;
            padding: 5px 15px;
            margin-bottom: 5px;
            margin-left: 50px;
            background-color: rgb(227, 235, 247);
        }

        .forgetPwd button:hover {
            color: rgb(22, 100, 223);
        }

        #block {
            position: absolute;
            width: 100%;
            height: 100%;
            background-color: rgba(29, 27, 27, 0.36);
        }

        #title {
            position: absolute;
            left: 250px;
            top: 220px;
        }

        .sign-in-htm .group {
            margin-top: 30px;
        }

        .sign-in-htm .hr {
            margin: 25px 0 30px 0;
        }

        .sign-up-htm .hr {
            margin: 15px 0 25px 0;
        }

        .sign-up-htm .group .input {
            padding: 5px 15px;
        }

        .sign-up-htm .group .button {
            margin: 35px 0 15px 0;
        }

        .tn-box {
            height: 30px;
            line-height: 30px;
            position: absolute;
            top: 50%;
            left: 50%;
            margin-top: -15px;
            margin-left: -60px;
            padding-right: 10px;
            text-align: center;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgb(145, 145, 145);
            background: whitesmoke;
            display: none;
            z-index: 1;
        }

        .tn-box-active {
            display: block;
            animation: fadeOut 1s linear forwards;
        }

        @keyframes fadeOut {
            0% {
                opacity: 0;
            }
            10% {
                opacity: 1;
            }
            90% {
                opacity: 1;
                transform: translateY(0px);
            }
            99% {
                opacity: 0;
                transform: translateY(-30px);
            }
            100% {
                opacity: 0;
            }
        }

        .tn-box div {
            float: left;
            height: 100%;
            width: 40px;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="tn-box">
    <div><img src="image/提示.png" style="margin-bottom: 3px;"></div>
    <p style="font-size: 14px;float: left;margin-top: 0px;"></p>
</div>
<div id="block"></div>
<div id="title">
    <div style="font-size:45px;color: antiquewhite;">橘子校园</div>
    <div style="color: antiquewhite;margin-top: 20px;text-align: center;">-专注于校园二手-</div>
</div>
<div class="login-wrap">
    <div class="login-html">
        <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">登 录</label>
        <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">注 册</label>
        <div class="login-form">
            <div class="sign-in-htm">
                <form action="${pageContext.request.contextPath}/login" method="post" id="loginForm">
                    <div class="group">
                        <label class="label">用户名</label>
                        <input type="text" class="input" name="username" id="usernameInput">
                    </div>
                    <div class="group">
                        <label class="label">密码</label>
                        <input type="password" class="input" data-type="password" name="password" id="pwd">
                    </div>
                    <div class="group" style="margin-bottom: 50px;">
                        <input type="button" class="button" value="登         录">
                    </div>
                </form>
                <div class="hr"></div>
                <div class="foot-lnk">
                    <a href="javascript:;">忘记密码?</a>
                </div>
            </div>
            <div class="sign-up-htm">
                <form id="signUpForm" action="${pageContext.request.contextPath}/register" method="post">
                    <div class="group">
                        <label class="label">用户名</label>
                        <input type="text" class="input" id="new_username" name="username">
                    </div>
                    <div class="group">
                        <label class="label">密码</label>
                        <input type="password" class="input" data-type="password" id="new_pwd" name="password">
                    </div>
                    <div class="group">
                        <label class="label">确认密码</label>
                        <input type="password" class="input" data-type="password" id="confirm_pwd">
                    </div>
                    <div class="group">
                        <label class="label">手机号</label>
                        <input type="text" class="input" id="tel" name="tel">
                    </div>
                    <div class="group">
                        <input type="button" class="button" value="注         册">
                    </div>
                </form>
                <div class="hr"></div>
                <div class="foot-lnk">
                    <label for="tab-1">已注册？直接登录</label>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="forgetPwd">
    <div class="header">
        <h4>忘记密码</h4>
        <a href="javascript:;">✖</a>
    </div>
    <div class="findPwd">
        <div class="text" id="telBox">
            <label for="telInput">请输入手机号</label>
            <input type="text" name="tel" id="telInput">
        </div>
        <div class="text" style="display: none;" id="pwdBox">
            <label for="pwdBack">您的密码</label>
            <input type="text" id="pwdBack">
        </div>
    </div>
    <button>查找密码</button>
</div>
<script src="js/jQuery.min.js"></script>
<script>
    $(function () {
        let show_alert = function () {
            $('.tn-box').addClass('tn-box-active');
            window.setTimeout(function () {
                $('.tn-box').removeClass('tn-box-active');
            }, 1000);
        }
        <c:if test="${flag==0}">
        $('.tn-box p').text("用户名不存在或密码错误");
        show_alert();
        </c:if>
        <c:if test="${register_success!=null}">
        $('.tn-box p').text("${register_success}");
        show_alert();
        </c:if>
        $('#loginForm .button').click(function () {
            //验证数据
            if (!$('#usernameInput').val()) {
                $('.tn-box p').text("请输入用户名");
                show_alert();
                $('#usernameInput').focus();
                return;
            }
            if (!$('#pwd').val()) {
                $('.tn-box p').text("请输入密码");
                show_alert();
                $('#pwd').focus();
                return;
            }
            //提交表单
            $('#loginForm').submit();
        })
        $('#signUpForm .button').click(function () {
            //验证数据
            if (!$('#new_username').val()) {
                $('.tn-box p').text("请输入用户名");
                show_alert();
                $('#new_username').focus();
                return;
            }
            if (!$('#new_pwd').val()) {
                $('.tn-box p').text("请输入密码");
                show_alert();
                $('#new_pwd').focus();
                return;
            }
            if ($('#new_pwd').val() != $('#confirm_pwd').val()) {
                $('.tn-box p').text("请确认密码");
                show_alert();
                $('#confirm_pwd').focus();
                return;
            }
            if (!$('#tel').val()) {
                $('.tn-box p').text("请输入手机号");
                show_alert();
                $('#tel').focus();
                return;
            }
            if ($('#tel').val().length != 11) {
                $('.tn-box p').text("请输入11位手机号");
                show_alert();
                $('#tel').focus();
                return;
            }
            //提交注册表单
            $('#signUpForm').submit();
        })
        $('#new_username').blur(function () {
            $.ajax({
                url: '${pageContext.request.contextPath}/register',
                method: 'post',
                data: {username: $('#new_username').val()},
                dataType: 'text',
                success: function (data) {
                    if (data === "true") {
                        $('.tn-box p').text("用户名已存在");
                        show_alert();
                        $('#new_username').focus();
                    }
                }
            })
        })
        $('.foot-lnk a').click(function () {
            $('#block').css('z-index', 1);
            $('.forgetPwd').show();
            $('.forgetPwd #telBox').show();
            $('.forgetPwd #pwdBox').hide();
        })
        $('.forgetPwd .header a').click(function () {
            $('#block').css('z-index', 0);
            $('.forgetPwd').hide();
        })
        $('.forgetPwd button').click(function () {
            $('.forgetPwd #telBox').hide();
            $('.forgetPwd #pwdBox').show();
            $.ajax({
                url: '${pageContext.request.contextPath}/findPwd',
                method: 'post',
                data: {tel:$('.forgetPwd #telInput').val()},
                dataType: 'text',
                success:function (data){
                    $('.forgetPwd #pwdBack').val(data);
                }
            })
        })
    })
</script>
</body>
</html>
