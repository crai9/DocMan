package com.team13.spring;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileUploadController {
	
	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public String formPage() {
		
		return "form";
	}
    
    @RequestMapping(value="/upload", method=RequestMethod.GET)
    public @ResponseBody String provideUploadInfo() {
        return "You can upload a file by posting to this same URL.";
    }
    
    @RequestMapping(value="/upload", method=RequestMethod.POST)
    public @ResponseBody String handleFileUpload(@RequestParam("name") String name, 
            @RequestParam("file") MultipartFile file){
        if (!file.isEmpty()) {
            try {
            	
            	//might want to check for pdfs or other valid docs
            	
            	System.out.println(file.getContentType());
            	System.out.println(file.getSize());
            	System.out.println(file.getOriginalFilename());
            	
                byte[] bytes = file.getBytes();
                
                //File dir = new File("src" + File.separator + "main" + File.separator + "webapp" + File.separator + "static" + File.separator + "resources" + File.separator + "doc");


                File dir = new File("test");
                if (!dir.exists())
                    dir.mkdirs();
                
                System.out.println(dir);
                System.out.println(dir.getAbsolutePath());
                System.out.println(System.getProperty("user.dir"));
                System.out.println(System.getProperty("user.home"));
                System.out.println(System.getProperty("user.name"));
                System.out.println(System.getProperty("os.name"));
                
                //need to rename files to stop duplicates
                
                BufferedOutputStream stream = 
                        new BufferedOutputStream(new FileOutputStream(new File(dir.getAbsolutePath() + File.separator + name)));
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
