package com.js.controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.js.exception.JSIException;

public class ImageFile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ImageFile() {
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setHeader("Content-type", "text/html; charset=utf-8");
		response.getWriter().println("Mime type required");
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		response.setHeader("Content-type", "text/html; charset=utf-8");
		if (isMultipart) {
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			try {
				List items = upload.parseRequest(request);
				Iterator iterator = items.iterator();
				while (iterator.hasNext()) {
					FileItem item = (FileItem) iterator.next();
					if (!item.isFormField()) {
						String fileName = item.getName();
						String root = getServletContext().getRealPath("/");
						File path = new File(root).getParentFile()
								.getParentFile();
						File studentImage = new File(path, "/studentimage");
						if (!studentImage.exists()) {
							studentImage.mkdirs();
						}
						File uploadedFile = new File(studentImage, fileName);
						// //System.out.println(uploadedFile.getAbsolutePath());
						item.write(uploadedFile);
						response.getWriter().println(uploadedFile.getName());
					}
				}
			} catch (Exception e) {
				new JSIException(e).log();
				response.getWriter().println("faild");
				e.printStackTrace();
			}
		} else {
			response.getWriter().println("faild");
		}
	}
}
