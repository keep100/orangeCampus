$(function(){
    let flag1=0,flag2=0;
    let sub_menus=$('.sub_menu');
    $('.goods_list ul li').on({
        mouseover:function(){
            $(sub_menus[$(this).index()]).siblings('.sub_menu').hide()
            $(sub_menus[$(this).index()]).show()
            flag1=1
        },
        mouseout:function(){
            flag1=0
        }
    })
    $('.sub_menu').on({
        mouseover:function(){
            flag2=1
        },
        mouseout:function(){
            flag2=0
        }
    })
    setInterval(function(){
        if(!flag1&&!flag2){
            sub_menus.each(function(index,obj){
                $(obj).hide()
            })
        }
    },10)
})