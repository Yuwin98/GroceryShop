package util;

import Model.User;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.Iterator;
import java.util.List;

public class Upload {


    public static User UploadImage(ServletContext context, HttpServletRequest request) {

        File file;
        User user = new User();
        String fileName = "N/A";
        int maxFileSize = 5000 * 1024;
        int maxMemSize = 5000  * 1024;
        String filePath = context.getInitParameter("file-upload");

        String contentType = request.getContentType();

        if(contentType.contains("multipart/form-data")) {
            DiskFileItemFactory factory = new DiskFileItemFactory();
            factory.setSizeThreshold(maxMemSize);

            factory.setRepository(new File("c:\\temp"));

            ServletFileUpload upload = new ServletFileUpload(factory);
            upload.setFileSizeMax(maxFileSize);

            try {
                List fileItems = upload.parseRequest(request);

                Iterator i = fileItems.iterator();

                while (i.hasNext()) {
                    FileItem fi =(FileItem) i.next();

                    if(!fi.isFormField()) {

                        if(fi.getName() != null && !fi.getName().equals("")) {

                            fileName = fi.getName();
                            if (fileName.lastIndexOf("\\") >= 0) {
                                file = new File(filePath + fileName.substring(fileName.lastIndexOf("\\")));
                            } else {
                                file = new File(filePath + fileName.substring(fileName.lastIndexOf("\\") + 1));
                            }
                            if (!file.exists()) {
                                fi.write(file);
                            }

                        }
                        user.setPath(fileName);

                    }else  {
                        parseParameters(user,fi);
                    }
                }

            } catch (Exception e) {
                e.printStackTrace();
            }

        }

        return user;

    }

    public static void parseParameters(User user,FileItem fi) {
        switch (fi.getFieldName()) {
            case "firstname":
                user.setName(fi.getString());
                break;
            case "lastname":
                user.setName(user.getName() + " " + fi.getString());
                break;
            case "email":
                user.setEmail(fi.getString());
                break;
            case "id":
                user.setId(Integer.parseInt(fi.getString()));
                break;
            case "username":
                user.setUsername(fi.getString());
                break;
            case "password":
                user.setPassword(fi.getString());
                break;
            case "contactnumber":
                user.setContactNumber(fi.getString());
                break;
            case "role":
                user.setRole(fi.getString());
                break;
            case "active": {
                user.setActive(0);
                System.out.println(fi.getString());
                if (fi.getString().equals("1")) {
                    user.setActive(1);
                }

            }
            break;

        }
    }
}
