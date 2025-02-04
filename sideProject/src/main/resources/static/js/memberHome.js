
/**
 * 
 */


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

// // 確保 memberid 是有效的
// if (!memberid || isNaN(memberid)) {
//     console.error("Invalid memberid:", memberid);
//     alert("Invalid member ID");
// } else {
//     // 設置連結的 href 屬性
    const link1 = document.getElementById("link1");
    const link2 = document.getElementById("link2");
    const link3 = document.getElementById("link3");
    const link4 = document.getElementById("link4");

    link1.href = `/memberProjectP1/${memberid}`;
    link2.href = `/memberlike/${memberid}`;
    // link3.href 的設置是根據需求而定，你可以取消註解並設置一個正確的 URL
    // link3.href = `/memberProjectP1/${memberid}`;
    link4.href = `/OrderProjectP1/${memberid}`;
// }



//const picurl = member.picurl;  // 假設圖片 URL 存在於 member.picurl

// const memberpicDiv = document.getElementById("icon_test");  // 替換為您的目標 div ID
// memberpicDiv.innerHTML = `
// 	<div style="background-color: #bbc8d8;width: 90%;height: 75%;">
// 	<form id="updateIcon" th:action="@{/memberHome/{id}/update(id=${memberid})}" method="post" enctype="multipart/form-data">
// 	<div style="background-color: #bbc8d8;width: 90%;height: 15%;" id=icon_test>
// 	<img  name="picurl" id="icon" src="${member.picurl}" width="100%" height="100%" alt="iconimage" onclick="document.getElementById('upload').click();" />                    			<input type="file" id="upload" accept="image/*" style="display:none;" onchange="previewImage()" />
// 	<button type="button" id="icon_btn" onclick="submitImage('picurl')">更換圖片</button>
// `;


// 提交其他字段的更新表单
function submitField(fieldName) {
    var form = document.getElementById('updateForm'); // 获取其他字段表单
    var formData = new FormData(form); // 将表单数据转为 FormData 对象

    const path = window.location.pathname;
    const memberid = path.split('/').pop();  // 这会获取到路径中的最后一个部分 103

    // 动态构建 URL，替换 {memberid} 为实际的 memberid
    var url = `/api/members/memberHome/${memberid}/update`;  // 加上 /api/members 路径前缀

    // 通过 Fetch 请求将字符串传递到后端
    fetch(url, {
        method: 'POST',
        body: formData
    })
        .then(response => {
            if (response.ok) {
                alert(fieldName + ' 更新成功！');
            } else {
                alert('更新失敗，請稍後再試！');
            }
        })
        .catch(error => {
            console.error("錯誤:", error);
            alert('更新失敗，請稍後再試！');
        });
}
