<%--
  Created by IntelliJ IDEA.
  User: 16321
  Date: 2021/10/5
  Time: 11:19
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
    <title>求购-橘子校园</title>
    <link rel="shortcut icon" href="image/橘子.png" type="image/x-icon">
    <link href="http://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
    <link href="http://cdn.bootcss.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/bootsnav.css">
    <link rel="stylesheet" href="css/snav.css">
    <link rel="stylesheet" href="css/shoppingCart.css">
    <link rel="stylesheet" href="css/find_goods.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/tipBox.css">
</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <nav class="navbar navbar-default navbar-mobile bootsnav on">
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
                        <li style="background: #ebebeb;"><a href="#" style="color: orange;">求购</a></li>
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
                        <img src="image/未登录.png">
                        <div id="login" style="text-align: left;"><a href="login.jsp" style="margin-left: 10px;">登录</a>
                        </div>
                    </div>
                </div>
            </nav>
        </div>
    </div>
</div>
<div class="main">
    <div class="seekInfo">
        <div class="info1">
            <div class="userInfo">
                <div><img src="image/未登录.png"></div>
                <p>用户名</p>
            </div>
            <div class="goods_name">
                <p>商品名称</p>
            </div>
            <div class="goods_desc">
                <p>简单描述</p>
            </div>
            <div class="price">
                <p style="float: left;">可接受价格：</p>
                <p>100~200</p>
            </div>
            <div class="price">
                <p style="float: left;">微信ID：</p>
                <p>csdfregr</p>
            </div>
        </div>
        <div class="info2">
            <div class="userInfo">
                <div><img src="image/未登录.png"></div>
                <p>用户名</p>
            </div>
            <div class="goods_name">
                <p>商品名称</p>
            </div>
            <div class="goods_desc">
                <p>简单描述</p>
            </div>
            <div class="price">
                <p style="float: left;">可接受价格：</p>
                <p>100~200</p>
            </div>
            <div class="price">
                <p style="float: left;">微信ID：</p>
                <p>csdfregr</p>
            </div>
        </div>
    </div>
