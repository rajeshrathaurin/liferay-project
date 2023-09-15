package adj.admin.web.util;

import com.liferay.document.library.kernel.model.DLFileEntry;
import com.liferay.document.library.kernel.service.DLAppLocalServiceUtil;
import com.liferay.document.library.kernel.service.DLFileEntryLocalServiceUtil;
import com.liferay.petra.string.StringBundler;
import com.liferay.petra.string.StringPool;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.repository.model.FileEntry;
import com.liferay.portal.kernel.util.HtmlUtil;
import com.liferay.portal.kernel.util.URLCodec;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Date;

import org.apache.tika.metadata.Metadata;
import org.apache.tika.parser.AutoDetectParser;
import org.apache.tika.sax.BodyContentHandler;

public class PreviewWordDocument {
	public static final Log log = LogFactoryUtil.getLog(PreviewWordDocument.class);
	
	public static String getFilePreviewHTML(FileEntry fileEntry) throws Exception {
		log.info("fileEntry : "+fileEntry  );		
		
	    AutoDetectParser parser = new AutoDetectParser();
	    System.out.println("1");
	    BodyContentHandler handler = new BodyContentHandler();
	    System.out.println("2");
	    Metadata metadata = new Metadata();
	    System.out.println("3");
//	    try (InputStream stream =DLFileEntryLocalServiceUtil.getFileAsStream(fileEntry.getFileEntryId(), fileEntry.getVersion())) {
	    try  {
	    	File file = new File("C:\\Users\\Admin\\Desktop\\interview\\Naukri_SwapnilDahule_1396261_-02_03-_1.docx");
	    	InputStream stream = new FileInputStream(file);
	    	System.out.println("4");
	        parser.parse(stream, handler, metadata);
	        System.out.println("5");
	       
	    }catch (Exception e) {
	    	
			e.printStackTrace();
		}
	    return handler.toString();
	}
	
	
	public  static String ViewDocumentAndMediaFile(FileEntry fileEntry) throws Exception {
		//FileEntry fileEntry = DLAppLocalServiceUtil.getFileEntry(fileEntry.getFileEntryId());
		StringBundler stringBundle = new StringBundler();
		try {
			stringBundle.append("/documents/");
			stringBundle.append(fileEntry.getGroupId());
			stringBundle.append(StringPool.SLASH);
			stringBundle.append(fileEntry.getFolderId());
			stringBundle.append(StringPool.SLASH);
			stringBundle.append(URLCodec.encodeURL(HtmlUtil.unescape(fileEntry.getTitle()), true));
			stringBundle.append("?version=");
			stringBundle.append(fileEntry.getFileVersion().getVersion());
			stringBundle.append("&amp;t=");
			Date modifiedDate = fileEntry.getFileVersion().getModifiedDate();
			stringBundle.append(modifiedDate.getTime());

		} catch (Exception e) {
			log.info(e.getMessage());
		}
		return stringBundle.toString();
	}
	
}
