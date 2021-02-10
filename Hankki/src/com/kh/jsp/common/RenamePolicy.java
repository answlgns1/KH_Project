package com.kh.jsp.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class RenamePolicy implements FileRenamePolicy {

	@Override
	public File rename(File oldFile) {
		
		long currentTime = System.currentTimeMillis();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
		
		int randomNumber = (int)(Math.random() * 10000);  // 같은 이름 방지
		
		String name = oldFile.getName();
		String body = "";  // 파일 명
		String ext = "";   // 확장자
		
		int dot = name.lastIndexOf('.');
		
		if(dot != -1) {
			// 확장자가 있다면
			body = name.substring(0, dot);
			ext = name.substring(dot);
		} else {
			body = name;
		}
		
		String filename = sdf.format(new Date(currentTime))
		          + "_" + randomNumber + ext;
		File newFile = new File(oldFile.getParentFile(), filename);
				
		return newFile;		
		
	}

}
