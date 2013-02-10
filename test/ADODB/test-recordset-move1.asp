<!--#include file="../config/ADODB.inc"-->
Here is the test of RecordSet AbsolutePosition.<br>
<%
    Sub Output_Row(RS)
        %>Value: <%=RS("StringField")%> / <%=RS("IntField")%><br />
        AbsolutePosition: <%=RS.AbsolutePosition%><br />
        BOF: <%=RS.BOF%><br />
        EOF: <%=RS.EOF%><br />
<%
    End Sub

    Dim CN, RS

    Set CN = Server.CreateObject("ADODB.Connection")
    CN.Open Connect_URL, Connect_Username, Connect_Password
    Set RS = Server.CreateObject("ADODB.RecordSet")
    RS.CursorLocation = 3
    RS.Open "SELECT StringField, IntField FROM Test ORDER BY IntField", CN

    RS.Move(10)
    Call Output_Row(RS)

    RS.Move(4)
    Call Output_Row(RS)

    RS.Move(-10)
    Call Output_Row(RS)

    RS.Move(-4)
    Call Output_Row(RS)

    CN.Close
%>

The End.
