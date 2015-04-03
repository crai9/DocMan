package com.team13.spring;

import com.team13.spring.files.FileSaver;

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
    
    
    @RequestMapping(value="/upload", method=RequestMethod.POST)
    public @ResponseBody String FileUpload(@RequestParam("name") String name, 
            @RequestParam("file") MultipartFile file){
    	
    	return FileSaver.writeFile(name, file, 5);
    }

}
