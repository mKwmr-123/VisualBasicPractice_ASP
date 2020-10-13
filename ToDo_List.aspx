<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ToDo_List.aspx.vb" Inherits="ToDo_WebForm.ToDo_List" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text="ToDoリスト　一覧"></asp:Label>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="日付" DataSourceID="SqlDataSource_ToDo" ForeColor="#333333" GridLines="None" Width="469px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" />
                <asp:BoundField DataField="日付" HeaderText="日付" ReadOnly="True" SortExpression="日付" DataFormatString="{0:yyyy/MM/dd}" HtmlEncode="False" HtmlEncodeFormatString="False" />
                <asp:BoundField DataField="時間" HeaderText="時間" SortExpression="時間" DataFormatString="{0}" HtmlEncode="False" HtmlEncodeFormatString="False" ReadOnly="True" />
                <asp:BoundField DataField="タスク" HeaderText="タスク" SortExpression="タスク" DataFormatString="{0}" HtmlEncode="False" HtmlEncodeFormatString="False" ReadOnly="True" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource_ToDo" runat="server" ConnectionString="<%$ ConnectionStrings:ToDoASP %>" DeleteCommand="DELETE FROM [ToDoTable] WHERE [日付] = @日付" InsertCommand="INSERT INTO [ToDoTable] ([日付], [時間], [タスク]) VALUES (@日付, @時間, @タスク)" SelectCommand="SELECT [日付], [時間], [タスク] FROM [ToDoTable]" UpdateCommand="UPDATE [ToDoTable] SET [時間] = @時間, [タスク] = @タスク WHERE [日付] = @日付">
            <DeleteParameters>
                <asp:Parameter DbType="Date" Name="日付" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter DbType="Date" Name="日付" />
                <asp:Parameter Name="時間" Type="String" />
                <asp:Parameter Name="タスク" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="時間" Type="String" />
                <asp:Parameter Name="タスク" Type="String" />
                <asp:Parameter DbType="Date" Name="日付" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
