package tw.platform.sideProject.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.platform.sideProject.model.AddOrderRequest;
import tw.platform.sideProject.model.Order;
import tw.platform.sideProject.model.OrderTag;
import tw.platform.sideProject.model.OrderTagKey;
import tw.platform.sideProject.model.Tag;
import tw.platform.sideProject.repository.OrderRepository;
import tw.platform.sideProject.repository.OrderTagRepository;
import tw.platform.sideProject.repository.TagRepository;

@Service
public class OrderService {

	@Autowired
	private OrderRepository orderRepository;

	@Autowired
	private TagRepository tagRepository;

	@Autowired
	private OrderTagRepository orderTagRepository;

	// 新增專案
	public Map<String, Object> addOrder(AddOrderRequest request) {
		Map<String, Object> response = new HashMap<>();
		// 建立並儲存 Order
		Order order = new Order();
		order.setName(request.getName());
		order.setIntro(request.getIntro());
		order.setDeadline(request.getDeadline());
		order.setDetail(request.getDetail());
		order.setPicurl(request.getPicurl());
		order.setLocation(request.getLocation());
		order.setPeople(request.getPeople());
		order.setBudget(request.getBudget());
		order.setUpload(request.getUpload());
		order.setNewdate(request.getNewdate());
		order.setCategory(request.getCategory());
		orderRepository.save(order);

		// 建立並儲存 OrderTag
		List<OrderTag> orderTags = new ArrayList<>();
		for (Integer tagId : request.getTagIds()) {
			Tag tag = tagRepository.findById(tagId)
					.orElseThrow(() -> new RuntimeException("Tag not found for ID: " + tagId));

			OrderTagKey orderTagKey = new OrderTagKey(order.getOrderid(), tag.getTagidm());
			OrderTag orderTag = new OrderTag();
			orderTag.setId(orderTagKey);
			orderTag.setOrder(order);
			orderTag.setTag(tag);

			orderTags.add(orderTag);
		}
		orderTagRepository.saveAll(orderTags);
		System.out.println(order.getOrderid());

		response.put("orderId", order.getOrderid());
		return response;
	}

	// 查詢所有專案
	public List<Order> getAllOrders() {
		return orderRepository.findAll();
	}

	// 根據 ID 查詢專案
	public Optional<Order> getOrderById(Long orderId) {
		return orderRepository.findById(orderId);
	}

	// 更新專案資料
	public Order updateOrder(Long orderId, Order orderDetails) {

		return orderRepository.findById(orderId).map(existingOrder -> {
			// 僅更新非空欄位
			if (orderDetails.getName() != null) {
				existingOrder.setName(orderDetails.getName());
			}
			if (orderDetails.getIntro() != null) {
				existingOrder.setIntro(orderDetails.getIntro());
			}
			if (orderDetails.getDeadline() != null) {
				existingOrder.setDeadline(orderDetails.getDeadline());
			}
			if (orderDetails.getDetail() != null) {
				existingOrder.setDetail(orderDetails.getDetail());
			}
			if (orderDetails.getPicurl() != null) {
				existingOrder.setPicurl(orderDetails.getPicurl());
			}
			if (orderDetails.getLocation() != null) {
				existingOrder.setLocation(orderDetails.getLocation());
			}
			if (orderDetails.getRank() != null) {
				existingOrder.setRank(orderDetails.getRank());
			}
			if (orderDetails.getPeople() != null) {
				existingOrder.setPeople(orderDetails.getPeople());
			}
			// 儲存更新後的資料
			return orderRepository.save(existingOrder);
		}).orElseThrow(() -> new RuntimeException("專案 ID 不存在: " + orderId));
	}

	// 刪除專案
	public void deleteOrder(Long orderId) {
		// 刪除該專案的所有 OrderTag
		orderTagRepository.deleteByOrderid(orderId);

		// 刪除專案
		orderRepository.deleteById(orderId);
	}

	public Integer addRank(Long orderId, AddOrderRequest rank) {
		Optional<Order> orderOptional = orderRepository.findById(orderId);
		if (orderOptional.isPresent()) {
			Order order = orderOptional.get();
			order.setRank(rank.getRank()); // 更新 rank 分數
			orderRepository.save(order); // 保存更新後的訂單
			return order.getRank(); // 回傳新的 rank
		}
		throw new RuntimeException("專案 ID 不存在: " + orderId);
	}
}
