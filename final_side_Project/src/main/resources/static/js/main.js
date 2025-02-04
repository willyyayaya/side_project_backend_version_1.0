$(document).ready(async function() {

	let orderId = document.querySelector('meta[name="orderId"]').getAttribute('content');
	//let memberId = document.querySelector('meta[name="memberId"]').getAttribute('content');
	let memberId = 1;
	console.log('memberId: ' + memberId);
	console.log('orderId:' + orderId);

	let orderUrl = `http://localhost:8080/api/orders/getOrderById/${orderId}`;
	let responseOrder = await fetch(orderUrl);
	let responseOrderToJSON = await responseOrder.json();

	console.log(responseOrderToJSON);
	console.log(responseOrderToJSON.category);
	switch (responseOrderToJSON.category) {
		case 'web':
			category.innerText = '網頁';
			break;
		case 'game':
			category.innerText = '遊戲';
			break;
		case 'app':
			category.innerText = 'APP';
			break;
		default:
			category.innerText = '其他';
			break;
	}
	release.innerText = responseOrderToJSON.upload;
	projectTitle.innerText = responseOrderToJSON.name;
	updateDate.innerText = '最新更新時間:' + responseOrderToJSON.newdate;
	budget.innerText = '預算 : ' + responseOrderToJSON.budget;
	//地點換算
	console.log(responseOrderToJSON.location);
	switch (responseOrderToJSON.location) {
		case 'taipei':
			area.innerText = '地點 : 台北市';
			break;
		case 'newTaipei':
			area.innerText = '地點 : 新北市';
			break;
		case 'taoyuan':
			area.innerText = '地點 : 桃園市';
			break;
		case 'taichung':
			area.innerText = '地點 : 台中市';
			break;
		case 'tainan':
			area.innerText = '地點 : 台南市';
			break;
		case 'kaohsiung':
			area.innerText = '地點 : 高雄市';
			break;
		case 'keelung':
			area.innerText = '地點 : 基隆市';
			break;
		case 'hsinchuCity':
			area.innerText = '地點 : 新竹市';
			break;
		case 'chiayiCity':
			area.innerText = '地點 : 嘉義市';
			break;
		case 'yilan':
			area.innerText = '地點 : 宜蘭縣';
			break;
		case 'hsinchuCounty':
			area.innerText = '地點 : 新竹縣';
			break;
		case 'miaoli':
			area.innerText = '地點 : 苗栗縣';
			break;
		case 'changhua':
			area.innerText = '地點 : 彰化縣';
			break;
		case 'nantou':
			area.innerText = '地點 : 南投縣';
			break;
		case 'yunlin':
			area.innerText = '地點 : 雲林縣';
			break;
		case 'chiayiCounty':
			area.innerText = '地點 : 嘉義縣';
			break;
		case 'pingtung':
			area.innerText = '地點 : 屏東縣';
			break;
		case 'hualien':
			area.innerText = '地點 : 花蓮縣';
			break;
		case 'taitung':
			area.innerText = '地點 : 台東縣';
			break;
		case 'penghu':
			area.innerText = '地點 : 澎湖縣';
			break;
		case 'kinmen':
			area.innerText = '地點 : 金門縣';
			break;
		case 'lienchiang':
			area.innerText = '地點 : 連江縣';
			break;
		case 'remote':
			area.innerText = '地點 : 遠端工作';
			break;
		default:
			area.innerText = '地點 : 公司';
			break;
	}
	head.innerText = '建議人數 : ' + responseOrderToJSON.people + '人';
	deadline.innerText = '申請截止日 : ' + responseOrderToJSON.deadline;
	//需要技能
	let skillsUrl = `http://localhost:8080/api/tags/getTag/${orderId}`;
	let responseSkill = await fetch(skillsUrl);
	let responseSkillToJSON = await responseSkill.json();
	console.log(responseSkillToJSON);
	skill.innerText = '需要技能 : ' + responseSkillToJSON;

	//會員資料
	//顯示發案者頭像和名字
	//1.抓取會員資料
	let memberUrl = `http://localhost:8080/api/memberOrders/getMemberIdByOrderId/${orderId}`;
	let responseMember = await fetch(memberUrl);
	let responseMemberToJSON = await responseMember.json();
	console.log(responseMemberToJSON);
	console.log(responseMemberToJSON[0].memberid);
	//2.以會員id去拿個人資料
	imgBorder.innerHTML = `<img class="img-fluid object-fit-contain" src="${responseMemberToJSON[0].picurl}">`;
	memberName.innerText = `${responseMemberToJSON[0].name}`;

	let rankUrl = `http://localhost:8080/api/memberOrders/getRank/${responseMemberToJSON[0].memberid}`;
	let responseRank = await fetch(rankUrl);
	let responseRankToJSON = await responseRank.json();
	console.log(responseRankToJSON);
	if (responseRankToJSON === 0) {
		rank.innerText = '尚未評價過'
	} else {
		rank.innerText = '評價:' + (responseRankToJSON).toFixed(2) + '分';
	}

	//內容
	detail.innerHTML = responseOrderToJSON.detail;

	//看目前使用者是誰來決定要顯示其他案件或是決定接案者
	if (responseMemberToJSON[0].memberid == `${memberId}`) {
		$('#another').css('display', 'none');
		//列出已決定的申請案件人
		let getedUrl = `http://localhost:8080/api/memberOrders/allMemberGeted/${orderId}`;
		let responseGeted = await fetch(getedUrl);
		let responseGetedToJSON = await responseGeted.json();
		console.log(responseGetedToJSON);

		responseGetedToJSON.forEach(item => {

			let another2 = $('<div>', {
				id: 'another2',
				class: 'mx-auto rounded-2',
			});

			let anotherTitle2 = $('<div>', {
				id: 'anotherTitle',
				text: item.name,
			});

			let anotherImg2 = $('<img>', {
				id: 'anotherImg',
				src: item.picurl,
				class: "img-fluid object-fit-contain"
			});


			let anotherButtonArea = $('<div>', {
				id: 'ButtonArea',
				class: "mt-2"
			});

			let anotherButton = $('<button>', {
				id: 'anotherButton',
				text: "已決定",
				class: "btn btn-outline-primary",
				disabled: 'true'
			});
			//console.log(anotherButton);
			anotherButtonArea.append(anotherButton);
			another2.append(anotherTitle2, anotherImg2, anotherButtonArea);

			let anotherpro2 = $('<a>', {
				class: 'd-inline col-md-3 mt-1',
				href: '',
			});
			anotherpro2.append(another2);
			$('#getProject').append(anotherpro2);
		});
		//列出來還未決定但來申請案件的人
		let getUrl = `http://localhost:8080/api/memberOrders/allMemberWanted/${orderId}`;
		let responseGet = await fetch(getUrl);
		let responseGetToJSON = await responseGet.json();
		console.log(responseGetToJSON);

		responseGetToJSON.forEach(item => {

			let another2 = $('<div>', {
				id: 'another2',
				class: 'mx-auto rounded-2',
			});

			let anotherTitle2 = $('<div>', {
				id: 'anotherTitle',
				text: item.name,
			});

			let anotherImg2 = $('<img>', {
				id: 'anotherImg',
				src: item.picurl,
				class: "img-fluid object-fit-contain"
			});


			let anotherButtonArea = $('<div>', {
				id: 'ButtonArea',
				class: "mt-2"
			});

			let anotherButton = $('<button>', {
				id: 'anotherButton',
				text: "決定交給他了",
				class: "btn btn-outline-primary"
			});
			//console.log(anotherButton);
			anotherButtonArea.append(anotherButton);
			another2.append(anotherTitle2, anotherImg2, anotherButtonArea);

			let anotherpro2 = $('<a>', {
				class: 'd-inline col-md-3 mt-1',
				href: '',
			});

			anotherpro2.append(another2);
			$('#getProject').append(anotherpro2);

			anotherButton[0].onclick = function() {
				let ButtonUrl = 'http://localhost:8080/api/memberOrders/getproject';
				fetch(ButtonUrl, {
					method: 'PUT',
					headers: {
						'Content-Type': 'application/json',
					},
					body: JSON.stringify({
						memberId: item.memberid,
						orderId: orderId,
						"getproject": 1
					})
				})
				alert('就決定是他了');
			}
		});

	} else {
		$('#getProject').css('display', 'none');
		//推薦其他專案
		let anotherUrl = 'http://localhost:8080/api/orders/getAllOrders';
		let responseAnother = await fetch(anotherUrl);
		let responseAnotherToJSON = await responseAnother.json();
		let availableItems = [...responseAnotherToJSON];

		for (let i = 0; i < 4; i++) {
			if (availableItems.length === 0) break;  // 如果沒有足夠資料，跳出循環

			const index = Math.floor(Math.random() * availableItems.length);
			const element = availableItems[index];

			// 從可用的資料中移除選中的元素，避免重複
			availableItems.splice(index, 1);

			//const element = responseAnotherToJSON[i];
			// console.log(element);
			let another1 = $('<div>', {
				id: 'another1',
				class: 'mx-auto rounded-2',
			});

			let anotherTitle = $('<div>', {
				id: 'anotherTitle',
				text: element.name,
			});

			let anotherImg = $('<div>', {
				id: 'anotherImg',
				text: element.intro,
			});
			another1.append(anotherTitle, anotherImg)
			let anotherpro = $('<a>', {
				class: 'd-inline col-md-3 mt-1',
				href: '',
			});
			anotherpro.append(another1);
			$('#another').append(anotherpro);
		}

	}


	//編輯和申請按鈕
	if (responseMemberToJSON[0].memberid == `${memberId}`) {
		$('#edit').css('display', 'block');
	} else {
		$('#apply').css('display', 'block');
		let memberWantUrl = `http://localhost:8080/api/memberOrders/memberWanted/${orderId}/${memberId}`
		let responseWant = await fetch(memberWantUrl);
		let responseWantToJSON = await responseWant.json();
		console.log(responseWantToJSON);
		if (responseWantToJSON == true) {
			$('#apply').text('已申請');
		};
	}

	edit.onclick = function() {
		window.location.href = `/order_update/${orderId}`;
	}

	apply.onclick = function() {
		let applyUrl = 'http://localhost:8080/api/memberOrders/addWantedOrder';
		fetch(applyUrl, {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify({
				memberId: memberId,
				orderId: orderId,
				"wanted": 1,
			})
		})
		//window.location.reload();
		$('#apply').text('已申請');
		$('#apply').prop('disabled', true);
	}

	if ($('#apply').text() === '已申請') {
		$('#apply').prop('disabled', true);
	}

	//顯示申請人數
	let applypeopleUrl = `http://localhost:8080/api/memberOrders/wanted/people/${orderId}`;
	let responsePreople = await fetch(applypeopleUrl);
	let responsePeopleToJSON = await responsePreople.json();
	console.log(responsePeopleToJSON);
	let applyPeople = '目前申請人數:' + responsePeopleToJSON + '人';
	$('#applyPeople').text(applyPeople);



	//收藏按鈕

	//先看是不是本人發的
	let collectUrl = `http://localhost:8080/api/memberOrders/getMemberIdByOrderId/${orderId}`;
	let responseCollect = await fetch(collectUrl);
	let responseCollectToJSON = await responseCollect.json();
	console.log('收藏者:' + responseCollectToJSON[0].memberid);

	if (responseCollectToJSON[0].memberid == `${memberId}`) {
		collect.style.visibility = "hidden";
	}

	//查會員是否已收藏
	let collectedUrl = `http://localhost:8080/api/memberOrders/collected/${orderId}/${memberId}`;
	let responseCollected = await fetch(collectedUrl);
	let responseCollectedToJson = await responseCollected.json();
	console.log('有沒有收藏:' + responseCollectedToJson);
	if (responseCollectedToJson === true) {
		collect.innerText = "已收藏";  // 初始顯示為「已收藏」
	} else {
		collect.innerText = "收藏";  // 初始顯示為「收藏」
	}

	collect.onclick = function() {
		let url;
		let collectedStatus;

		// 根據按鈕顯示的文字來判斷操作
		if (collect.innerText === "收藏") {
			url = 'http://localhost:8080/api/memberOrders/collected';
			collectedStatus = true;
			collect.innerText = "已收藏";
		} else {
			url = 'http://localhost:8080/api/memberOrders/removeMemberCollected';
			collectedStatus = false;
			collect.innerText = "收藏";
		}

		fetch(url, {
			method: 'PUT',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify({
				memberId: memberId,
				orderId: orderId,
				collected: collectedStatus
			})
		}).then(response => response.json())
			.then(data => {
				console.log("收藏狀態已更新:", data);
			}).catch(error => {
				console.error("Error:", error);
			});
	};
});