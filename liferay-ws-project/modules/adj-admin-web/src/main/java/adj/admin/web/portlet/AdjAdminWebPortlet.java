package adj.admin.web.portlet;

import com.liferay.document.library.kernel.model.DLFileEntry;
import com.liferay.document.library.kernel.service.DLAppServiceUtil;
import com.liferay.document.library.kernel.service.DLFileEntryLocalServiceUtil;
import com.liferay.document.library.kernel.util.DLUtil;

import com.liferay.petra.string.StringPool;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCPortlet;
import com.liferay.portal.kernel.repository.model.FileEntry;
import com.liferay.portal.kernel.repository.model.Folder;
import com.liferay.portal.kernel.theme.ThemeDisplay;
import com.liferay.portal.kernel.util.WebKeys;

import java.io.IOException;
import java.util.List;

import javax.portlet.Portlet;
import javax.portlet.PortletException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.osgi.service.component.annotations.Component;

import adj.admin.web.constants.AdjAdminWebPortletKeys;

/**
 * @author Admin
 */
@Component(
	immediate = true,
	property = {
		"com.liferay.portlet.display-category=category.sample",
		"com.liferay.portlet.header-portlet-css=/css/main.css",
		"com.liferay.portlet.instanceable=true",
		"javax.portlet.display-name=AdjAdminWeb",
		"javax.portlet.init-param.template-path=/",
		"javax.portlet.init-param.view-template=/view.jsp",
		"javax.portlet.name=" + AdjAdminWebPortletKeys.ADJADMINWEB,
		"javax.portlet.resource-bundle=content.Language",
		"javax.portlet.security-role-ref=power-user,user"
	},
	service = Portlet.class
)
public class AdjAdminWebPortlet extends MVCPortlet {
		
	
	@Override
	public void render(RenderRequest renderRequest, RenderResponse renderResponse)
			throws IOException, PortletException {
		ThemeDisplay themeDisplay =(ThemeDisplay) renderRequest.getAttribute(WebKeys.THEME_DISPLAY);
		
		try {
			Folder folder = DLAppServiceUtil.getFolder(themeDisplay.getScopeGroupId(), 0, "mydocuments");
			List<FileEntry> list = DLAppServiceUtil.getFileEntries(themeDisplay.getScopeGroupId(), folder.getFolderId());
			List<DLFileEntry> list1 = DLFileEntryLocalServiceUtil.getFileEntries(themeDisplay.getScopeGroupId(), folder.getFolderId());
			for (FileEntry fileEntry : list) {
				//String documentURL = DLUtil.getPreviewURL(fileEntry, fileEntry.getFileVersion(), themeDisplay, StringPool.BLANK);
				
				
			}
			
			
			
			
		} catch (PortalException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		super.render(renderRequest, renderResponse);
	}
	
	
}