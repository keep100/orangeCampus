<%--
  Created by IntelliJ IDEA.
  User: 16321
  Date: 2021/10/5
  Time: 15:13
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
    <title>个人中心-橘子校园</title>
    <link rel="shortcut icon" href="image/橘子.png" type="image/x-icon">
    <link href="http://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
    <link href="http://cdn.bootcss.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/bootsnav.css">
    <link rel="stylesheet" href="css/snav.css">
    <link rel="stylesheet" href="css/shoppingCart.css">
    <link rel="stylesheet" href="css/user_info.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/tipBox.css">
    <style>
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
                        <div id="login" style="text-align: left;"><a href="javascript:;"
                                                                     style="margin-left: 10px;">${sessionScope.user.username}</a>
                        </div>
                    </div>
                </div>
            </nav>
        </div>
    </div>
</div>
<div id="main">
    <div class="tab_title">
        <ul>
            <li class="current">个人信息</li>
            <li>我的商品</li>
            <li>我的求购</li>
        </ul>
    </div>
    <div>
        <form>
            <div class="form-group">
                <label for="username">昵称</label>
                <input type="email" value="${sessionScope.user.username}" class="form-control" id="username"
                       aria-describedby="emailHelp" name="username">
            </div>
            <div class="form-group">
                <label for="sign">个性签名</label>
                <textarea class="form-control" id="sign" rows="3" name="signature"></textarea>
            </div>
            <div class="form-group">
                <label>头像</label>
                <div class="upload">
                    <div>上传头像</div>
                    <input type="file" name="iconUrl">
                    <img src="${sessionScope.user.iconUrl}">
                </div>

            </div>
            <div class="form-group">
                <label for="weChat_id">微信号</label>
                <input type="email" class="form-control" id="weChat_id" aria-describedby="emailHelp"
                       style="width: 50%;" value="${sessionScope.user.weChatId}" name="weChatId">
            </div>
            <div style="width: 100%;text-align: center;">
                <button type="button" class="btn btn-primary" id="save">保 存</button>
                <button type="button" class="btn btn-primary" id="cancel">取 消</button>
            </div>
        </form>
    </div>
    <div class="goodsInfo">
        <ul>
        </ul>
    </div>
    <div class="goodsInfo">
        <ul>
        </ul>
    </div>
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
        $('.icon:eq(1) img').prop('src', "${sessionScope.user.iconUrl}");
        $('#sign').val("${sessionScope.user.signature}");

        let tipBox = $('<div class="tipBox">' +
            '<ul>' +
            '<li style="border-bottom: 1px solid rgb(128,128,128);">' +
            '<a href="user_info.jsp">个人中心</a></li>' +
            '<li><form action="${pageContext.request.contextPath}/logOut" method="get"><a href="javascript:;">退出</a></form></li> </ul></div>');
        $('.container nav').append(tipBox);

        //点击购物车
        $('.container nav .shoppingCart a').click(function () {
            window.location = 'myCart.jsp';
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

        //切换tab选项
        $('.tab_title li').click(function () {
            $(this).siblings().removeClass('current');
            $(this).addClass('current');
            let index = $(this).index();
            $(this).parent().parent().siblings('div').hide();
            $(this).parent().parent().siblings('div')[index].style.display = 'block';
        })

        //点击取消按钮刷新页面，恢复修改前的数据
        $('#cancel').click(function () {
            window.location.reload();
        })

        //弹出警告框
        let show_alert = function (content) {
            $('.tn-box p').text(content);
            $('.tn-box').addClass('tn-box-active');
            window.setTimeout(function () {
                $('.tn-box').removeClass('tn-box-active');
            }, 1000);
        }

        //本地预览上传图片
        $('.upload input').change(function () {
            let filePath = $(this).val(), fileFormat = filePath.substring(filePath.lastIndexOf(".")).toLowerCase(),
                src = window.URL.createObjectURL(this.files[0]);
            //检查是否为图片
            if (!fileFormat.match(/.png|.jpg|.jpeg/)) {
                show_alert("只能上传图片");
            } else {
                $('.upload img').prop('src', src);
            }
        })

        //点击保存按钮
        $('#save').click(function () {
            if ($('#username').val() === "") {
                show_alert("昵称不能为空");
                return;
            }
            if ($('#weChat_id').val() === "") {
                show_alert("微信号不能为空");
                return;
            }

            let formData = new FormData($('#main form')[0]);
            formData.append("id", ${sessionScope.user.id});
            if ($('.upload input').val() !== "") {
                let src = window.URL.createObjectURL($('.upload input')[0].files[0]);
                formData.append("iconName", src.substring(src.lastIndexOf("/") + 1));
            }
            //更新用户信息
            $.ajax({
                url: '${pageContext.request.contextPath}/updateUserInfo',
                method: 'post',
                data: formData,
                processData: false,
                contentType: false
            })
        })

        //获取该用户发布的全部商品信息
        $('.tab_title li:eq(1)').one('click', function () {
            $.ajax({
                url: '${pageContext.request.contextPath}/getReleased',
                method: 'post',
                data: {userId: "${sessionScope.user.id}"},
                dataType: "text",
                success: function (data) {
                    if (data !== "") {
                        let releasedGoods = data.split('#');
                        releasedGoods.forEach((item) => {
                            let goods = JSON.parse(item);
                            let li = $('<li><input style="display: none;"><img>' +
                                '<p style="margin-bottom: 0;"></p>' +
                                '<label style="margin: 0 50px 0 100px;"></label>' +
                                '<a href="javascript:;" class="delReleased">下架商品</a></li>');
                            li.find('input').val(goods.id);
                            li.find('img').prop('src', goods.imgUrl);
                            li.find('p').text(goods.goodsName);
                            li.find('label').text(goods.price);
                            $('.goodsInfo:eq(0) ul').prepend(li);
                        })
                    }
                }
            })
        })

        //获取该用户发布的全部求购信息
        $('.tab_title li:eq(2)').one('click', function () {
            $.ajax({
                url: '${pageContext.request.contextPath}/getMySeek',
                method: 'post',
                data: {userId: "${sessionScope.user.id}"},
                dataType: 'text',
                success: function (data) {
                    if (data !== "") {
                        let seekRecords = data.split('#');
                        seekRecords.forEach((item) => {
                            let seekInfo = JSON.parse(item);
                            let li = $('<li><input style="display: none;">' +
                                '<label style="margin:0 50px 0 0;"></label>' +
                                '<p style="margin-bottom: 0;"></p>'+
                                '<a href="javascript:;" class="delSeekInfo">删除求购</a></li>');
                            li.find('input').val(seekInfo.id);
                            li.find('label').text(seekInfo.title);
                            li.find('p').text(seekInfo.goodsDesc);
                            $('.goodsInfo:eq(1) ul').prepend(li);
                        })
                    }
                }
            })
        })

        //下架商品
        $('.goodsInfo ul').on('click', 'li .delReleased', function () {
            $(this).parent().remove();
            $.ajax({
                url: '${pageContext.request.contextPath}/offShelf',
                method: 'post',
                data: {goodsId: $(this).siblings('input').val()}
            })
        })

        //删除求购信息
        $('.goodsInfo ul').on('click', 'li .delSeekInfo', function () {
            $(this).parent().remove();
            $.ajax({
                url: '${pageContext.request.contextPath}/delSeekInfo',
                method: 'post',
                data: {id: $(this).siblings('input').val()}
            })
        })
    })
</script>
</body>

</html>
