<%--
  Created by IntelliJ IDEA.
  User: 16321
  Date: 2021/10/5
  Time: 11:11
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
    <title>商品详情-橘子校园</title>
    <link rel="shortcut icon" href="image/橘子.png" type="image/x-icon">
    <link href="http://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
    <link href="http://cdn.bootcss.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/bootsnav.css">
    <link rel="stylesheet" href="css/snav.css">
    <link rel="stylesheet" href="css/shoppingCart.css">
    <link rel="stylesheet" href="css/starability-basic.min.css">
    <link rel="stylesheet" href="css/detail.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/tipBox.css">
</head>

<body>
<div class="tn-box" style="z-index: 2;width: auto;">
    <div><img src="image/提示.png" style="margin-bottom: 3px;"></div>
    <p style="font-size: 14px;float: left;"></p>
</div>
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
<div class="main">
    <div class="goods_detail">
        <div class="preview_img">
            <img id="before" src="image/card2.jpg">
            <div id="mask"></div>
            <div id="big">
                <img id="after" src="image/card2.jpg">
            </div>
        </div>
        <div class="textContent">
            <div class="text">
                <div id="userInfo">
                    <div><img src="image/未登录.png"></div>
                    <p>用户名</p>
                </div>
                <p id="goodsName">商品名称</p>
                <p id="desc">商品描述</p>
                <div class="goodsInfo">
                    <div><img src="image/分期－价格排序.png"></div>
                    <p style="font-size: 17px;font-weight: 600;color: brown;">￥100</p>
                </div>
                <div class="goodsInfo" id="labelsBox">
                    <div><img src="image/标签.png"></div>
                </div>
                <div class="goodsInfo">
                    <div><img src="image/联系方式.png"></div>
                    <div style="padding-top: 3px;" id="weChat_id"><a href="javascript:;" style="text-decoration: none;">登录后可查看联系方式</a>
                    </div>
                    <button id="addToCart">加入购物车</button>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="comment">
    <div class="container">
        <div class="tab-group">
            <section id="tab1" title="全部评论">
                <ul class="all_comments">
                </ul>
            </section>
            <section id="tab2" title="好评">
                <ul class="all_comments">
                </ul>
            </section>
            <section id="tab3" title="中评">
                <ul class="all_comments">
                </ul>
            </section>
            <section id="tab4" title="差评">
                <ul class="all_comments">
                </ul>
            </section>
        </div>
    </div>
</div>
<div class="model">
    <div class="header">
        <h4>发表评论</h4>
        <button id="close_icon">✖</button>
    </div>
    <div class="content">
        <div class="score">
            <fieldset class="starability-basic">
                <input type="radio" id="rate5" name="rating" value="5"/>
                <label for="rate5" title="Amazing"></label>
                <input type="radio" id="rate4" name="rating" value="4"/>
                <label for="rate4" title="Very good"></label>
                <input type="radio" id="rate3" name="rating" value="3"/>
                <label for="rate3" title="Average"></label>
                <input type="radio" id="rate2" name="rating" value="2"/>
                <label for="rate2" title="Not good"></label>
                <input type="radio" id="rate1" name="rating" value="1"/>
                <label for="rate1" title="Terrible" style="background-position: 0px -20px;"></label>
            </fieldset>
        </div>
        <textarea rows="4" placeholder="请输入评论内容..."></textarea>
    </div>
    <div class="model-footer">
        <button id="confirm" style="background-color: rgb(0,105,217);">确定</button>
        <button id="cancel" style="background-color: rgb(90,98,104);">取消</button>
    </div>
