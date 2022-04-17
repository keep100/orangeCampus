<%--
  Created by IntelliJ IDEA.
  User: 16321
  Date: 2021/10/5
  Time: 11:25
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
    <title>发布商品-橘子校园</title>
    <link rel="shortcut icon" href="image/橘子.png" type="image/x-icon">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/release.css">
    <link rel="stylesheet" href="css/footer.css">
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
        <p>发布商品</p>
    </div>
    <form>
        <div class="form-group">
            <label for="good_name">标题</label>
            <input name="goodsName" type="email" class="form-control" id="good_name" aria-describedby="emailHelp"
                   placeholder="商品的名称">
        </div>
        <div class="form-group">
            <label for="desc">商品描述</label>
            <textarea name="goodsDesc" class="form-control" id="desc" rows="3"
                      placeholder="关于商品的简单描述，会显示在商品的列表中"></textarea>
        </div>
        <div class="form-group">
            <label for="price">标价</label>
            <input name="price" type="number" class="form-control" id="price" aria-describedby="emailHelp"
                   placeholder="你想要卖的价格，整数" style="width: 40%;">
        </div>
        <div class="goods_label">
            <label style="float: left;margin-right: 10px;">商品标签</label>
            <div class="initColor">原装正品</div>
            <div class="initColor">价格可议</div>
            <div class="initColor">无修无拆</div>
            <div class="initColor">如假包退</div>
            <div class="initColor">一口价</div>
            <div class="initColor">非诚勿扰</div>
        </div>
        <div class="form-group">
            <label for="exampleFormControlSelect1">商品分类</label>
            <div class="selectType">
                <select class="form-control" id="exampleFormControlSelect1">
                    <option>请选择大致分类</option>
                    <option>电子产品</option>
                    <option>学习用品</option>
                    <option>衣鞋伞帽</option>
                    <option>生活用品</option>
                    <option>体育器材</option>
                    <option>乐器</option>
                    <option>代步工具</option>
                    <option>虚拟产品</option>
                </select>
                <select name="type" class="form-control" id="exampleFormControlSelect2">
                    <option>请选择具体分类</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="weChat_id">微信</label>
            <input name="weChatId" type="email" class="form-control" id="weChat_id" aria-describedby="emailHelp"
                   placeholder="微信号"
                   style="width: 30%;">
        </div>
        <div class="form-group">
            <label for="weChat_id">手机号</label>
            <input name="weChatId" type="email" class="form-control" id="tel" aria-describedby="emailHelp"
                   placeholder="手机号"
                   style="width: 30%;">
        </div>
        <div class="form-group">
            <label>图片上传&nbsp;&nbsp;&nbsp;&nbsp;<small>请上传一张完整、清晰的实物图</small></label>
            <div>
                <div class="pic_box"><img></div>
                <div class="upload">
                    <input type="file" name="imgUrl">
                    <img src="image/图片上传.png">
                </div>
            </div>


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
        //商品标签最多四个
        $('.goods_label div').click(function () {
            if ($(this).prop('class') === 'initColor') {
                if ($('.goods_label .changeColor').length < 4) {
                    $(this).toggleClass("changeColor initColor");
                } else {
                    $('.tn-box p').text("最多4个标签");
                    show_alert();
                }
            } else {
                $(this).toggleClass("changeColor initColor");
            }
        });

        //根据第一个下拉菜单改变第二个下拉菜单的内容
        let types = [["请选择具体分类"], ["请选择具体分类", "手机", "平板", "手环", "笔记本", "显示器", "耳机", "键盘", "单反"], ["请选择具体分类", "收音机", "教材", "小说", "考试资料"], ["请选择具体分类", "上衣", "裙子", "裤子", "鞋子", "帽子", "伞", "包"], ["请选择具体分类", "化妆护肤", "洗衣机", "冰箱", "宿舍小锅", "台灯", "电热壶", "电风扇", "鞋架", "储物篮", "宿舍装饰品"], ["请选择具体分类", "篮球", "乒乓球拍", "羽毛球拍", "网球拍", "泳镜", "哑铃", "足球", "排球"], ["请选择具体分类", "吉他", "小提琴", "电子琴", "口琴"], ["请选择具体分类", "小电驴", "自行车", "平衡车", "滑板"], ["请选择具体分类", "会员", "校园网"]]
        $('#exampleFormControlSelect1').change(function () {
            let idx = $('#exampleFormControlSelect1 option:selected').index();
            $('#exampleFormControlSelect2').empty();
            for (let i = 0; i < types[idx].length; i++) {
                let option = $('<option>').text(types[idx][i]);
                $('#exampleFormControlSelect2').append(option);
            }
        });

        //本地预览上传图片
        $('.upload input').change(function () {
            $('.upload').css('margin-left', '120px');
            $('.pic_box').show();
            let filePath = $(this).val(), fileFormat = filePath.substring(filePath.lastIndexOf(".")).toLowerCase(),
                src = window.URL.createObjectURL(this.files[0]);
            //检查是否为图片
            if (!fileFormat.match(/.png|.jpg|.jpeg/)) {
                $('.tn-box p').text("只能上传图片");
                show_alert();
                $('.upload').css('margin-left', '50px');
                $('.pic_box').hide();
            }
            $('.pic_box img').prop('src', src);
        })

        let show_alert = function () {
            $('.tn-box').addClass('tn-box-active');
            window.setTimeout(function () {
                $('.tn-box').removeClass('tn-box-active');
            }, 1000);
        }
        $('.btn').click(function () {
            if ($('#good_name').val() === "") {
                $('.tn-box p').text("请填写标题");
                show_alert();
            } else if ($('#desc').val() === "") {
                $('.tn-box p').text("请填写描述");
                show_alert();
            } else if ($('#price').val() === "") {
                $('.tn-box p').text("请填写标价");
                show_alert();
            } else if ($('#exampleFormControlSelect1 option:selected').index() === 0 || $('#exampleFormControlSelect2 option:selected').index() === 0) {
                $('.tn-box p').text("请填写分类");
                show_alert();
            } else if ($('#weChat_id').val() === "") {
                $('.tn-box p').text("请填写微信号");
                show_alert();
            } else if ($('.upload input').val() === "") {
                $('.tn-box p').text("请上传图片");
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
                let labelStr = [];
                let formData = new FormData($('form')[0]);
                $('.goods_label div').each(function (i) {
                    if (this.className === "changeColor") {
                        labelStr.push(this.innerText);
                    }
                })
                formData.append("userId", ${sessionScope.user.id});
                formData.append("labels", labelStr.join());
                //获取本地图片转化后的路径
                let src = window.URL.createObjectURL($('.upload input')[0].files[0]);
                formData.append("imgName", src.substring(src.lastIndexOf("/") + 1));
                $.ajax({
                    url: '${pageContext.request.contextPath}/addGoods',
                    method: 'post',
                    data: formData,
                    processData: false,
                    contentType: false,
                    dataType: 'text',
                    success: function (data) {
                        if (data === "1") {
                            $('.tn-box p').text("发布成功");
                            show_alert();
                            window.setTimeout(function () {
                                window.location.href = "goodList.jsp";
                            }, 1500);
                        }
                    }
                })
                </c:otherwise>
                </c:choose>
            }
        })
    })
</script>
</body>

</html>
