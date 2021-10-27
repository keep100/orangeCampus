<%--
  Created by IntelliJ IDEA.
  User: 16321
  Date: 2021/10/5
  Time: 15:05
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
    <title>发布求购-橘子校园</title>
    <link rel="shortcut icon" href="image/橘子.png" type="image/x-icon">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/release.css">
    <link rel="stylesheet" href="css/footer.css">
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        .common-footer p {
            margin-bottom: 0;
        }
    </style>
</head>
<body>
<div class="tn-box">
    <div><img src="image/提示.png" style="margin-bottom: 3px;"></div>
    <p style="font-size: 14px;float: left;"></p>
</div>
<div class="title">
    <div><img src="image/波浪线.png"></div>
    <p style="font-size: 30px;font-weight: bold;color: orange;float: left;">橘子校园</p>
    <div style="margin-left: 10px;"><img src="image/波浪线.png"></div>
</div>
<div id="main">
    <div style="text-align: center;">
        <p>发布求购</p>
    </div>
    <form action="${pageContext.request.contextPath}/addWantRecord">
        <input name="userId" value="${sessionScope.user.id}" style="display: none;">
        <div class="form-group">
            <label for="good_name">标题</label>
            <input type="email" class="form-control" id="good_name" aria-describedby="emailHelp"
                   placeholder="需要的商品" name="title">
        </div>
        <div class="form-group">
            <label for="desc">商品描述</label>
            <textarea class="form-control" id="desc" rows="3"
                      placeholder="关于商品的简单描述，让别人更清晰地了解你的需求" name="goodsDesc"></textarea>
        </div>
        <div class="form-group">
            <label for="price">可接受价格</label>
            <input type="number" class="form-control" id="price" aria-describedby="emailHelp"
                   placeholder="如100~200元" style="width: 40%;" name="wantPrice">
        </div>
        <div class="form-group">
            <label for="weChat_id">微信</label>
            <input type="email" class="form-control" id="weChat_id" aria-describedby="emailHelp"
                   placeholder="微信号" style="width: 30%;" name="weChatId">
        </div>
        <div style="width: 100%;text-align: center;">
            <button type="button" class="btn btn-primary">提 交</button>
        </div>
    </form>
</div>
<div class="common-footer">
    <div class="footerMain">
        <div>
            <p style="padding-top: 40px;"><strong>联系我们</strong> / contact us</p>
            <p style="padding-top: 20px;">Q Q：163256485</p>
            <p style="padding-top: 15px;">TEL: 13254881254</p>
            <p style="padding-top: 15px;">地址：广州番禺华南理工大学城校区</p>
        </div>
    </div>
    <div class="copyright">
        <p>版权所有 © All Rights Reserved，xxxxxxxxxxxxx</p>
    </div>
</div>
<script src="js/jQuery.min.js"></script>
<script>
    $(function () {
        let show_alert = function () {
            $('.tn-box').addClass('tn-box-active');
            window.setTimeout(function () {
                $('.tn-box').removeClass('tn-box-active');
            }, 1000);
        };

        $('.btn').click(function () {
            if ($('#good_name').val() == "") {
                $('.tn-box p').text("请填写标题");
                show_alert();
            } else if ($('#desc').val() == "") {
                $('.tn-box p').text("请填写描述");
                show_alert();
            } else if ($('#price').val() == "") {
                $('.tn-box p').text("请填写价格");
                show_alert();
            } else if ($('#weChat_id').val() == "") {
                $('.tn-box p').text("请填写微信号");
                show_alert();
            } else {
                <c:choose>
                <c:when test="${sessionScope.user==null}">
                $('.tn-box p').text("请先登录");
                show_alert();
                window.setTimeout(function () {
                    window.location.href = "login.jsp";
                }, 1500);
                </c:when>
                <c:otherwise>
                $('#main form').submit();
                </c:otherwise>
                </c:choose>
            }
        })
    })
</script>
</body>
</html>