</div>
<div class="block"></div>
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
<script src="js/jquery-tab.js"></script>
<script src="js/detail.js"></script>
<script>
    $(function () {
        // Calling the plugin
        $('.tab-group').tabify();
        //添加发表评论按钮
        $('.tab-group .tab-nav button').text("发表评论");

        let tipBox = $('<div class="tipBox">' +
            '<ul>' +
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
        $('.container nav .shoppingCart a').click(function () {
            <c:choose>
            <c:when test="${sessionScope.user!=null}">
            window.location = 'myCart.jsp';
            </c:when>
            <c:otherwise>
            window.location = 'login.jsp';
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

        let id =${id};//获取该商品的id

        //根据id获取商品的全部信息
        $.ajax({
            url: '${pageContext.request.contextPath}/getOneGoods',
            method: 'post',
            data: {id: id},
            dataType: 'text',
            success: function (data) {
                let goods = JSON.parse(data);
                //获取发布该商品的用户信息
                $.ajax({
                    url: '${pageContext.request.contextPath}/getOneUser',
                    method: 'post',
                    data: {userId: goods.userId},
                    dataType: 'text',
                    success: function (data) {
                        let user = JSON.parse(data);
                        //渲染用户信息
                        $('#userInfo img').prop('src', user.iconUrl);
                        $('#userInfo p').text(user.username);
                        <c:if test="${sessionScope.user!=null}">
                        $('.goodsInfo a').text(user.weChatId);
                        </c:if>
                    }
                })
                //渲染商品信息
                $('.preview_img #before').prop('src', goods.imgUrl);
                $('.preview_img #after').prop('src', goods.imgUrl);
                $('#goodsName').text(goods.goodsName);
                $('#desc').text(goods.goodsDesc);
                $('.goodsInfo p').text("￥" + goods.price);
                if (goods.labels != null) {
                    let labels = goods.labels.split(",");
                    for (let i = 0; i < labels.length; i++) {
                        let labelItem = $('<button></button>');
                        labelItem.text(labels[i]);
                        $('#labelsBox').append(labelItem);
                    }
                }
            }
        })

        //将该商品加入购物车
        $('#addToCart').click(function () {
            <c:choose>
            <c:when test="${sessionScope.user!=null}">
            $.ajax({
                url: '${pageContext.request.contextPath}/addToCart',
                method: 'post',
                data: {userId: "${sessionScope.user.id}", goodsId: id},
                dataType: 'text',
                success: function (data) {
                    if (data === "null") {
                        $('.tn-box p').text("已经加入购物车");
                    } else {
                        $('.tn-box p').text("添加成功");
                    }
                    show_alert();
                }
            })
            </c:when>
            <c:otherwise>
            $('.tn-box p').text("请先登录");
            show_alert();
            </c:otherwise>
            </c:choose>
        })

        //根据id获取该商品的评论信息
        let commentType = 0;
        let getComment = function () {
            $.ajax({
                url: '${pageContext.request.contextPath}/getComment',
                method: 'post',
                data: {goodsId: id, commentType: commentType},
                dataType: 'text',
                success: function (data) {
                    if (data !== "") {
                        let comments = data.split("#");
                        comments.forEach((item) => {
                            let commentObject = JSON.parse(item);
                            let comment = $('<li><div class="user_pic"><img></div>' +
                                '<p style="float: left;"></p>' +
                                '<div class="score_box">' +
                                '<fieldset class="starability-basic">' +
                                '<input type = "radio" name = "rating" value = "5" />' +
                                '<label title = "Amazing" ></label>' +
                                '<input type="radio" name="rating" value="4"/>' +
                                '<label title="Very good"></label>' +
                                '<input type="radio" name="rating" value="3"/>' +
                                '<label title="Average"></label>' +
                                '<input type="radio" name="rating" value="2"/>' +
                                '<label title="Not good"></label>' +
                                '<input type="radio" name="rating" value="1"/>' +
                                '<label title="Terrible"></label>' +
                                '</fieldset>' +
                                '<p></p></div></li>')
                            $.ajax({
                                url: '${pageContext.request.contextPath}/getOneUser',
                                method: 'post',
                                data: {userId: commentObject.userId},
                                dataType: 'text',
                                success: function (data) {
                                    let user = JSON.parse(data);
                                    comment.find('img').prop('src', user.iconUrl);
                                    comment.children('p').text(user.username);
                                }
                            })
                            let score = commentObject.score;
                            if (score === 5) {
                                comment.find('label').each(function (i, dom) {
                                    $(dom).css('background-position', '0px -20px');
                                })
                            } else {
                                comment.find('label').eq(5 - score).prevAll('label').each(function (i, dom) {
                                    $(dom).css('background-position', '0px 0px');
                                })
                                comment.find('label').eq(4 - score).nextAll('label').each(function (i, dom) {
                                    $(dom).css('background-position', '0px -20px');
                                })
                            }
                            comment.find('.score_box p').text(commentObject.commentContent);
                            //将评论插入对应的类别
                            switch (commentType) {
                                case 0:
                                    $('#tab1 ul').append(comment);
                                    break;
                                case 1:
                                    $('#tab2 ul').append(comment);
                                    break;
                                case 2:
                                    $('#tab3 ul').append(comment);
                                    break;
                                case 3:
                                    $('#tab4 ul').append(comment);
                                    break;
                                default:
                                    break;
                            }
                        })
                    }
                }
            })
        }
        getComment();//初始时调用获取全部评论

        //隐藏评论框
        let hideModel = function () {
            $('.model').fadeOut();
            $('.block').hide();
        }
        //跳出提示信息框
        let show_alert = function () {
            $('.tn-box').addClass('tn-box-active');
            window.setTimeout(function () {
                $('.tn-box').removeClass('tn-box-active');
            }, 1000);
        }

        //点击提交评论按钮
        $('.model #confirm').click(function () {
            <c:choose>
            <c:when test="${sessionScope.user==null}">
            $('.tn-box p').text("请先登录");
            show_alert();
            </c:when>
            <c:otherwise>
            let formData = new FormData();//提交给后端的数据
            formData.append("goodsId", id);
            formData.append("userId", ${sessionScope.user.id});
            formData.append("commentContent", $('.model textarea').val());
            let scores = 0;//用户评分
            $('.model .score label').each(function (i, dom) {
                if ($(dom).css('background-position') == '0px -20px') {
                    scores++;
                }
            })
            formData.append("score", scores);
            $.ajax({
                url: '${pageContext.request.contextPath}/addComment',
                method: 'post',
                data: formData,
                processData: false,
                contentType: false,
                success: function () {
                    hideModel();
                }
            })
            </c:otherwise>
            </c:choose>
        })

        //点击评论栏的标签，切换评论种类
        $('.tab-group').on('click', '.tab-nav li', function () {
            $('.tab-group .tab-nav li').each(function (index, dom) {
                //切换标签
                if ($(dom).hasClass('active') && index != commentType) {
                    commentType = index;
                    $('.tab-group section').eq(index).find('ul').empty();
                    getComment();
                }
            })
        })

    })
</script>
</body>

</html>
