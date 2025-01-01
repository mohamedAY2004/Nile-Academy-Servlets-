package main;
import java.io.File;
import java.io.IOException;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/uploadImage")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
                 maxFileSize = 1024 * 1024 * 10,      // 10 MB
                 maxRequestSize = 1024 * 1024 * 15)   // 15 MB
public class ImageUploadServlet extends HttpServlet {
    
	private static final String UPLOAD_DIR = "uploads"; // Directory where image will be stored
	private static final Set<String> ALLOWED_FILE_TYPES = Set.of("jpg", "jpeg", "png", "gif");

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException { 
		System.out.println(getServletContext().getRealPath("") + File.separator + UPLOAD_DIR);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		System.out.println("uploadImage Included");
		HttpSession session = request.getSession();
	    if(!session.getAttribute("Type").equals("admins") ) {
	        response.sendRedirect("Login.jsp");
	        return;
	    }
	    System.out.println("Validating");
	    // Get the image part from the form
	    Part imagePart = request.getPart("image");
	    
	    // Check if a valid image file is uploaded
	    if (imagePart != null && imagePart.getSize() > 0) {
	        String fileName = getFileName(imagePart);
	        
	        // Validate file extension
	        if (!isValidImageType(fileName)) {
	            request.setAttribute("image_error", "Invalid file type. Only JPG, JPEG, PNG, and GIF files are allowed.");
	            return;
	        }
	        if(request.getAttribute("valid")!=null&&(boolean)request.getAttribute("valid")==false)return;
	        System.out.println("Valid image");
	        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
	        
	        // Create the directory if it doesn't exist
	        File uploadDir = new File(uploadPath);
	        if (!uploadDir.exists()) {
	            uploadDir.mkdir();
	        }

	        // Save the file in the uploads directory
	        String filePath = uploadPath + File.separator + fileName;
	        imagePart.write(filePath);
	        // Save the file name
	        request.setAttribute("image_name", fileName);
	    } else {
	        // Handle case where no file was uploaded
	        request.setAttribute("image_error", "No file uploaded!");
	        request.setAttribute("valid", false);
	    }
	}

	// Utility method to get the file name from the Part
	private String getFileName(Part part) {
	    String contentDisposition = part.getHeader("content-disposition");
	    for (String content : contentDisposition.split(";")) {
	        if (content.trim().startsWith("filename")) {
	            return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
	        }
	    }
	    return null;
	}

	// Utility method to validate file type
	private boolean isValidImageType(String fileName) {
	    if (fileName == null || fileName.isEmpty()) {
	        return false;
	    }
	    
	    // Get the file extension
	    int dotIndex = fileName.lastIndexOf('.');
	    if (dotIndex == -1 || dotIndex == fileName.length() - 1) {
	        return false;
	    }
	    
	    String extension = fileName.substring(dotIndex + 1).toLowerCase();
	    return ALLOWED_FILE_TYPES.contains(extension);
	}
}
