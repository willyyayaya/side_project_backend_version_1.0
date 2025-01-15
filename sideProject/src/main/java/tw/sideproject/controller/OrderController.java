package tw.sideproject.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import tw.sideproject.model.AddOrderRequest;
import tw.sideproject.model.Order;
import tw.sideproject.service.OrderService;

@RestController
@RequestMapping("/api/orders")
@CrossOrigin(origins = "*") // 避免 CORS 問題
public class OrderController {
	
	@Autowired
    private OrderService orderService;

	// 新增專案
    @PostMapping("/addOrder")
    public String addOrder(@RequestBody AddOrderRequest request) {
        return orderService.addOrder(request);
    }

    // 顯示所有專案
    @GetMapping("/getAllOrders")
    public List<Order> getAllOrders() {
        return orderService.getAllOrders();
    }

    // 根據 ID 查詢專案
    @GetMapping("/getOrderById/{orderId}")
    public Optional<Order> getOrderById(@PathVariable Long orderId) {
        return orderService.getOrderById(orderId);
    }

    // 根據 ID 更新專案資料
    @PutMapping("/updateOrder/{orderId}")
    public Order updateOrder(@PathVariable Long orderId, @RequestBody Order orderDetails) {
        return orderService.updateOrder(orderId, orderDetails);
    }

    // 根據 ID 刪除專案
    @DeleteMapping("/deleteOrder/{orderId}")
    public String deleteOrder(@PathVariable Long orderId) {
        orderService.deleteOrder(orderId);
        return "專案已成功刪除";
    }

}
