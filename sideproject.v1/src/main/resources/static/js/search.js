// 隨機關鍵字
function getRandomKeyword() {
    fetch('/randomKeyword')
        .then(response => response.text())
        .then(keyword => {
            randomKeyword = keyword;
            var searchInput = $("#keyword");
            searchInput.val(keyword);
            searchInput.addClass("randomKeyword")
        })
        .catch(error => console.error('抓取關鍵字錯誤:', error));
}

//使用者點搜尋框時清除隨機關鍵字
function clearPlaceholder() {
    var searchInput = $("#keyword");
    if (searchInput.val() === randomKeyword) {
        searchInput.val("");
        searchInput.removeClass("randomKeyword");
    }
}

// 拿URL的值
function getQueryParams() {
    var urlParams = new URLSearchParams(window.location.search);
    let params = {};
    urlParams.forEach((value, key) => {
        if (!params[key]) {
            params[key] = [];
        }
        params[key].push(decodeURIComponent(value));
    });
    return params;
}
// 解URL的值
function applyQueryParams(params) {
    if (params.keyword) {
        $("#keyword").val(params.keyword[0]);
    }
    if (params.options) {
        params.options.forEach(option => {
            let checkbox = $(`input[name="options"][value="${option}"]`);
            if (checkbox.length) {
                checkbox.prop("checked", true);
            }
        });
    }
}

$(document).ready(function () {
    console.log("I'm ready !!!");

    var randomKeyword = "";

    let params = getQueryParams();
    applyQueryParams(params);

    var keyword = $("#keyword").val();
    var options = $("input[name='options']:checked");


    if (keyword === "" && options.length === 0) {
        keyword = "";
        getRandomKeyword();
    }

    //鍵盤監聽事件
    $(document).on('keypress', function (e) {
        if (e.which === 13) {
            e.preventDefault();
            $("#searchButton").click();
        }
    })

    $("#keyword").on('focus', function () {
        clearPlaceholder();
    });

    //當搜尋鈕被點擊時處理請求及更新URL
    $("#searchButton").on('click', function () {
        console.log("搜尋頁觸發搜尋");
        var keyword = $("#keyword").val();
        var option = [];

        //搜集被選到的checkBox
        $("input[name='options']:checked").each(function () {
            option.push($(this).val());
        });
        option = option.length ? option : [];
        console.log(option.length);
        //交給後端存入關鍵字
        if (keyword != "" || option.length != 0) {
            var params = new URLSearchParams();
            params.append("keyword", encodeURIComponent(keyword));
            option.forEach(option =>
                params.append("options", encodeURIComponent(option)));

            $.post("/SaveAndSearchKeyword", { userKeyword: keyword, options: option }, function (response) {
                console.log("關鍵字已儲存");
                //利用thymeleaf模板返回搜尋資料
                fetch("/SaveAndSearchKeyword")
                    .then(response => response.text())
                    .then(data => {
                        $("#keywordsearchBox").html(data);
                    })
                    .catch(error => console.error('Error loading content:', error));
                //存為URL
                window.location.href = "/search?" + params.toString();
            }).fail(function (jqXHR, textStatus, errorThrown) {
                console.log("請求失敗: " + textStatus + ", " + errorThrown);
            });
            console.log("使用者輸入為: " + keyword + ",checkbox: " + option);
        }

    });
    //針對新增在頁面上的關鍵字加入點擊功能
    $(".keywordBtn").on('click', function () {
        console.log($(this).text());
        $("#keyword").val($(this).text().trim());
        $("#searchButton").click();
    })

    //排序按鈕
    $("#caseTimeDSC").on('click', function () {
        console.log("排序被點擊");
        $("#keywordsearchBox").load("/caseTimeDSC", function (response, status, xhr) {
            if (status === "error") {
                console.error('Error loading content:', xhr.statusText);
            } else {
                console.log('Content loaded successfully.');
            }
        });
    });
    $("#caseTimeASC").on('click', function () {
        console.log("排序被點擊");
        $("#keywordsearchBox").load("/caseTimeASC", function (response, status, xhr) {
            if (status === "error") {
                console.error('Error loading content:', xhr.statusText);
            } else {
                console.log('Content loaded successfully.');
            }
        });
    });
    $("#caseCollected").on('click', function () {
        console.log("收藏排序被點擊");
        $("#keywordsearchBox").load("/caseCollected", function (response, status, xhr) {
            if (status === "error") {
                console.error('Error loading content:', xhr.statusText);
            } else {
                console.log('Content loaded successfully.');
            }
        });
    });
    //新增全選選項
    $("input").change(function () {
        $(`input[class='${this.id}']`).prop('checked', this.checked);
        $(`input[id='location']`).prop('checked',
            $(`input[class='location']:checked`).length ==
            $(`input[class='location']`).length);
        $(`input[id='category']`).prop('checked',
            $(`input[class='category']:checked`).length ==
            $(`input[class='category']`).length);
        $(`input[id='front']`).prop('checked',
            $(`input[class='front']:checked`).length ==
            $(`input[class='front']`).length);
        $(`input[id='back']`).prop('checked',
            $(`input[class='back']:checked`).length ==
            $(`input[class='back']`).length);
        $(`input[id='database']`).prop('checked',
            $(`input[class='database']:checked`).length ==
            $(`input[class='database']`).length);
    });

});