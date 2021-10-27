<%--
  Created by IntelliJ IDEA.
  User: 16321
  Date: 2021/9/17
  Time: 11:31
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
    <title>首页-橘子校园</title>
    <link rel="shortcut icon" href="image/橘子.png" type="image/x-icon">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/footer.css">
    <script src="js/jQuery.min.js"></script>
    <script src="js/index.js"></script>
    <script src="js/backTop.js"></script>
</head>

<body>
<a href="javascript:;" class="cd-top">Top</a>
<div class="main">
    <div id="login">
        <div><img src="image/登录-头像.png"></div>
        <a href="login.jsp" style="margin-left: 5px;">登录</a>
    </div>
    <div class="top">
        <div id="title">橘子校园</div>
        <div id="desc">— 专注校园二手 —</div>
        <div class="cardList">
            <div class="card" id="card1">
                <div class="block"></div>
                <div class="cardContent">
                    <h2>校园二手</h2>
                    <p>众里寻它，蓦然回首</p>
                    <p>而它就在 — 橘子求购</p>
                    <button><a href="goodList.jsp">校园二手</a></button>
                </div>
            </div>
            <div class="card" id="card2">
                <div class="block"></div>
                <div class="cardContent">
                    <h2>校园求购</h2>
                    <p>完好无损，不舍丢弃</p>
                    <p>或许有人正需要它</p>
                    <button><a href="find_goods.jsp">校园求购</a></button>
                </div>
            </div>
            <div class="card" id="card3">
                <div class="block"></div>
                <div class="cardContent">
                    <h2>发布商品</h2>
                    <p>带不走的东西，丢不掉的记忆</p>
                    <p>让小橘子，帮它找到新的主人</p>
                    <button><a href="release_goods.jsp">发布商品</a></button>
                </div>
            </div>
        </div>
    </div>
    <div class="desc">
        <h1 style="margin-top: 100px;text-align: center;color
            :rgb(136, 218, 136);">适合学生的交易平台</h1>
        <h3 style="margin: 10px; text-align: center;font-weight: 300;">为校园内的每一位学生提供优质的服务。以下是我们一直贯彻的事情</h3>
        <div class="container">
            <div class="picture"><img src="image/交易.jpeg"></div>
            <div class="content">
                <h1>足够的安全性</h1>
                <p>交易过程由买家和卖家对接，无需通过第三方沟通，信息对称，确保安全</p>
            </div>
        </div>
        <div class="container">
            <div class="content" style="margin-left: 64px;">
                <h1>快捷方便，随时可取</h1>
                <p>该平台支持的是校园内的二手交易，省去了物流，不需要等待，取件的时间根据两者之间的意愿决定</p>
            </div>
            <div class="picture"><img src="image/送货上门.jpeg"></div>
        </div>
        <div class="container">
            <div class="picture"><img src="image/购物.jpeg"></div>
            <div class="content">
                <h1>提供最简单的操作</h1>
                <p>只需要注册平台，便能够发布自己要出售的物品，能够查看自己所需物品的卖家的联系方式，无需繁琐操作</p>
            </div>
        </div>
        <div class="container">
            <div class="content" style="margin-left: 64px;">
                <h1>种类齐全，价格合理</h1>
                <p>该平台的物品种类丰富，相信你一定可以找到你想要的那一个，价格合理</p>
            </div>
            <div class="picture"><img src="image/多样化.png"></div>
        </div>
        <div style="clear:both"></div>
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
            <p>版权所有 © All Rights Reserved，xxxxxxxxxx</p>
        </div>
    </div>
</div>
<script>
    $(function () {
        let tipBox = $('<div class="tipBox"><ul>' +
            '<li style="border-bottom: 1px solid rgb(128,128,128);">' +
            '<a href="user_info.jsp">个人中心</a></li>' +
            '<li><form action="/outToIndex" method="get"><a href="javascript:;">退出</a></form></li> </ul></div>');

        <c:if test="${sessionScope.user!=null}">
        $('#login a').text("${sessionScope.user.username}");
        $('#login img').prop('src',"${sessionScope.user.iconUrl}");
        $('#login a').prop('href', 'javascript:;');
        $('#login').append(tipBox);
        </c:if>

        //退出登录
        $('#login').on('click','.tipBox form a',function (){
            $(this).parent().submit();
        })

        let flag1 = 0, flag2 = 0;
        $('#login a').on({
            mouseover: function () {
                tipBox.css('display', 'block');
                flag1 = 1;
            },
            mouseout: function () {
                flag1 = 0
            }
        });
        tipBox.on({
            mouseover: function () {
                flag2 = 1
            },
            mouseout: function () {
                flag2 = 0
            }
        });
        setInterval(function () {
            if (!flag1 && !flag2) {
                tipBox.css('display', 'none');
            }
        }, 10);
    })
</script>
</body>

</html>
