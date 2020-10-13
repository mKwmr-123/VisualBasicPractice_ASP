<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ToDo_Input.aspx.vb" Inherits="ToDo_WebForm.ToDo_Input" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <%-- jquery timepicker の導入 --%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/jquery-ui.min.js"></script>
    <script  src="Scripts/jquery.timepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="Content/jquery.timepicker.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="ToDo　登録画面"></asp:Label>
        <p>
            <asp:Button ID="Button_Entry" runat="server" Text="登録" />
            <asp:Button ID="Button_List" runat="server" Text="一覧表示" />
        </p>
        
        <%-- 次のタスク表示用のタイマ --%>
        <asp:ScriptManager ID="ScriptManager_Timer" runat="server" />
        <asp:Timer ID="ToDoTimer" OnTick="ToDoTimer_Tick" runat="server" Interval="60000" />

        <asp:UpdatePanel ID="ToDoPanel" runat="server" UpdateMode="Conditional">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="ToDoTimer" />
            </Triggers>
            <ContentTemplate>
                次のタスク： <asp:Label id="NextTask" runat="server" Font-Bold="True"></asp:Label>
            </ContentTemplate>
        </asp:UpdatePanel>

        <asp:Label ID="Label2" runat="server" Text="日付"></asp:Label>
        <asp:TextBox ID="TextBox_Day" runat="server" Width="80px" AutoCompleteType="Disabled"></asp:TextBox>
        <asp:Label ID="Label3" runat="server" Text="時間"></asp:Label>
        <asp:TextBox ID="TextBox_Time" runat="server" Width="75px" AutoCompleteType="Disabled" TabIndex="1"></asp:TextBox>
        <asp:Label ID="Label4" runat="server" Text="タスク"></asp:Label>
        <asp:TextBox ID="TextBox_Task" runat="server" MaxLength="50" Width="760px" CausesValidation="True" TabIndex="2" ValidateRequestMode="Enabled"></asp:TextBox>

        <%-- datepickerとtimepickerのスクリプト --%>
        <script>$(function () {
            $('#TextBox_Day').datepicker({
                monthNames: ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"],
                dateFormat: 'yy/mm/dd'
            });
        });</script>
        <script>$(function () {
            $('#TextBox_Time').timepicker({
                'timeFormat': 'H:i',
                'step': 10,
                'scrollDefault': 'now'
            });
        });</script>

    </form>
</body>
</html>
