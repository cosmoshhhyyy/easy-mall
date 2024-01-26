/**
 * 修改用户
 * 回显用户信息
 */
$.ajax({
    url:"/user/getUser",
    type:"post",
    data:{
        uid:$.cookie("uid")
    },
    success:function (value){
        value=JSON.parse(value)
        $("#username").val(value.username)
        $("#password").val(value.password)
        $("#address").val(value.address)
        $("#phonenumber").val(value.phonenumber)
        $("#money").val(value.purse)
        $(".layui-input-block select").val(value.type)
    },
    error:function(){
        alert("系统出错")
    }
})
/**
 * 修改用户按钮触发事件
 */
$("#change").on("click",function(){
    if(confirm("确定要修改吗？")){
        $.ajax({
            url:"/user/updateUser",
            type:"post",
            data:{
                uid:$.cookie("uid"),
                username:$("#username").val(),
                password:$("#password").val(),
                address:$("#address").val(),
                phonenumber:$("#phonenumber").val(),
                purse:$("#money").val(),
                type:$(".layui-input-block select").val()
            },
            success:function (value){
                if(value>0){
                    alert("修改成功！")
                    location.href="/user/backToHomePage"
                }else{
                    alert("修改失败！")
                }
            },
            error:function(){
                alert("系统出错")
            }
        })
    }else{
        alert("未修改！")
    }
})
/**
 * 返回按钮触发事件
 */
$("#back").on("click",function(){
    location.href="/user/backToHomePage"
})
