package com.weixin.boot.sample.controller;

import com.github.pagehelper.Page;
import com.weixin.boot.sample.domain.Sample;
import com.weixin.boot.sample.service.SampleService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Map;

/**
 * @author 王庆丰
 * @version 1.0
 * @date 2021/12/22 14:37
 */
@Controller
@RequestMapping("/sample")
public class SampleController {
    private static final Logger logger = LoggerFactory.getLogger(SampleController.class);

    private static final String FILE_PATH = "g:/boot/";
    @Autowired
    private SampleService service;

    @RequestMapping("/search")
    public String search(@RequestParam Map<String, Object> conditions, Model model) {
        logger.debug("conditions:{}", conditions);
        model.addAttribute("result", ((Page) service.search(conditions)).toPageInfo());
        return "sample/table";
    }

    @RequestMapping("/save")
    public String save(Sample sample) {
        logger.debug("Sample:{}", sample);

        if (sample.getPhoto() != null) {
            try {
                sample.getPhoto().transferTo(new File(FILE_PATH + sample.getPhoto().getOriginalFilename()));
                sample.setPhotoPath(sample.getPhoto().getOriginalFilename());
            } catch (IOException e) {
                logger.error("", e);
                throw new RuntimeException(e.getMessage());
            }
        }
        service.save(sample);
        return "sample/table";
    }

    @RequestMapping("/delete")
    public String delete(long[] ids) {
        logger.debug("ids:{}", ids);
        service.delete(ids);
        return "sample/table";
    }

    @RequestMapping("/get")
    public String get(long ids, Model model) {
        logger.debug("ids:{}", ids);
        Sample result = service.get(ids);
        model.addAttribute("result", result);

        return "sample/update";
    }

    @RequestMapping("/update")
    public String update(Sample sample) throws IOException {
        logger.debug("Sample:{}", sample);
        //如果重新上传了图片，则保存新的图片
        if (sample.getPhoto() != null) {
            try {
                sample.getPhoto().transferTo(new File(FILE_PATH + sample.getPhoto().getOriginalFilename()));
                sample.setPhotoPath(sample.getPhoto().getOriginalFilename());
            } catch (IOException e) {
                logger.error("", e);
                throw new RuntimeException(e.getMessage());
            }
        }
        //删除旧的图片
        Sample result = service.get(sample.getId());
        Files.delete(Paths.get(FILE_PATH + result.getPhotoPath()));

        service.update(sample);
        return "sample/table";
    }

    @RequestMapping("/photo")
    public void photo(String fileName, HttpServletResponse response) throws IOException {
        logger.debug("fileName:{}", fileName);
        response.getOutputStream().write(Files.readAllBytes(Paths.get(FILE_PATH + fileName)));
    }
}
