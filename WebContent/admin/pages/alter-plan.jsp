<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.TrainingSystem.service.leader.PlanManage"
    import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../css/oksub.css">
    <link rel="stylesheet" href="../../layui/css/layui.css">
    <style>
        .layui-form-label {
            text-align: left;
        }

        .layui-container {
            width: 40% !important;
            margin-top: 30px;
        }
    </style>
</head>

<body>
    <div class="layui-container">
        <form class="layui-form" lay-filter="alter-form" action="/TrainingSystem/AjaxAlterPlan" type="post">
            <div class="layui-form-item">
                <label class="layui-form-label">训练计划</label>
                <div class="layui-input-block">
                    <input type="text" value=<%=request.getParameter("pid") %> class="layui-input" lay-verify="required" id="pid" readonly
                        name="pid">
                </div>
            </div>
             <div class="layui-form-item">
                <label class="layui-form-label">开始时间</label>
                <div class="layui-input-block">
                    <input id="uDate" type="text" value="" placeholder="" lay-verify="required" class="layui-input" 
                     name="sdate">
            	</div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">截止时间</label>
                <div class="layui-input-block">
                    <input id="uDate2" type="text" value="" placeholder="" lay-verify="required" class="layui-input" 
                     name="edate">
                </div>
               </div>
<!--             <div class="layui-form-item">
                <label class="layui-form-label">参加人</label>
                <div class="layui-input-block">
                    <input type="text" value="1" class="layui-input" lay-verify="required" id="attend" name="attend">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">备注</label>
                <div class="layui-input-block">
                    <input type="text" value="1" class="layui-input" lay-verify="required" id="remark" name="remark">
                </div>
            </div> -->
            <div class="layui-form-item">
                <button class="layui-btn layui-btn-fluid" lay-submit="" lay-filter="alter-manage">修改</button>
            </div>
        </form>
    </div>
    <script type="text/javascript" src="../../layui/layui.js"></script>
    <script src="../js/public.js"></script>
    <script type="text/javascript" src="../layui/layui.js"></script>
    <script type="text/javascript" src="../js/user-info.js"></script>
    <script>
        layui.use(['form', 'laydate'], function () {
            var form = layui.form,
            layer = layui.layer,
            $ = layui.jquery;
    /*             laydate = layui.laydate;
            laydate.render({
                elem: '#datetime'
                , type: 'datetime'
            }); */
            form.on("submit(alter-manage)", function (data) {

                window.parent.location.reload();
            });
        });
    </script>
</body>

</html>