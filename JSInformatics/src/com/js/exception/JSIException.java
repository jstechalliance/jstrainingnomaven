package com.js.exception;
public class JSIException extends Exception implements Runnable{
	private static final long serialVersionUID = 2222222l;;

	public JSIException() {
		super();
	}

	public JSIException(String message, Throwable cause) {
		super(message, cause);
	}

	public JSIException(String message) {
		super(message);
	}

	public JSIException(Throwable cause) {
		super(cause);
	}

	public void log() {
		new Thread(this).start();
	}

	@Override
	public void run() {
		LogFileWriter.log(this);
	}
}