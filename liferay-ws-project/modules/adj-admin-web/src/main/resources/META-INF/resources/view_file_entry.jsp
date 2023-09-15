<%--
/**
 * Copyright (c) 2000-present Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
--%>

<%@page import="com.liferay.document.library.web.internal.display.context.DLViewFileEntryDisplayContext"%>

<%@page import="com.liferay.portal.kernel.repository.model.FileVersion"%>
<%@page import="com.liferay.portal.kernel.repository.model.FileEntry"%>
<%@page import="com.liferay.document.library.kernel.service.DLAppLocalServiceUtil"%>
<%@ include file="/init.jsp" %>

<%
DLViewFileEntryDisplayContext dlViewFileEntryDisplayContext = (DLViewFileEntryDisplayContext)request.getAttribute(DLViewFileEntryDisplayContext.class.getName());
FileEntry fileEntry = DLAppLocalServiceUtil.getFileEntry(45458);
FileVersion fileVersion = fileEntry.getFileVersion();

boolean addPortletBreadcrumbEntries = true;
%>
		<clay:container-fluid>
			<div class="body-row">
				<c:if test="<%= true %>">
					<%
					dlViewFileEntryDisplayContext.renderPreview(pageContext);
					
					%>

				</c:if>

				
			</div>
		</clay:container-fluid>
