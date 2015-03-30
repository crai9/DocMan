package com.team13.spring.files;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import org.springframework.web.multipart.MultipartFile;

public class FileSaver {
	
	public static String writeFile(String name, MultipartFile file) {

		if (!file.isEmpty()) {
            try {
            	
            	//might want to check for pdfs or other valid docs
            	
            	System.out.println(file.getContentType());
            	System.out.println(file.getSize());
            	System.out.println(file.getOriginalFilename());
            	
                byte[] bytes = file.getBytes();
                
                //choose where to write to
                
                
                File f = new File(File.separator);
            	
                //Change this depending on where Project's folder is
                File home = new File(f + "var" + f + "www" + f + "html");
               
                System.out.println(home.getAbsolutePath());
                
                //need to rename files to stop duplicates
                
                File afile = new File(home + File.separator + name);
                System.out.println("abs file: " + afile.getAbsoluteFile());
                
                BufferedOutputStream stream = 
                        new BufferedOutputStream(new FileOutputStream(afile));
                stream.write(bytes);
                stream.close();
                
                //log to database
                
                return "You successfully uploaded " + name + "!";
                
            } catch (Exception e) {
                return "You failed to upload " + name + " => " + e.getMessage();
            }
        } else {
            return "You failed to upload " + name + " because the file was empty.";
        }
		
	}

}
