/**
 * 加载数据方法
 * 发起请求找到用户总数量
 * 再按照用户数量设置分页器的总数量
 * 根据选择的页码和筛选条件来查询数据
 */
function loadData(){
    var TotalCount=0;
    var type=$(".layui-input-block select").val();
    if(type=="5"){
        type=null;
    }
    console.log("type"+type)
    $.ajax({
        url:"/user/showData",
        type:"post",
        data:{
            pageNo:null,
            pageSize:null,
            username:$("#username").val(),
            address:$("#address").val(),
            phonenumber:$("#phonenumber").val(),
            purse:$("#money").val(),
            type:type
        },
        success:function (value){
            value=JSON.parse(value)
            var data=value.list
            TotalCount=value.totalCount
            layui.use(['laypage', 'layer'], function(){
                var laypage = layui.laypage
                    ,layer = layui.layer;
                //完整功能
                laypage.render({
                    elem: 'page'
                    ,count: TotalCount,
                    limit:5,
                    limits:[5,10]
                    ,layout: ['count', 'prev', 'page', 'next', 'limit', 'refresh', 'skip']
                    ,jump: function(obj){
                        type=$(".layui-input-block select").val();
                        if(type=="5"){
                            type=null;
                        }
                        $.ajax({
                            url:"/user/showData",
                            type:"post",
                            data:{
                                pageNo:obj.curr,
                                pageSize:obj.limit,
                                username:$("#username").val(),
                                address:$("#address").val(),
                                phonenumber:$("#phonenumber").val(),
                                purse:$("#money").val(),
                                type:type
                            },
                            success:function (value){
                                value=JSON.parse(value)
                                var data=value.list
                                console.log(data)
                                $("tbody").empty();
                                if(data.length==0){
                                    $("tbody").append(
                                        "<tr>"+
                                        "<td>空</td>"+
                                        "<td>空</td>"+
                                        "<td>空</td>"+
                                        "<td>空</td>"+
                                        "<td>空</td>"+
                                        "<td>空</td>"+
                                        "<td>空<td>"+
                                        "<tr>"
                                    )
                                }else{
                                    for (var i=0;i<data.length;i++){
                                        var typeName="";
                                        if(data[i].type=="0"){
                                            typeName="普通用户";
                                        }else{
                                            typeName="商家";
                                        }
                                        $("tbody").append(
                                            "<tr>"+
                                            "<td>"+data[i].uid+"</td>"+
                                            "<td>"+data[i].username+"</td>"+
                                            "<td>"+data[i].address+"</td>"+
                                            "<td>"+data[i].phonenumber+"</td>"+
                                            "<td>"+data[i].purse+"</td>"+
                                            "<td>"+typeName+"</td>"+
                                            "<td>"+
                                            "<button  class='delete' class='layui-btn layui-btn-danger' uid='"+data[i].uid+"'  onclick='deleteData()'>删除</button>"+
                                            "<button class='update' class='layui-btn layui-btn-normal update' uid='"+data[i].uid+"'>修改</button>"+
                                            "<td>"+
                                            "<tr>"
                                        )
                                    }
                                }

                            },
                            error:function (){
                                alert("系统故障！")
                            }
                        })
                    }
                });
            });

        },
        error:function (){
            alert("系统故障！")
        }
    })
}

/**
 * 加载进页面时，展示数据
 */
loadData()
/**
 * 查询点击事件
 */
$("#search").on("click",function(){
    loadData()
})
/**
 * 添加点击事件
 */
$("#addUser").on("click",function (){
    location.href="/user/addUserPage"
})
/**
 * 删除某个用户
 */
$("tbody").on("click",".delete",function(){
    if(confirm("确定要删除该用户吗？")){
        $.ajax({
            url:"/user/delUser",
            type:"post",
            data:{
                uid:$(this).attr("uid")
            },
            success:function (value){
                if(value>0){
                    alert("删除成功！")
                }else{
                    alert("未删除！")
                }
                loadData()
            },
            error:function (){
                alert("系统故障")
            }
        })
    }else{
        alert("未删除")
    }
})
/**
 * 更改用户事件
 */
$("tbody").on("click",".update",function (){
    $.cookie("uid",$(this).attr("uid"))
    location.href="/user/updatePage"
})
/**
 * 重置筛选条件的按钮
 */
$("#clear").on("click",function(){
    $("#username").val("")
    $("#address").val("")
    $("#phonenumber").val("")
    $("#money").val("")
    loadData()
})