$(function () {
    let box = document.querySelector('.preview_img');
    let img = document.querySelector('#before');
    let mask = document.querySelector('#mask');
    let big = document.querySelector('#big');
    box.addEventListener('mouseover', function () {
        mask.style.display = 'block';
        big.style.display = 'block';
    })
    box.addEventListener('mouseout', function () {
        mask.style.display = 'none';
        big.style.display = 'none';
    })
    box.addEventListener('mousemove', function (e) {
        let x = e.pageX - this.offsetLeft;
        let y = e.pageY - this.offsetTop;
        let maskX = x - mask.offsetWidth / 2;
        let maskY = y - mask.offsetHeight / 2;
        let maskMax = img.offsetWidth - mask.offsetWidth;

        if (maskX < 0)
            maskX = 0;
        else if (maskX > maskMax)
            maskX = maskMax;
        if (maskY < 0)
            maskY = 0;
        else if (maskY > maskMax)
            maskY = maskMax;
        mask.style.left = maskX + 'px';
        mask.style.top = maskY + 'px';
        let bigImg = document.querySelector('#after');
        let bigXMax = bigImg.offsetWidth - big.offsetWidth;
        let bigYMax = bigImg.offsetHeight - big.offsetHeight;

        let bigX = maskX * bigXMax / maskMax;
        let bigY = maskY * bigYMax / maskMax;
        bigImg.style.left = -bigX + 'px';
        bigImg.style.top = -bigY + 'px';
    })
    // $('.starability-basic label').click(function () {
    //     console.log($(this).css('background-position'));
    //     if($(this).css('background-position')=='0px -20px'){
    //         alert(1);
    //     }
    // })
    $('#weChat_id a').click(function () {
        if ($(this).text()=="登录后可查看联系方式"){
            window.location.href="login.jsp";
        }
    })

    let hideModel = function () {
        $('.model').fadeOut();
        $('.block').hide();
    }
    $('.model #close_icon').click(function () {
        hideModel();
    })
    $('.model #cancel').click(function () {
        hideModel();
    })
    $('.tab-group').on('click', '.tab-nav button', function () {
        $('.model').fadeIn();
        $('.block').show();
    })
})