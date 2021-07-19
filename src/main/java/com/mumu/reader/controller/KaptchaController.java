package com.mumu.reader.controller;

import com.google.code.kaptcha.Producer;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;

@Controller
public class KaptchaController {
    @Resource
    private Producer kaptchProducer;

    @GetMapping("/verifyCode")
    public void createVerifyCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //设置相应立即过期
        response.setDateHeader("Expires", 0);
        //设置不缓存任何图片数据
        response.setHeader("Cache-control", "no-store,no-cache,must-revalidate");
        response.setHeader("Cache-control", "post-check=0,pre-check=0");
        response.setHeader("Pragma", "no-cache");
        response.setContentType("image/png");
        //生成验证码字符文本与图片
        String verifyCode = kaptchProducer.createText();
        request.getSession().setAttribute("kaptchaVerifyCode", verifyCode);
        BufferedImage image = kaptchProducer.createImage(verifyCode);

        ServletOutputStream out = response.getOutputStream();
        ImageIO.write(image, "png", out);
        out.flush();
        out.close();
    }
}
