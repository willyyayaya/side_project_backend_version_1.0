
package tw.platform.sideProject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpSession;
import tw.platform.sideProject.model.yuOrder;
import tw.platform.sideProject.service.KeywordService;

@Controller
public class KeywordController {

	@Autowired
	private KeywordService keywordService;
	
	//針對關鍵字進行搜尋，並將搜尋資料回傳至fragments的keywordsearchBox
	@PostMapping("/SaveAndSearchKeyword")
	@ResponseBody//回傳片段
	public void SaveAndSearchKeyword(@RequestParam String userKeyword,Model model, HttpSession session) {
		//TODO bug從找case進入時會帶入上一次搜尋的資料
		if(userKeyword!="") {
			//存關鍵字邏輯
			keywordService.saveKeyword(userKeyword);
			
			//查詢關鍵字
			List<yuOrder> list = keywordService.searchKeywords(userKeyword);
			System.out.println("根據關鍵詞 "+ userKeyword+" 搜尋共有 "+list.size()+" 筆資料");
			
			//確認一下搜尋到的資料(都完成後可刪除)
			//TODO 抓圖片邏輯從這邊加入
			for(yuOrder order :list) {
				String tagNames = order.getTagNames();
				System.out.printf("專案id %d.專案名稱:%s,簡介:%s,標籤:%s%n",order.getOrderid(),order.getName(),order.getIntro(),tagNames);
			}
			//將這邊的結果存到session，帶至搜尋頁
			session.setAttribute("keywordCase", list);
		}else {
			//隨機專案資料帶入
		}
		
	}


	@GetMapping("/randomKeyword")
	public ResponseEntity<String> getRandomKeyword() {
		String randomKeyword = keywordService.getRandomKeyword();
		return new ResponseEntity<>(randomKeyword, HttpStatus.OK);
	}
}
