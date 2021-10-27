<%--
  Created by IntelliJ IDEA.
  User: 16321
  Date: 2021/10/5
  Time: 11:22
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
    <title>二手-橘子校园</title>
    <link rel="shortcut icon" href="image/橘子.png" type="image/x-icon">
    <link href="http://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
    <link href="http://cdn.bootcss.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/bootsnav.css">
    <link rel="stylesheet" href="css/snav.css">
    <link rel="stylesheet" href="css/shoppingCart.css">
    <link rel="stylesheet" href="css/goodList.css">
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
                        <li style="background: #ebebeb;"><a href="#" style="color: orange;">二手商品</a></li>
                        <li><a href="find_goods.jsp">求购</a></li>
                        <li><a href="javascript:;">联系我们</a></li>
                        <div class="shoppingCart">
                            <a>购物车</a>
                            <img src="image/购物车空.png" style="width: 30px;height: 30px;margin: 0 10px;">
                        </div>
                        <li class="dropdown">
                            <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">发布</a>
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
<div class="goods_nav">
    <div class="goods_list">
        <div id="title">主题市场</div>
        <ul>
            <li><a href="javascript:;">电子产品</a>
                <p>></p>
            </li>
            <li><a href="javascript:;">学习用品</a>
                <p>></p>
            </li>
            <li><a href="javascript:;">衣鞋伞帽</a>
                <p>></p>
            </li>
            <li><a href="javascript:;">生活用品</a>
                <p>></p>
            </li>
            <li><a href="javascript:;">体育器材</a>
                <p>></p>
            </li>
            <li><a href="javascript:;">乐器</a>
                <p>></p>
            </li>
            <li><a href="javascript:;">代步工具</a>
                <p>></p>
            </li>
            <li><a href="javascript:;">虚拟产品</a>
                <p>></p>
            </li>
        </ul>
    </div>
    <div class="trent-slider">
        <div class="t-slide current-t-slide">
            <img src="image/slide2.jpeg" alt=""/>
        </div>
        <div class="t-slide">
            <img src="image/slide3.jpeg" alt=""/>
        </div>
        <div class="t-slide">
            <img src="image/slide4.png" alt=""/>
        </div>
        <div class="t-slide">
            <img src="image/slide1.jpeg" alt=""/>
        </div>
        <div class="t-slider-controls">
            <div class="arrow right-arrow">
                <div class="arrow-container">
                    <div class="arrow-icon"><i class="fa fa-chevron-right" aria-hidden="true"></i></div>
                </div>
            </div>
            <div class="arrow left-arrow">
                <div class="arrow-container">
                    <div class="arrow-icon"><i class="fa fa-chevron-left" aria-hidden="true"></i></div>
                </div>
            </div>
            <div class="t-load-bar">
                <div class="inner-load-bar"></div>
            </div>
            <div class="t-dots-container">
                <div class="t-slide-dots-wrap">
                    <div class="t-slide-dots">

                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="sub_menu">
        <div class="menu_title">————————— 电子产品 —————————</div>
        <div class="content">
            <ul>
                <li>
                    <a href="javascript:;">
                        <img src="image/手机.jpg">
                        <p>手机</p>
                    </a>
                </li>
                <li>
                    <a href="javascript:;">
                        <img src="image/平板.jpg">
                        <p>平板</p>
                    </a>
                </li>
                <li>
                    <a href="javascript:;">
                        <img src="image/手环.jpg">
                        <p>手环</p>
                    </a>
                </li>
                <li>
                    <a href="javascript:;">
                        <img src="image/笔记本.jpg">
                        <p>笔记本</p>
                    </a>
                </li>
            </ul>
            <ul>
                <li>
                    <a href="javascript:;">
                        <img src="image/显示器.jpg">
                        <p>显示器</p>
                    </a>
                </li>
                <li>
                    <a href="javascript:;">
                        <img src="image/耳机.jpg">
                        <p>耳机</p>
                    </a>
                </li>
                <li>
                    <a href="javascript:;">
                        <img src="image/键盘.jpg">
                        <p>键盘</p>
                    </a>
                </li>
                <li>
                    <a href="javascript:;">
                        <img src="image/单反.jpg">
                        <p>单反</p>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <div class="sub_menu">
        <div class="menu_title">————————— 学习用品 —————————</div>
        <div class="content">
            <ul>
                <li>
                    <a href="javascript:;">
                        <img src="image/收音机.jpg">
                        <p>收音机</p>
                    </a>
                </li>
                <li>
                    <a href="javascript:;">
                        <img src="image/教材.jpg">
                        <p>教材</p>
                    </a>
                </li>
                <li>
                    <a href="javascript:;">
                        <img src="image/小说.jpg">
                        <p>小说</p>
                    </a>
                </li>
                <li>
                    <a href="javascript:;">
                        <img src="image/考试资料.jpg">
                        <p>考试资料</p>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <div class="sub_menu">
        <div class="menu_title">————————— 衣鞋伞帽 —————————</div>
        <div class="content">
            <ul>
                <li>
                    <a href="javascript:;">
                        <img src="image/上衣.jpg">
                        <p>上衣</p>
                    </a>
                </li>
                <li>
                    <a href="javascript:;">
                        <img src="image/裙子.jpg">
                        <p>裙子</p>
                    </a>
                </li>
                <li>
                    <a href="javascript:;">
                        <img src="image/裤子.jpg">
                        <p>裤子</p>
                    </a>
                </li>
                <li>
                    <a href="javascript:;">
                        <img src="image/鞋子.jpg">
                        <p>鞋子</p>
                    </a>
                </li>
            </ul>
            <ul>
                <li>
                    <a href="javascript:;">
                        <img src="image/帽子.jpg">
                        <p>帽子</p>
                    </a>
                </li>
                <li>
                    <a href="javascript:;">
                        <img src="image/伞.jpg">
                        <p>伞</p>
                    </a>
                </li>
                <li>
                    <a href="javascript:;">
                        <img src="image/包包.jpg">
                        <p>包</p>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <div class="sub_menu">
        <div class="menu_title">————————— 生活用品 —————————</div>
        <div class="content">
            <ul>
                <li>
                    <a href="javascript:;">
                        <img src="image/化妆护肤.jpg">
                        <p>化妆护肤</p>
                    </a>
                </li>
                <li>
                    <a href="javascript:;">
                        <img src="image/洗衣机.jpg">
                        <p>洗衣机</p>
                    </a>
                </li>
                <li>
                    <a href="javascript:;">
                        <img src="image/冰箱.jpg">
                        <p>冰箱</p>
                    </a>
                </li>
                <li>
                    <a href="javascript:;">
                        <img src="image/宿舍小锅.jpg">
                        <p>宿舍小锅</p>
                    </a>
                </li>
            </ul>
            <ul>
                <li>
                    <a href="javascript:;">
                        <img src="image/台灯.jpg">
                        <p>台灯</p>
                    </a>
                </li>
                <li>
                    <a href="javascript:;">
                        <img src="image/电热壶.jpg">
                        <p>电热壶</p>
                    </a>
                </li>
                <li>
                    <a href="javascript:;">
                        <img src="image/电风扇.jpg">
                        <p>电风扇</p>
                    </a>
                </li>
                <li>
                    <a href="javascript:;">
                        <img src="image/鞋架.jpg">
                        <p>鞋架</p>
                    </a>
                </li>
            </ul>
            <ul>
                <li>
                    <a href="javascript:;">
                        <img src="image/储物篮.jpg">
                        <p>储物篮</p>
                    </a>
                </li>
                <li>
                    <a href="javascript:;">
                        <img src="image/装饰品.jpg">
                        <p>宿舍装饰品</p>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <div class="sub_menu">
        <div class="menu_title">————————— 体育器材 —————————</div>
        <div class="content">
            <ul>
                <li>
                    <a href="javascript:;">
                        <img src="image/篮球.jpg">
                        <p>篮球</p>
                    </a>
                </li>
                <li>
                    <a href="javascript:;">
                        <img src="image/乒乓球拍.jpg">
                        <p>乒乓球拍</p>
                    </a>
                </li>
                <li>
                    <a href="javascript:;">
                        <img src="image/羽毛球拍.jpg">
                        <p>羽毛球拍</p>
                    </a>
                </li>
                <li>
                    <a href="javascript:;">
                        <img src="image/网球拍.jpg">
                        <p>网球拍</p>
                    </a>
                </li>
            </ul>
            <ul>
                <li>
                    <a href="javascript:;">
                        <img src="image/泳镜.jpg">
                        <p>泳镜</p>
                    </a>
                </li>
                <li>
                    <a href="javascript:;">
                        <img src="image/哑铃.jpg">
                        <p>哑铃</p>
                    </a>
                </li>
                <li>
                    <a href="javascript:;">
                        <img src="image/足球.jpg">
                        <p>足球</p>
                    </a>
                </li>
                <li>
                    <a href="javascript:;">
                        <img src="image/排球.jpg">
                        <p>排球</p>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <div class="sub_menu">
        <div class="menu_title">————————— 乐器 —————————</div>
        <div class="content">
            <ul>
                <li>
                    <a href="javascript:;">
                        <img src="image/吉他.jpg">
                        <p>吉他</p>
                    </a>
                </li>
                <li>
                    <a href="javascript:;">
                        <img src="image/小提琴.jpg">
                        <p>小提琴</p>
                    </a>
                </li>
                <li>
                    <a href="javascript:;">
                        <img src="image/电子琴.jpg">
                        <p>电子琴</p>
                    </a>
                </li>
                <li>
                    <a href="javascript:;">
                        <img src="image/口琴.jpg">
                        <p>口琴</p>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <div class="sub_menu">
        <div class="menu_title">————————— 代步工具 —————————</div>
        <div class="content">
            <ul>
                <li>
                    <a href="javascript:;">
                        <img src="image/小电驴.jpg">
                        <p>小电驴</p>
                    </a>
                </li>
                <li>
                    <a href="javascript:;">
                        <img src="image/自行车.jpg">
                        <p>自行车</p>
                    </a>
                </li>
                <li>
                    <a href="javascript:;">
                        <img src="image/平衡车.jpg">
                        <p>平衡车</p>
                    </a>
                </li>
                <li>
                    <a href="javascript:;">
                        <img src="image/滑板.jpg">
                        <p>滑板</p>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <div class="sub_menu">
        <div class="menu_title">————————— 虚拟产品 —————————</div>
        <div class="content">
            <ul>
                <li>
                    <a href="javascript:;">
                        <img src="image/会员.jpg">
                        <p>会员</p>
                    </a>
                </li>
                <li>
                    <a href="javascript:;">
                        <img src="image/校园网.jpg">
                        <p>校园网</p>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>
