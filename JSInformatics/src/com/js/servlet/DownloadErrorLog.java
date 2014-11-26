package com.js.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DownloadErrorLog
 */
public class DownloadErrorLog extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DownloadErrorLog() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		downloadService(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		downloadService(request, response);
	}

	private void downloadService(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setHeader("Content-type", "text/txt");
		String root = getServletContext().getRealPath("/");
		String filename = request.getParameter("filename");
		File path = new File(root, "jsi_error/" + filename);
		byte[] buffer = new byte[1024 * 100];
		int length;
		OutputStream os = null;
		try {
			FileInputStream stream = new FileInputStream(path);
			os = response.getOutputStream();
			while ((length = stream.read(buffer)) > 0) {
				os.write(buffer, 0, length);
			}
		} catch (Exception ex) {
			if(os!=null){
				os.close();
			}
		}
	}

}