</div>
<div class="pageBar">
    <ul class="pagination" id="pagination2"></ul>
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
<script src="js/jqPaginator.js"></script>
<script>
    $(function () {

        //分页
        let paging = function (total, current) {
            $('#pagination2').jqPaginator({
                totalPages: total,
                visiblePages: 5,
                currentPage: current,

                first: '<li class="first"><a href="javascript:void(0);">首页</a></li>',
                prev: '<li class="prev"><a href="javascript:void(0);">上一页</a></li>',
                next: '<li class="next"><a href="javascript:void(0);">下一页</a></li>',
                last: '<li class="last"><a href="javascript:void(0);">末页</a></li>',
                page: '<li class="page"><a href="javascript:void(0);">{{page}}</a></li>',
            });
        }

        let tipBox = $('<div class="tipBox"><ul>' +
            '<li style="border-bottom: 1px solid rgb(128,128,128);">' +
            '<a href="user_info.jsp">个人中心</a></li>' +
            '<li><form action="${pageContext.request.contextPath}/logOut" method="get"><a href="javascript:;">退出</a></form></li> </ul></div>');

        <c:if test="${sessionScope.user!=null}">
        $('#login a').text("${sessionScope.user.username}");
        $('.icon:eq(1) img').prop('src', "${sessionScope.user.iconUrl}");
        $('#login a').prop('href', 'javascript:;');
        $('.container nav').append(tipBox);
        </c:if>

        //点击购物车
        $('.container nav .shoppingCart a').click(function (){
            <c:choose>
            <c:when test="${sessionScope.user!=null}">
            window.location='myCart.jsp';
            </c:when>
            <c:otherwise>
            window.location='login.jsp';
            </c:otherwise>
            </c:choose>
        })

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

        let currentPage = 1;
        //页面初始化获取第一页的求购记录
        let getRecords = function () {
            $('.main').empty();
            $.ajax({
                url: '${pageContext.request.contextPath}/getRecords',
                method: 'post',
                data: {currentPage: currentPage},
                dataType: 'text',
                success: function (data) {
                    let records = data.split("#");
                    let totalPage = parseInt(records.pop());
                    paging(totalPage,currentPage);
                    //渲染求购记录
                    for (let i = 0; i < records.length; i += 2) {
                        let record1 = JSON.parse(records[i]);
                        if (i + 1 < records.length) {
                            let record2 = JSON.parse(records[i + 1]);
                            let seekInfo = $('<div class="seekInfo">' +
                                '<div class="info1">' +
                                '<div class="userInfo">' +
                                '<div><img src=""></div><p class="username"></p></div>' +
                                '<div class="goods_name"><p></p></div><div class="goods_desc"><p></p></div>' +
                                '<div class="price"><p style="float: left;">可接受价格：</p><p class="want_price"></p></div>' +
                                '<div class="price"><p style="float: left;">微信ID：</p><p class="weChat_id"></p></div></div>' +
                                '<div class="info2">' +
                                '<div class="userInfo">' +
                                '<div><img src=""></div><p class="username"></p></div>' +
                                '<div class="goods_name"><p></p></div><div class="goods_desc"><p></p></div>' +
                                '<div class="price"><p style="float: left;">可接受价格：</p><p class="want_price"></p></div>' +
                                '<div class="price"><p style="float: left;">微信ID：</p><p class="weChat_id"></p></div></div></div>');
                            $.ajax({
                                url: '${pageContext.request.contextPath}/getOneUser',
                                method: 'post',
                                data: {userId: record1.userId},
                                dataType: 'text',
                                success:function (data){
                                    let user = JSON.parse(data);
                                    seekInfo.find('.info1 img').prop('src',user.iconUrl);
                                    seekInfo.find('.info1 .username').text(user.username);
                                    seekInfo.find('.info1 .goods_name p').text(record1.title);
                                    seekInfo.find('.info1 .goods_desc p').text(record1.goodsDesc);
                                    seekInfo.find('.info1 .want_price').text(record1.wantPrice);
                                    seekInfo.find('.info1 .weChat_id').text(user.weChatId);
                                }
                            })
                            $.ajax({
                                url: '${pageContext.request.contextPath}/getOneUser',
                                method: 'post',
                                data: {userId: record2.userId},
                                dataType: 'text',
                                success:function (data){
                                    let user = JSON.parse(data);
                                    seekInfo.find('.info2 img').prop('src',user.iconUrl);
                                    seekInfo.find('.info2 .username').text(user.username);
                                    seekInfo.find('.info2 .goods_name p').text(record2.title);
                                    seekInfo.find('.info2 .goods_desc p').text(record2.goodsDesc);
                                    seekInfo.find('.info2 .want_price').text(record2.wantPrice);
                                    seekInfo.find('.info2 .weChat_id').text(user.weChatId);
                                }
                            })
                            $('.main').append(seekInfo);
                        }
                        else{
                            let seekInfo = $('<div class="seekInfo">' +
                                '<div class="info1">' +
                                '<div class="userInfo">' +
                                '<div><img src=""></div><p class="username"></p></div>' +
                                '<div class="goods_name"><p></p></div><div class="goods_desc"><p></p></div>' +
                                '<div class="price"><p style="float: left;">可接受价格：</p><p class="want_price"></p></div>' +
                                '<div class="price"><p style="float: left;">微信ID：</p><p class="weChat_id"></p></div></div></div>');
                            $.ajax({
                                url: '${pageContext.request.contextPath}/getOneUser',
                                method: 'post',
                                data: {userId: record1.userId},
                                dataType: 'text',
                                success:function (data){
                                    let user = JSON.parse(data);
                                    seekInfo.find('.info1 img').prop('src',user.iconUrl);
                                    seekInfo.find('.info1 .username').text(user.username);
                                    seekInfo.find('.info1 .goods_name p').text(record1.title);
                                    seekInfo.find('.info1 .goods_desc p').text(record1.goodsDesc);
                                    seekInfo.find('.info1 .want_price').text(record1.wantPrice);
                                    seekInfo.find('.info1 .weChat_id').text(user.weChatId);
                                }
                            })
                            $('.main').append(seekInfo);
                        }
                    }
                }
            })
        }
        getRecords();

        //点击分页栏的按钮，请求相应分页的数据
        $('.pageBar').on('click', function () {
            $('.pageBar ul .page').each(function (i, dom) {
                if ($(dom).hasClass('active')) {
                    if ($(dom).attr('jp-data') != currentPage) {
                        currentPage = parseInt($(dom).attr('jp-data'));
                        getRecords();
                    }
                    return;
                }
            })
        })
    })
</script>
</body>

</html>
