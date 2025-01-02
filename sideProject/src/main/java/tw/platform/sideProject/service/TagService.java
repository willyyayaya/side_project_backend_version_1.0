package tw.platform.sideProject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jakarta.transaction.Transactional;
import tw.platform.sideProject.model.Tag;
import tw.platform.sideProject.repository.TagRepository;

import java.util.List;
import java.util.Optional;

@Service
public class TagService {

    @Autowired
    private TagRepository tagRepository;

    public String addTags(List<Tag> tags) {
    	// 新增技能 (Tag)
        Tag javaTag = new Tag();
        javaTag.setTagidm(5);
        javaTag.setTagido(5);
        javaTag.setTagname("JavaScript");
        tagRepository.save(javaTag);

//        Tag springTag = new Tag();
//        springTag.setTagidm(6);
//        springTag.setTagido(6);
//        springTag.setTagname("Python");
//        tagRepository.save(springTag);

        return "標籤新增成功";
    }

    // 新增標籤
    @Transactional
    public void saveTag(Tag tag) {
        tagRepository.save(tag);
    }

    // 查詢所有標籤
    public List<Tag> getAllTags() {
        return tagRepository.findAll();
    }

    // 根據ID查詢標籤
    public Optional<Tag> getTagById(int tagId) {
        return tagRepository.findById(tagId);
    }

    // 更新標籤資料
    public Tag updateTag(int tagId, Tag tagDetails) {
    	
        return tagRepository.findById(tagId).map(tag -> {
            tag.setTagname(tagDetails.getTagname());
            tag.setTagido(tagDetails.getTagido());
            return tagRepository.save(tag);
        }).orElseThrow(() -> new RuntimeException("標籤ID不存在"));
    }

    // 刪除標籤
    public void deleteTag(int tagId) {
        tagRepository.deleteById(tagId);
    }
}
