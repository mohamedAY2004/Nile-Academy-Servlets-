package main;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//<!-- Direct image display -->
//<img src="retrieveImage?filename=yourimage.jpg" alt="Retrieved Image">
//
//<!-- Or as a download link -->
//<a href="retrieveImage?filename=yourimage.jpg">Download Image</a>
@WebServlet("/retrieveImage")
public class ImageRetrieveServlet extends HttpServlet {
    private static final String UPLOAD_DIR = "uploads";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the filename from the request parameter
    	//    	System.out.println(getServletContext().getRealPath("") + File.separator + UPLOAD_DIR);
        String fileName = request.getParameter("filename");
        
        if (fileName == null || fileName.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Filename is required");
            return;
        }

        // Get the upload path
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
        
        // Create the full file path
        File file = new File(uploadPath, fileName);
        
        if (!file.exists()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Image not found");
            return;
        }

        // Determine the content type based on the file
        String contentType = getServletContext().getMimeType(file.getAbsolutePath());
        if (contentType == null) {
            contentType = "application/octet-stream";
        }
        
        // Set content type and file size
        response.setContentType(contentType);
        response.setContentLength((int) file.length());

        // Write the file to the response output stream
        try {
            Files.copy(file.toPath(), response.getOutputStream());
        } catch (IOException e) {
            // Handle any IO errors
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, 
                               "Error reading the image file");
        }
    }
}