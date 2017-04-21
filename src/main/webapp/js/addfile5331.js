window.onload = function () {

    // 选择图片
    document.getElementById('img').onchange = function () {

        //选检查已添加的数量是否招标
        if (checkFileCount() == false) {
            return;
        }

        var img = event.target.files[0];

        ////////压缩图片
        var file = this.files[0];


        var obj = "J_ProUrl";
        var imgobj = "img_" + obj;

        var strext = img.name.substring(img.name.lastIndexOf('.')).toLowerCase();
        var picName = JSGuid() + strext;
        var path = document.getElementById("hid_path").value.toLowerCase();

        if (strext != ".jpg" && strext != ".gif" && strext != ".jpeg" && strext != ".bmp" && strext != ".png") {
            alert("请上传图片格式的文件，谢谢。");
            return false;
        }



        $("#" + imgobj).show();
        document.getElementById(imgobj).src = "./images/140206113522-0.jpg";



        ////////////判断是否支持HTML5
        if (gt_iosvs()) {

            // var url = webkitURL.createObjectURL(file);
            var url = window.URL.createObjectURL(file);//webkitURL.createObjectURL(file);
            
            
            	/* 生成图片
            * ---------------------- */
            var $img1 = new Image();
            $img1.src = url;
            $img1.onload = function () {
                //生成比例
                var width = $img1.width;
                var height = $img1.height;
                var scale = width / height;

                // var  toheight = ow > width ? originalImage.Height * width / originalImage.Width : originalImage.Height;
                //var   towidth=ow>width?width:ow;

                var towidth = 1800;
                var toheight = 0;
                if (width > towidth) {
                    toheight = height * towidth / width;

                }
                else {
                    toheight = height;
                    towidth = width;
                }

                if (toheight > 1800) {

                    towidth = towidth * 1800 / toheight;
                    toheight = 1800;

                }

                //  width = parseInt(800);
                //  height = parseInt(width / scale);

                //生成canvas
                var $canvas = $('#canvas');
                var ctx = $canvas[0].getContext('2d');
                $canvas.attr({ width: towidth, height: toheight });
                ctx.drawImage($img1, 0, 0, towidth, toheight);
                var base64 = null;
                if (towidth <= width) {
                    base64 = $canvas[0].toDataURL('image/jpeg', 0.8);
                    //var base64 = $canvas[0].toDataURL();
                } else {
                    base64 = $canvas[0].toDataURL('image/jpeg', 0.9);
                }

              /*  //发送到服务端
                $.post("/do.aspx", { "action": "addPicToServer", "flag": Math.random(), "from": "web", "path": path, "oldfilename": picName, img: base64 }, function (data) {
                    if (typeof (data.Result[0].error) != 'undefined') {


                        if (data.Result[0].error != '') {
                            alert(data.Result[0].error);
                            //$("#" + imgobj).hide();
                            document.getElementById(imgobj).src = "/images/err.jpg";
                        }
                        else {
                            if (data.Result[0].sate == -1) {
                                alert(data.Result[0].msg);
                                // $("#" + imgobj).hide();
                                document.getElementById(imgobj).src = "/images/err.jpg";
                                return;
                            }
                            else {
                                var imgurl = data.Result[0].imgurl;
                                addFile(imgurl);
                                $("#" + imgobj).show();
                                document.getElementById(imgobj).src = "/images/ok1.png";
                            }
                        }
                    }


                }, 'json');*/
            }
            $img1.onerror = function () {
                alert("上传失败：1、请检查图片是否损坏 2、请检查网络是否正常");
                document.getElementById(imgobj).src = "./images/140206113522-0.jpg";

                return;
            };

        }
        else {

            var reader = new FileReader();
            reader.readAsDataURL(img);
            //原文件名
            reader.onload = function (e) { // reader onload start
                // ajax 上传图片
                $.post("/do.aspx", { "action": "addPicToServer", "flag": Math.random(), "from": "web", "path": path, "oldfilename": picName, img: e.target.result }, function (data) {

                    if (typeof (data.Result[0].error) != 'undefined') {


                        if (data.Result[0].error != '') {
                            alert(data.Result[0].error);
                            //$("#" + imgobj).hide();
                            document.getElementById(imgobj).src = "/images/err.jpg";
                        }
                        else {
                            if (data.Result[0].sate == -1) {
                                alert(data.Result[0].msg);
                                // $("#" + imgobj).hide();
                                document.getElementById(imgobj).src = "/images/err.jpg";
                                return;
                            }
                            else {
                                var imgurl = data.Result[0].imgurl;
                                addFile(imgurl);
                                $("#" + imgobj).show();
                                document.getElementById(imgobj).src = "/images/ok1.png";
                            }
                        }
                    }


                }, 'json');
            } // reader onload end
        }
    }
}