<section id="gallery-wrapper"></section>
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
<script src="js/main.js"></script>
<script src="js/pinterest_grid.js"></script>
<script src="js/jqPaginator.js"></script>
<script src="js/goodList.js"></script>
<script>
    $(function () {
        //瀑布流
        $("#gallery-wrapper").pinterest_grid();
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
        //当前商品种类
        let goodsType = "all";
        //当前页码
        let currentPage = 1;
        //登录后可查看的个人中心
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
        $('.container nav').on('click','.tipBox form a',function (){
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


        //将取到的商品对象显示在网页上
        let show_goods = function (data, current) {
            $('#gallery-wrapper').empty();
            let strArr = data.split("#");
            //取出总页数
            let pages = parseInt(strArr.pop());
            let goodsArr = [];//存放所有商品的JSON对象
            strArr.forEach((item) => {
                goodsArr.push(JSON.parse(item));
            })
            paging(pages, current);
            goodsArr.forEach((item) => {
                let goodsCard = $('<article class="white-panel">' +
                    '<img class="thumb">' +
                    '<h1><a href="javascript:;"></a></h1>' +
                    '<p></p>' +
                    '<form action="${pageContext.request.contextPath}/detail" method="get"><input type="text" name="id" style="display: none;">' +
                    '</form></article>');
                goodsCard.find('input').val(item.id);
                goodsCard.find('img').prop('src', item.imgUrl);
                goodsCard.find('a').text(item.goodsName);
                goodsCard.find('p').text(item.goodsDesc);
                $('#gallery-wrapper').append(goodsCard);
            })
        }
        //向后台请求商品数据
        let request_goods = function () {
            $.ajax({
                url: '${pageContext.request.contextPath}/getTypesGoods',
                method: 'post',
                data: {currentPage: currentPage, type: goodsType},
                dataType: 'text',
                success: function (data) {
                    show_goods(data, currentPage);
                }
            })
        }
        //展示全部商品
        request_goods();
        //点击商品目录中的具体种类的商品，显示该种类商品的全部记录
        $('.sub_menu li').click(function () {
            currentPage = 1;
            goodsType = $(this).find('p').text();
            request_goods();
        })
        //点击分页中的按钮，获取新的商品信息
        $('.pageBar').on('click', function () {
            $('.pageBar ul .page').each(function (i, dom) {
                if ($(dom).hasClass('active')) {
                    if ($(dom).attr('jp-data') != currentPage) {
                        currentPage = parseInt($(dom).attr('jp-data'));
                        request_goods();
                    }
                    return;
                }
            })
        })

        //点击对应的商品卡片，跳转到该商品的详情页面
        $('#gallery-wrapper').on('click', 'article', function () {
            $(this).find('form').submit();
        })
    })
</script>
</body>

</html>
