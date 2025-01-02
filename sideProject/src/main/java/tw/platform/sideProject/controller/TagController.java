package tw.platform.sideProject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import tw.platform.sideProject.model.Tag;
import tw.platform.sideProject.service.TagService;

@RestController
@RequestMapping("/api/tags")
@CrossOrigin(origins = "*") // 避免 CORS 問題
public class TagController {

	@Autowired
    private TagService tagService;

    // 新增標籤
    @PostMapping("/addTag")
    public String addTag(@RequestBody List<Tag> tags) {
        return tagService.addTags(tags);
    }
}