function checkFileCount() {
    var hidimgurl = document.getElementById("hid_url").value;
    var cou = hidimgurl.split(",").length;
    if (cou >= 20) {
        alert("添加失败：图片数据超出20张，请分批上传");
        return false;
    }
    else {
        return true;
    }
}

function delFile(url) {
    //删除图片
    var hidimgurl = document.getElementById("hid_url").value;
    hidimgurl = hidimgurl.replace(url, "");
    document.getElementById("hid_url").value = hidimgurl;

    ShowFile();
}
function addFile(url) {
    //添加图片
    var hidimgurl = document.getElementById("hid_url").value;

    if (hidimgurl != "") {
        hidimgurl = hidimgurl + "," + url;
    }
    else {
        hidimgurl = url;
    }

    document.getElementById("hid_url").value = hidimgurl;

    ShowFile();
}
function ShowFile() {
    //显示图片
    var path = document.getElementById("hid_path").value;
    var hidimgurl = document.getElementById("hid_url").value;
    document.getElementById("Div_showImg").innerHTML = "";
    for (var i = 0; i < hidimgurl.split(",").length ; i++) {
        if (hidimgurl.split(",")[i] != "") {
            document.getElementById("Div_showImg").innerHTML += "<div style='margin:2px;float:left;text-align:center'><div style='margin:2px;border: solid 1px #e4e1e1; padding: 2px;'><img src='\\file\\temp\\" + path + "\\small\\" + hidimgurl.split(",")[i] + "' id='uimg_" + (i + 1) + "' onclick='picwh(" + (i + 1) + ")' style='height:90px;width:90px;'/></div><input type='button' onclick=\"delFile('" + hidimgurl.split(",")[i] + "')\" value='删除' /></div>";
        }
    }
    //  setTimeout("ShowFile()", 1000);
}

var isopen = false;
var newImg;
var openid = "";
var w = 100;  //将图片宽度+200
var h = 100;  // 将图片高度 +200

function picwh(objid) {
    var obj;
    if (openid != "") {

        if (openid != objid && $(document.getElementById("uimg_" + openid)).width() > 100) {
            obj = document.getElementById("uimg_" + openid);


            $(obj).width($(obj).width() - w);
            $(obj).height($(obj).height() - h);
            moveImg(-0, 0, obj);

        }


    }
    if ($(document.getElementById("uimg_" + objid)).width() > 100) {
        openid = objid;
        obj = document.getElementById("uimg_" + objid);

        $(obj).width($(obj).width() - w);
        $(obj).height($(obj).height() - h);
        moveImg(-0, 0, obj);

    }
    else if ($(document.getElementById("uimg_" + objid)).width() < 100) {

        openid = objid;
        obj = document.getElementById("uimg_" + objid);

        $(obj).width($(obj).width() + w);
        $(obj).height($(obj).height() + h);
        moveImg(0, 0, obj);
    }
    //  }
    //  else {
    //      isopen = false;
    //      $(obj).width($(obj).width() - w);
    ////     $(obj).height($(obj).height() - h);
    //     moveImg(-0, 0,obj);
    //}
}
//移位
i = 0;
function moveImg(left, top, obj) {
    newImg = obj;
    var offset = $(newImg).offset();
    $(newImg).offset({ top: offset.top + top, left: offset.left + left });
    if (i == 10) {
        i = 0;
        return;
    }
    //  setTimeout("moveImg(" + left + "," + top + ")", 10);
    i++;
}


function JSGuid() {
    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
        var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
        return v.toString(16);
    });
}


function gt_iosvs() {

    // 判断是否 iPhone 或者 iPod
    if ((navigator.userAgent.match(/iPhone/i) || navigator.userAgent.match(/iPod/i))) {
        // 判断系统版本号是否大于 4
        if (Boolean(navigator.userAgent.match(/OS [1-7]_\d[_\d]* like Mac OS X/i))) {
            return false;
        }
        else {
            return true;
        }
    }
    else if (navigator.userAgent.match(/qq/i)) {
        return false;
    }
    else {
        //非苹果系统
        //非苹果系统

        try {
            // var filetest = document.getElementById("img").files[0];

            //  window.URL.createObjectURL(filetest);//webkitURL.createObjectURL(file);
            document.createElement('canvas').getContext('2d');
            return true;
        }
        catch (e) {
            return false;

        }
    }

}
