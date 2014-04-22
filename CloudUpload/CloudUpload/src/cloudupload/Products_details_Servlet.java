package cloudupload;


import static com.googlecode.objectify.ObjectifyService.ofy;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.google.appengine.api.blobstore.*;
import com.googlecode.objectify.ObjectifyService;

@SuppressWarnings("serial")
public class Products_details_Servlet extends HttpServlet {

	 static {
	        ObjectifyService.register(Upload.class);
	    }

	    public void doGet(HttpServletRequest req, HttpServletResponse resp)
	            throws IOException, ServletException {
	        BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();

	     // charger un upload si on l'a demandŽ
	      
	            BlobKey detailsUploadData = new BlobKey(req.getParameter("det"));
	            Upload uploads = ofy().load().type(Upload.class).filter("key", detailsUploadData).first().now();
	            req.setAttribute("uploads", uploads);

	        this.getServletContext().getRequestDispatcher("/WEB-INF/product_details.jsp").forward(req, resp);
	        
	    }

	    public void doPost(HttpServletRequest req, HttpServletResponse resp)
	            throws IOException {
	        BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();

	        Map<String, List<BlobKey>> blobs = blobstoreService.getUploads(req);
	        List<BlobKey> blobKeys = blobs.get("uploadedFile");

	        Upload upload = new Upload(blobKeys.get(0), req.getParameter("description"),req.getParameter("title"),req.getParameter("descri_d"),req.getParameter("categorie"),req.getParameter("prix"));

	        ofy().save().entity(upload).now();

	        resp.sendRedirect("/");

	    }
	}

