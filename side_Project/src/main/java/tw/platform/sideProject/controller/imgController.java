package tw.platform.sideProject.controller;

import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.http.ResponseEntity;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@RestController
@RequestMapping("/upload")
public class imgController {

	// 配置文件上传目录
	private static final String UPLOAD_DIR = "uploads/";

	// 确保上传目录存在
	public imgController() {
	        File directory = new File(UPLOAD_DIR);
	        if (!directory.exists()) {
	            directory.mkdirs();
	        }
	    }

	// 处理图片上传
	@PostMapping
	public ResponseEntity<?> uploadFile(@RequestParam("file") MultipartFile file) {
		// 检查文件是否为空
		if (file.isEmpty()) {
			return ResponseEntity.badRequest().body("No file uploaded");
		}

		try {
			// 获取文件的原始文件名
			String originalFilename = StringUtils.cleanPath(file.getOriginalFilename());

			// 防止文件名中出现路径遍历问题
			if (originalFilename.contains("..")) {
				return ResponseEntity.badRequest().body("Invalid file name");
			}

			// 保存文件到上传目录
			Path targetLocation = Paths.get(UPLOAD_DIR + originalFilename);
			Files.copy(file.getInputStream(), targetLocation);

			// 返回文件的访问 URL
			String fileDownloadUri = ServletUriComponentsBuilder.fromCurrentContextPath()
					.path("/" + UPLOAD_DIR + originalFilename).toUriString();

			return ResponseEntity.ok().body(new UploadResponse(fileDownloadUri));
		} catch (IOException ex) {
			return ResponseEntity.status(500).body("Failed to upload file");
		}
	}

	// 图片上传响应对象
	public static class UploadResponse {
		private String location;

		public UploadResponse(String location) {
			this.location = location;
		}

		public String getLocation() {
			return location;
		}

		public void setLocation(String location) {
			this.location = location;
		}
	}

}
