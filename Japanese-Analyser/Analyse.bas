B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=8.9
@EndOfDesignText@
'Handler class
Sub Class_Globals
	
End Sub

Public Sub Initialize
	
End Sub

Sub Handle(req As ServletRequest, resp As ServletResponse)
	Try
		Dim text As String = req.GetParameter("text")
		Dim response As List
		response.Initialize
		Dim tokenizer As KuromojiTokenizer
		tokenizer.Initialize
		Dim tokens As List = tokenizer.tokenize(text)
		For Each token As KuromojiToken In tokens
			Dim map1 As Map
			map1.Initialize
			map1.Put("Surface",token.Surface)
			map1.Put("AllFeatures",token.AllFeatures)
			response.Add(map1)
		Next
		Dim json As JSONGenerator
		json.Initialize2(response)
		Dim output As String = json.ToString()
		resp.ContentType = "application/json"
		resp.Write(output)
	Catch
		resp.SendError(500, "error....")
	End Try
End Sub