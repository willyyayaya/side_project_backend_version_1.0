

//<!-- 頭像JS部分 -->

//顯示選擇的圖片預覽
function previewImage() {
    const file = document.getElementById('upload').files[0];
    const reader = new FileReader();

    reader.onloadend = function () {
        document.getElementById('icon').src = reader.result;
    }

    if (file) {
        reader.readAsDataURL(file);
    }
}

// 提交圖片新表单
function submitImage(picurl) {
    var form = document.getElementById('updateIcon'); // 获取图片表单
    var formData = new FormData(form); // 将图片表单数据转为 FormData 对象

    const base64Image = document.getElementById("icon").src;  // 获取 Base64 字符串

    formData.append('picurl', base64Image);  // 添加 base64 图片数据到 FormData 中

    // 假设 URL 为 /memberHome/12345
    const path = window.location.pathname;
    const memberid = path.split('/').pop();  // 这会获取到路径中的最后一个部分 103

    // 动态构建 URL，替换 {memberid} 为实际的 memberid
    var url = `/api/members/memberHome/${memberid}/update`;  // 加上 /api/members 路径前缀

    // 通过 Fetch 请求将 Base64 字符串传递到后端
    fetch(url, {
        method: 'POST',
        body: formData
    })
        .then(response => {
            if (response.ok) {
                alert(picurl + ' 更新成功！');
            } else {
                alert('更新失敗，請稍後再試！');
            }
        })
        .catch(error => {
            console.error("錯誤:", error);
            alert('更新失敗，請稍後再試！');
        });
}

//獲取 memberid
const path = window.location.pathname;
const memberid = path.split('/').pop(); // 從 URL 獲取 memberid

// 確保 memberid 是有效的
if (!memberid || isNaN(memberid)) {
    console.error("Invalid memberid:", memberid);
    alert("Invalid member ID");
} else {
   
}

// 設置連結的 href 屬性
   const link1 = document.getElementById("link1");
   const link2 = document.getElementById("link2");
   const link3 = document.getElementById("link3");
   const link4 = document.getElementById("link4");

   link1.href = `/memberProjectP1/${memberid}`;
      link2.href = `/memberlike/${memberid}`;
      // link3.href 的設置是根據需求而定，你可以取消註解並設置一個正確的 URL
      link3.href = `http://localhost:8080/order_edit`;
      link4.href = `/OrderProjectP1/${memberid}`;

//const picurl = member.picurl;  // 假設圖片 URL 存在於 member.picurl

const url = `/api/memberOrders/getOrdersByMemberid/${memberid}`; // 根據 memberid 獲取收藏的專案
fetch(url)
    .then(response => response.json())
    .then(data => {
        //console.log(data); // 檢查 API 返回的資料
        //console.log(data.member); // 檢查 API 返回的資料
        //console.log(data[0].member.picurl); // 訪問陣列中的第一個元素的 member 屬性

        // 確保 member 資料存在且包含 picurl
        if (Array.isArray(data) && data.length > 0) {
            const filteredData = data.filter(orderData => orderData.id.memberid > 0);

            if (filteredData.length > 0) {
                filteredData.forEach(orderData => {

                    // 使用變數抓取對應的資料
                    const order = orderData.order;  // order 資料
                    const member = orderData.member;  // member 資料

                    //console.log(orderData.member); // 檢查 API 返回的資料

                    //const picurl = member.picurl;  // 假設圖片 URL 存在於 member.picurl

                    const memberpicDiv = document.getElementById("icon_test");  // 替換為您的目標 div ID
                    memberpicDiv.innerHTML = `
					<img  name="picurl" id="icon" src="${member.picurl}" width="100%" height="100%" alt="iconimage" onclick="document.getElementById('upload').click();" />                    			
    `;
             
	   }
                )
            }
        }
    });


//<!-- card js -->


window.addEventListener('DOMContentLoaded', (event) => {
    const path = window.location.pathname;
    const pathParts = path.split('/');
    const memberid = pathParts[pathParts.length - 1];
    //console.log("Extracted memberid:", memberid);

    if (!memberid || isNaN(memberid)) {
        console.error("Invalid memberid:", memberid);
        alert("Invalid member ID");
        return;
    }

    const url = `/api/memberOrders/getOrdersByMemberid/${memberid}`;
    fetch(url)
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
            const box1 = document.getElementById("box_1_cards");
            const box2 = document.getElementById("box_2_cards");
            const box3 = document.getElementById("box_3_cards");

            //console.log("Fetched data:", data);
            if (Array.isArray(data)) {
                data.forEach(orderData => {
                    const card = document.createElement("div");
                    card.classList.add("Card");

                    const deadline = new Date(orderData.order.deadline);
                    const today = new Date();
                    const status = deadline > today ? '進行中' : '已完成';



                    // 使用變數抓取對應的資料
                    const order = orderData.order;  // order 資料
                    const member = orderData.member;  // member 資料

					card.innerHTML = `
					    <img src="${order.picurl}" alt="${order.orderid}" style="width:150px;height:150px;">
					    <h4>${order.name}</h4>
						<p class="title">${order.intro.length > 10 ? order.intro.substring(0, 10) + '...' : order.intro}</p>
					    <!-- 只在 box3 中的卡片按鈕才帶有觸發彈窗的功能 -->
					    ${status === '已完成' ? 
					        `<button class="Card_btn" id="openPopupBtn" data-bs-toggle="modal" data-bs-target="#MyModal" data-order-id="${order.orderid}">評價</button>` 
					        : 
					        `<button class="Card_btn">編輯</button>`
					    }
					`;

					// 如果 order.status 是 '進行中'，將 card 加入 box1 (進行)
					if (status === '進行中' && orderData.getproject == true && orderData.owned === true) {
					    box1.appendChild(card);
					}

					// 如果 orderData.wanted 是 true，將 card 加入 box3 (結束)
					if (status === '已完成' && orderData.getproject == true && orderData.owned === true) {
					    box3.appendChild(card);
					}

					// 如果 order.status 是 '尚未完成'，將 card 加入 box2 (申請)
					if (status === '進行中' && orderData.getproject == false && orderData.owned === true) {
					    box2.appendChild(card);
					}


                });
            } else {
                console.error("Received data is not an array or is empty.");
            }
        })
        .catch(error => {
            console.error("Error fetching orders:", error);
        });
});