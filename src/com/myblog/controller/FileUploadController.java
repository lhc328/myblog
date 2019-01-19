package com.myblog.controller;


import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/upload")
public class FileUploadController {
    @RequestMapping("/fileUpload")
    public @ResponseBody
    String
    fileUpload(MultipartFile file, HttpServletRequest request) throws Exception{
        System.out.println("接口正确");
        //获得上传文件名
        String originalFilename = file.getOriginalFilename();
        //获取file控件name的属性名-->fileImage
        String name = file.getName();
        System.out.println(originalFilename+"----"+name);
        //将上传文件保存到目录下
        //path =
        String uuid = UUID.randomUUID().toString();
        String path = request.getServletContext().getRealPath("/upload");
        String basePath = path.split("webapps")[0];
        File fileUpload = new File(basePath);
        if(!fileUpload.exists()){
            fileUpload.mkdir();
        }
        File filePath = new File(basePath + "\\" + uuid + originalFilename);
        System.out.println(basePath + "\\" + uuid + originalFilename);
        file.transferTo(filePath);
        Map map = new HashMap();
        map.put("url", basePath + "\\" + uuid + originalFilename);
        String result = new JSONObject(map).toString();
        return result;
    }
}
