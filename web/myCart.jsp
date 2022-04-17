<%--
  Created by IntelliJ IDEA.
  User: 16321
  Date: 2021/10/21
  Time: 9:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>二手-橘子校园</title>
    <link rel="shortcut icon" href="image/橘子.png" type="image/x-icon">
    <link href="http://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
    <link href="http://cdn.bootcss.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/bootsnav.css">
    <link rel="stylesheet" href="css/snav.css">
    <link rel="stylesheet" href="css/shoppingCart.css">
    <link rel="stylesheet" href="css/myCart.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/tipBox.css">
    <style>
        .common-footer p {
            margin-bottom: 0;
        }
    </style>
</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <nav class="navbar navbar-default navbar-mobile bootsnav on"
                 style="position: relative;margin-bottom: 10px;">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu">
                        <i class="fa fa-bars"></i>
                    </button>
                </div>
                <div class="collapse navbar-collapse" id="navbar-menu">
                    <div class="icon">
                        <img src="image/橘子.png">
                        <div>橘子校园</div>
                    </div>
                    <ul class="nav navbar-nav" data-in="fadeInDown" data-out="fadeOutUp">
                        <li><a href="/">主页</a></li>
                        <li><a href="goodList.jsp">二手商品</a></li>
                        <li><a href="find_goods.jsp">求购</a></li>
                        <li><a href="#">联系我们</a></li>
                        <div class="shoppingCart">
                            <a>购物车</a>
                            <img src="image/购物车空.png" style="width: 30px;height: 30px;margin: 0 10px;">
                        </div>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">发布</a>
                            <ul class="dropdown-menu animated">
                                <li style="border-bottom: 1px solid gray;">
                                    <div style="height: 40px;display: flex;align-items: center;">
                                        <div class="release"><img src="image/发布商品.png"></div>
                                        <div><a href="release_goods.jsp">发布商品</a></div>
                                    </div>
                                </li>
                                <li>
                                    <div style="height: 40px;display: flex;align-items: center;">
                                        <div class="release"><img src="image/发布求购.png"></div>
                                        <div><a href="seek_goods.jsp">发布求购</a></div>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                    <div class="icon" style="margin:10px 0 0 15px;overflow: hidden;width: 200px;">
                        <img src="${sessionScope.user.iconUrl}">
                        <div id="login" style="text-align: left;"><a href="javascript:;"
                                                                     style="margin-left: 10px;">${sessionScope.user.username}</a>
                        </div>
                    </div>
                </div>
            </nav>

        </div>
    </div>
</div>
<div class="title">
    <h2 style="color: coral;"><strong>我的购物车</strong></h2>
    <form action="${pageContext.request.contextPath}/delAll" method="get">
        <input type="text" name="userId" value="${sessionScope.user.id}" style="display: none;">
        <input type="text" id="flagInput" name="buyFlag" value="false" style="display: none;">
        <button type="submit">清空购物车</button>
        <button type="button" style="margin-right: 10px" id="buy">付款购买</button>
        <a href="buyRecord.jsp" style="text-decoration: none;margin-right: 10px;color: #2f3238;
height: 40px;line-height: 40px;">购买记录</a>
    </form>
</div>
<div class="allGoods">
    <ul>
    </ul>
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
<script src="http://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootsnav.js"></script>
<script>
    $(function () {
        let tipBox = $('<div class="tipBox">' +
            '<ul>' +
            '<li style="border-bottom: 1px solid rgb(128,128,128);">' +
            '<a href="user_info.jsp">个人中心</a></li>' +
            '<li><form action="${pageContext.request.contextPath}/logOut" method="get"><a href="javascript:;">退出</a></form></li> </ul></div>');
        $('.container nav').append(tipBox);

        //退出登录
        $('.container nav').on('click', '.tipBox form a', function () {
            $(this).parent().submit();
        })

        let flag1 = 0, flag2 = 0;
        $('#login').siblings('img').on({
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

        //请求该用户购物车中所有的商品条目
        $.ajax({
            url: '${pageContext.request.contextPath}/getCartRecord',
            method: 'post',
            data: {userId: "${sessionScope.user.id}"},
            dataType: 'text',
            success: function (data) {
                let cartItems = data.split("#");
                cartItems.forEach((item) => {
                    let cartObj = JSON.parse(item);
                    let goodsMenu = $('<li>' +
                        '<img style="margin-left: 30px;">' +
                        '<a href="javascript:;" id="goodsName">商品名称</a>' +
                        '<form action="${pageContext.request.contextPath}/detail" method="get">' +
                        '<input type="text" name="id" style="display: none;"></form>' +
                        '<label style="margin:0 250px;">价格</label>' +
                        '<a href="javascript:;" style="margin-right: 50px;" id="del">删除</a></li>');
                    goodsMenu.find('input').val(cartObj.goodsId);
                    $.ajax({
                        url: '${pageContext.request.contextPath}/getOneGoods',
                        method: 'post',
                        data: {id: cartObj.goodsId},
                        dataType: 'text',
                        success: function (data) {
                            let goods = JSON.parse(data);
                            goodsMenu.find('img').prop('src', goods.imgUrl);
                            goodsMenu.find('#goodsName').text(goods.goodsName);
                            goodsMenu.find('label').text("￥" + goods.price);
                        }
                    })
                    $('.allGoods ul').prepend(goodsMenu);
                })
            }
        })


        //点击商品名称跳转到对应商品详情
        $('.allGoods ul').on('click', 'li #goodsName', function () {
            $(this).siblings('form').submit();
        })

        //删除指定的商品条目
        $('.allGoods ul').on('click', 'li #del', function () {
            $(this).parent().remove();
            $.ajax({
                url: '${pageContext.request.contextPath}/delOneCartRecord',
                method: 'post',
                data: {userId:${sessionScope.user.id}, goodsId: $(this).parent().find('input').val()}
            })
        })

        //购买全部商品并发送发货邮件
        $('#buy').click(function (){
            $('#flagInput').val('true');
            $(this).parent().submit();
        })
    })
</script>
</body>

</html>
