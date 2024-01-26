/**
 * 返回按钮触发事件
 */
$("#back").on("click",function(){
    location.href="/user/backToHomePage"
})
/**
 * 添加用户请求
 * 获取输入框的值
 * 判断是否符合条件
 * 发出添加用户请求
 */
$("#add").on("click",function(){
    if($("#password").val()!=$("#password2").val()){
        alert("密码不一致")
    }else if($(".layui-input-block select").val()==5){
        alert("未选择用户身份")
    }else{
        $.ajax({
            url:"/user/addUser",
            type:"post",
            data:{
                uid:null,
                username:$("#username").val(),
                password:$("#password").val(),
                address:$("#address").val(),
                phonenumber:$("#phonenumber").val(),
                purse:$("#money").val(),
                type:$(".layui-input-block select").val()
            },
            success:function (value){
                if(value>0){
                    alert("添加成功")
                    location.href="/user/backToHomePage"
                }else{
                    alert("添加失败")
                }
            },
            error:function (){
                alert("系统出错")
            }
        })

    }
})