package com.js.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.js.exception.JSIException;

/**
 * Servlet implementation class LoadImage
 */
public class LoadImage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoadImage() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException {
		String image = request.getParameter("imageName");
		String root = getServletContext().getRealPath("/");

		File path = new File(root).getParentFile().getParentFile();
		File studentImage = new File(path, "/studentimage");
		File file = new File(studentImage, image);
		OutputStream os = null;
		response.setContentType("image/png");
		try {

			BufferedImage img = ImageIO.read(file);
			os = response.getOutputStream();
			ImageIO.write(img, "png", os);

		} catch (Exception ex) {
			new JSIException(ex).log();
			try {
				file=new File(root,"images/photo.png");
				BufferedImage img = ImageIO.read(file);
				os = response.getOutputStream();
				ImageIO.write(img, "png", os);
			} catch (Exception exc) {
				new JSIException(exc).log();
			}			
		} finally {
			if (os != null) {
				try {
					os.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

	}

}
