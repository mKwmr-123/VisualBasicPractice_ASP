Imports System.Data.SqlClient

Public Class ToDo_Input
    Inherits System.Web.UI.Page

    'データベースへの接続
    Dim cn As New System.Data.SqlClient.SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;" +
                                                      "AttachDbFilename=(LocalPC)\ToDo_WebForm\App_Data\ToDoASPDatabase.mdf;" +
                                                      "Integrated Security=True;")

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        '全件読み込み
        Dim adapter As New SqlDataAdapter("SELECT * FROM ToDoTable", cn)
        Dim table As New DataTable()
        adapter.Fill(table)

        For i As Integer = 0 To table.Rows.Count - 1
            '10分以内のタスクがあれば、表示する
            Dim schedule As DateTime = DateTime.Parse(table.Rows.Item(i).Item(1) + " " + table.Rows.Item(i).Item(2))
            If System.DateTime.Now.AddMinutes(10) > schedule AndAlso System.DateTime.Now < schedule Then
                NextTask.Text = "もうすぐ時間です「" + table.Rows.Item(i).Item(3) + "」"
                Exit For
            ElseIf System.DateTime.Now.AddMinutes(10) < schedule Then
                NextTask.Text = ""
            End If
        Next
    End Sub

    Protected Sub ToDoTimer_Tick(ByVal sender As Object, ByVal e As System.EventArgs)
        '全件読み込み
        Dim adapter As New SqlDataAdapter("SELECT * FROM ToDoTable", cn)
        Dim table As New DataTable()
        adapter.Fill(table)

        For i As Integer = 0 To table.Rows.Count - 1
            '10分以内のタスクがあれば、表示する
            Dim schedule As DateTime = DateTime.Parse(table.Rows.Item(i).Item(1) + " " + table.Rows.Item(i).Item(2))
            If System.DateTime.Now.AddMinutes(10) > schedule AndAlso System.DateTime.Now < schedule Then
                NextTask.Text = "もうすぐ時間です「" + table.Rows.Item(i).Item(3) + "」"
                Exit For
            ElseIf System.DateTime.Now.AddMinutes(10) < schedule Then
                NextTask.Text = ""
            End If
        Next

    End Sub

    Protected Sub Button_List_Click(sender As Object, e As EventArgs) Handles Button_List.Click
        '登録済みのリストを別ページに表示
        Response.Redirect("ToDo_List.aspx")
    End Sub

    Protected Sub Button_Entry_Click(sender As Object, e As EventArgs) Handles Button_Entry.Click
        '登録処理
        Dim insertSQL As String = "INSERT INTO ToDoTable VALUES (NEWID() ,'" + TextBox_Day.Text +
                                  "', '" + TextBox_Time.Text + "', N'" + TextBox_Task.Text + "')"

        '一意のIDを振って、「日付」「時間」「タスク」をデータベースに登録
        cn.Open()
        Dim adapter As New System.Data.SqlClient.SqlDataAdapter()
        adapter.InsertCommand = New SqlCommand(insertSQL, cn)
        adapter.InsertCommand.ExecuteNonQuery()
        cn.Close()
    End Sub
End Class