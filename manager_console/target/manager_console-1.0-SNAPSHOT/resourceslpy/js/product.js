
// 搜索按钮 点击触发表单提交
$(".search").on("click", function() {
    // alert(1)
    console.log($('#form'))
    $('#form').submit();
    console.log(totalPage)
})

// 页号
layui.use(function(){
    var laypage = layui.laypage;
    laypage.render({
      elem: 'demo-laypage-normal-2',
      count: 100 // 数据总数
    });
});


function loadPage() {

    var totalPage = $("#totalPage").val()
    $(".page").empty()
    $(".page").append(
        "<li class='first'>首页</li>"+"<li class='prev'>上一页</li>"
    )
    for (var i = 1; i <= totalPage; i++) {
        if (i == $("form #pageNo").val()) {
            $(".page").append("<li class='current item'>" + i + "</li>")
            continue
        }
        $(".page").append(
            "<li class='item'>" + i + "</li>"
        )
    }
    $(".page").append(
        "<li class='next'>下一页</li>"+"<li class='last'>尾页</li>"
    )
    if (totalPage == 0) {
        $(".page").empty()
    }
}

loadPage()

// 点数字切换
$(".page").on("click", ".item", function() {

    // 样式切换
    $(this).addClass("current").siblings().removeClass("current")
    $("form #pageNo").val($(this).text())
    $('#form').submit();
})

// 首页
$(".box .page").on("click", ".first", function() {
    // alert(1)
    // 样式切换
    $(".page .item").removeClass("current").first().addClass("current")
    $("form #pageNo").val("")
    $('#form').submit();
})
// 尾页
$(".page").on("click", ".last", function() {
    // 样式切换
    $(".page .item").removeClass("current").last().addClass("current")
    $("form #pageNo").val($("form #totalPage").val())
    $('#form').submit();
})

// 上一个
$(".page").on("click", ".prev", function() {
    var cur_page = $(".page li.current").text()
    if (cur_page == 1) {
        alert("已经是第一页")
        return
    }
    // 样式切换
    $(".page li.current").removeClass("current").prev().addClass("current")
    $("form #pageNo").val(parseInt($("form #pageNo").val()) - 1)
    $('#form').submit();
})

// 下一个
$(".page").on("click", ".next", function() {
    var cur_page = $(".page li.current").text()
    if (cur_page == $(".page .item").length) {
        alert("已经是最后一页了")
        return
    }
    // 样式切换
    $(".page li.current").removeClass("current").next().addClass("current")
    $("form #pageNo").val(parseInt($("form #pageNo").val()) + 1)
    $('#form').submit();
})

$(".del").on("click", function() {
    var pid = $(this).attr("pid")
    if (confirm("确认删除")) {
        $.ajax({
            url:"/product/delProduct",
            type:"post",
            data:{
                pid:pid
            },
            dataType: "text",
            success:function(value){

                alert("删除成功")
                $("form #pageNo").val("")
                $('#form').submit();

            },
            error:function(){
                alert("请联系管理员")
            }
        })
    }
})