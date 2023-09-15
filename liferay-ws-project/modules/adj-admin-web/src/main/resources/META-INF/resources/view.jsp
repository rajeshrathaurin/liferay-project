<%@page import="com.liferay.document.library.web.internal.display.context.DLViewFileEntryDisplayContext"%>
<%@page import="com.liferay.document.library.kernel.service.DLAppLocalServiceUtil"%>
<%@page import="com.liferay.portal.kernel.language.LanguageUtil"%>
<%@page import="com.liferay.portal.kernel.util.HtmlUtil"%>
<%@page import="com.liferay.portal.kernel.theme.ThemeDisplay"%>
<%@page import="adj.admin.web.util.PreviewWordDocument"%>
<%@page import="com.liferay.portal.kernel.log.LogFactoryUtil"%>
<%@page import="com.liferay.portal.kernel.log.Log"%>
<%@page import="com.liferay.portal.kernel.exception.PortalException"%>
<%@page import="com.liferay.document.library.kernel.util.DLUtil"%>
<%@page import="com.liferay.document.library.kernel.service.DLFileEntryLocalServiceUtil"%>
<%@page import="com.liferay.document.library.kernel.model.DLFileEntry"%>
<%@page import="com.liferay.portal.kernel.repository.model.FileEntry"%>
<%@page import="java.util.List"%>

<%@page import="com.liferay.portal.kernel.repository.model.Folder"%>

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://liferay.com/tld/portlet" prefix="liferay-portlet" %>
<%@ taglib uri="http://liferay.com/tld/frontend" prefix="liferay-frontend" %>
<%@
taglib uri="http://liferay.com/tld/soy" prefix="soy" %><%@
taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme" %><%@
taglib uri="http://liferay.com/tld/util" prefix="liferay-util" %>

<%@ page import="com.liferay.document.library.kernel.util.PDFProcessorUtil" %>
<%@
page import="com.liferay.document.library.util.DLURLHelperUtil" %><%@
page import="com.liferay.petra.string.StringPool" %><%@
page import="com.liferay.portal.kernel.repository.model.FileVersion" %><%@
page import="com.liferay.portal.kernel.util.ParamUtil" %><%@
page import="com.liferay.portal.kernel.util.PortalUtil" %><%@
page import="com.liferay.portal.kernel.util.WebKeys" %><%@
page import="com.liferay.portal.kernel.workflow.WorkflowConstants" %>



<%@ page import="java.util.HashMap" %><%@
page import="java.util.Map" %>


<%@ include file="/init.jsp" %>


<!DOCTYPE html>
<html>
<head>
    
</head>
<body>
    <h1>Preview Word Document</h1>
    
<%
	Log log = LogFactoryUtil.getLog(this.getClass());


//FileEntry fileEntry = (FileEntry)request.getAttribute(WebKeys.DOCUMENT_LIBRARY_FILE_ENTRY);

FileEntry fileEntry = DLAppLocalServiceUtil.getFileEntry(45458);
boolean showExtraInfo = ParamUtil.getBoolean(request, "showExtraInfo");

%>
-------------------------------------view -------------------------------------------------


<liferay-util:include page="/view_file_entry.jsp" servletContext="<%= application %>">
			<liferay-util:param name="addPortletBreadcrumbEntries" value="<%= Boolean.FALSE.toString() %>" />
		</liferay-util:include>
		
--------------------------------------------------------------------------------------




--------------------------------------------------------------------------
<%
try {

	int previewFileCount = 0;
	String previewFileURL = "";
	
	//FileEntry fileEntry2 = DLAppLocalServiceUtil.getFileEntry(45458);
	
	FileVersion fileVersion = fileEntry.getFileVersion();
	boolean hasPDFImages = PDFProcessorUtil.hasImages(fileVersion);
	String previewQueryString = null;
	if (hasPDFImages) {
		ThemeDisplay themeDisplay1 = (ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);
		previewFileCount = PDFProcessorUtil.getPreviewFileCount(fileVersion);
		previewQueryString = "&previewFileIndex=";
		previewFileURL = DLUtil.getPreviewURL(fileEntry, fileVersion, themeDisplay1, previewQueryString);
	}
	for(int i=1; i<=previewFileCount; i++){
	
%>
				
		<center><img src="<%=previewFileURL+i%>"/><br>
		-------------------------------------------------------------------------------------------
		-------------------------------------------------<br>
		Page <%=i%>/<%=previewFileCount%></center>
		
		<br>
		
</body>

		
		<%
	}
	
} catch (PortalException e) {
	
	e.printStackTrace();
}
%>



</html>









