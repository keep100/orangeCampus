$(function () {
    $('button').on({
        mousemove: function () {
            $(this).css({
                backgroundColor: 'rgb(82,211,170)',
                border: 'none'
            });
        },
        mouseout: function () {
            $(this).css({
                backgroundColor: 'transparent',
                border: '2px solid white'
            });

        }
    })
    $('.card').on({
        mouseover: function () {
            $(this).find('button').css({
                backgroundColor: 'transparent',
                border: '2px solid white'
            });
        },
        mouseleave: function () {
            $(this).find('button').css({
                backgroundColor: 'rgb(82,211,170)',
                border: 'none'
            });
        }
    })
})