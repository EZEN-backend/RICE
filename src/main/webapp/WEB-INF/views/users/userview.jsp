<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>rice 계정 설정</title>
    <style>
        .form {
            width: 700px;
            padding: 20px;
            margin: 20px auto 0 auto;
            gap: 20px;
            display: flex;
            flex-flow: column;
        }

        .form2 {
            width: 450px;
            padding: 20px;
            margin: 20px auto 0 auto;
            gap: 20px;
            display: flex;
            flex-flow: column;
        }

        .input-container {
            width: 700px;
            border: 1px solid #666;
            border-radius: 10px;
            padding: 24px 10px 18px 10px;
            position: relative;
        }

        .form2 .input-container {
            width: 450px;
            border: 1px solid #666;
            border-radius: 10px;
            padding: 24px 10px 18px 10px;
            position: relative;
        }


        .input-label {
            background-color: #fff;
            position: absolute;
            top: -10px;
            left: 7px;
            padding: 0 3px;
            font-size: 12px;
            color: #9b9b9b;
        }

        .input {
            font-size: 18px;
        }

        #address-change input[type=text],
        #address-change input[type=password] {
            border: 0px;
            outline: none;
            width: 450px;
            height: 25px;
        }

        .headline-1 {
            overflow-wrap: anywhere;
            hyphens: auto;
            margin-bottom: 24px;
        }

        .headline-2, .headline-3 {
            font-size: 16px;
            margin: 0;
        }

        .delete-account-container {
            border-top: 1px solid #efefef;
            border-bottom: 1px solid #efefef;
            padding: 20px 0;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .delete-button {
            border: 1px solid #efefef;
            border-radius: 25px;
            padding: 8px 16px;
        }

        .delete-button:hover {
            background-color: black;
            color: white;
            cursor: pointer;
        }

        .submit-button {
            display: block;
            width: fit-content;
            border: 1px solid #9e9e9e;
            border-radius: 25px;
            padding: 8px 16px;
            background-color: #9d9d9c;
            margin: 0 0 0 auto;
        }

        .submit-button:hover {
            background-color: black;
            color: white;
            cursor: pointer;
        }

        .pwdchg {
            width: 50px;
            height: 50px;
            border: 0px;
            background: white;
            font-size: 14px;
            font-weight: 550;
            color: black;
            text-decoration: underline;
            cursor: pointer;
            float: right;
        }

        #submit {
            display: flex;
            justify-content: flex-end;
        }

        #pwd-chg-ok {
            width: 100px;
            height: 50px;
            border: 1px solid black;
            border-radius: 25px;
            background: black;
            font-size: 17px;
            font-weight: 600;
            color: white;
            cursor: pointer;
            float: right;
        }

        #pwd-chg-x {
            width: 100px;
            height: 50px;
            border: 1px solid black;
            border-radius: 25px;
            background: white;
            font-size: 17px;
            font-weight: 600;
            color: black;
            cursor: pointer;
            float: right;
        }

        .overlay1 {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 100;
        }

        .overlay2 {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 100;
        }

        .overlay-dialog {
            position: absolute;
            top: 50%;
            left: 50%;
            width: 50%;
            transform: translate(-50%, -50%);
            background-color: #fff;
            padding: 20px;
            border-radius: 25px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
            z-index: 101;
        }

        .overlay-title {
            font-size: 24px;
            font-weight: bold;
            margin-top: 0;
        }

        .overlay-message-1 {
            margin-top: 10px;
            margin-bottom: 10px;
            font-size: 22px;
            font-weight: 545;
        }

        .overlay-message-2 {
            margin-top: 10px;
            margin-bottom: 10px;
            font-size: 17px;
        }

        #outcancle {
            background: black;
            color: white;
            border-radius: 30px;
            width: 75px;
            height: 50px;
            cursor: pointer;
        }

        #outok {
            background: white;
            color: black;
            border: 1px solid #cccccc;
            border-radius: 30px;
            width: 100px;
            height: 50px;
            cursor: pointer;
        }

    </style>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script>
        $(document).ready(function () {
            $(".overlay1, .overlay2").hide();

            $("#pwdchg").click(function () {
                $('.overlay1').show();

            }),
                $('.delete-button').click(function () {
                    $('.overlay2').show();
                }),
                $('#outcancle').click(function () {
                    $('.overlay2').hide();
                });
        });


        window.addEventListener("DOMContentLoaded", function () {
            const passwordDiv = document.querySelector("div.pwd");
            const password = passwordDiv.textContent.trim();
            passwordDiv.textContent = password.replace(/./g, "*").substring(0, 8);

        });

        $(document).ready(function () {
            $('#agree-checkbox').click(function () {
                if ($(this).prop('checked')) {
                    $('#outok').prop('disabled', false),
                        $('#outok').css("background", "black"),
                        $('#outok').css("color", "white");

                } else {
                    $('#outok').prop('disabled', true),
                        $('#outok').css("background", "white"),
                        $('#outok').css("color", "black");
                }
            });
        });

        function enableSubmitButton() {
            const inputs = document.querySelectorAll('input[type="text"]');
            const submitButton = document.querySelector('.submit-button');

            for (let i = 0; i < inputs.length; i++) {
                if (!inputs[i].value) {
                    submitButton.disabled = false;
                    return;
                }
            }

            submitButton.disabled = true;
        }


        function pwd_check() {
            const newPassword = document.querySelector('input[name="newpwd"]').value;
            const newPasswordConfirm = document.querySelector('input[name="newpwd-ok"]').value;

            if (document.userpwd["newpwd"].value == document.userpwd["newpwd-ok"].value) {
                document.getElementById("pmsg").innerText = "비밀번호 확인";
                document.getElementById("pmsg").style.color = "blue";
            } else {
                document.getElementById("pmsg").innerText = "비밀번호가 일치하지 않습니다.";
                document.getElementById("pmsg").style.color = "red";
            }

            if (newPassword && newPasswordConfirm) {
                document.getElementById("pwd-chg-ok").disabled = false;
            } else {
                document.getElementById("pwd-chg-ok").disabled = true;
            }
        }
    </script>
</head>
<body>
<div id="address-change">
    <form class="form" method="post" action="/users/userup">
        <h2 class="headline-1"> 계정 설정 </h2>
        <div class="input-container">
            <label for="email" class="input-label">
                이메일 *
            </label>
            <c:if test="${uvo1.email.equals('null')}">
                <input class="input" type="text" name="naveremail" value="${uvo1.naveremail}"/>
            </c:if>
            <c:if test="${!uvo1.email.equals('null')}">
                <input class="input" type="text" name="email" value="${uvo1.email}"/>
            </c:if>
        </div>
        <c:if test="${uvo1.naveremail.equals('null')}">
            <div>
                <h3 class="headline-2"> 비밀번호 <input class="pwdchg" type="button" id="pwdchg" value="수정"></h3>

                <div class="pwd"> ${uvo1.pwd} </div>
            </div>
        </c:if>
        <div>
            <h3 class="headline-3"> 생년월일 </h3>
            <div> ${uvo1.birthdate} </div>
        </div>
        <div class="input-container">
            <label for="address" class="input-label">
                주소 *
            </label>
            <input class="input" type="text" name="address" value="${lvo.address}" onkeyup="enableSubmitButton()"/>
        </div>
        <div class="input-container">
            <label for="extra_address" class="input-label">
                상세주소 *
            </label>
            <input class="input" type="text" name="extra_address" value="${lvo.extra_address}"
                   onkeyup="enableSubmitButton()"/>
        </div>
        <div class="input-container">
            <label for="zip" class="input-label">
                우편번호 *
            </label>
            <input class="input" type="text" name="zip" value="${lvo.zip}" onkeyup="enableSubmitButton()"/>
        </div>
        <div class="delete-account-container">
            <span>계정 삭제</span>
            <input type="button" class="delete-button" value="삭제">
        </div>
        <div>
            <input type="submit" class="submit-button" value="저장" disabled>
        </div>
    </form>

    <div class="overlay1">
        <div class="overlay-dialog">
            <form class="form2" name="userpwd" method="post" action="pwdchg">
                <h2 class="headline-1"> 비밀번호 변경 </h2>
                <div class="input-container">
                    <label for="pwd" class="input-label">
                        현재 비밀번호*
                    </label>
                    <input class="input" name="currentpwd" type="password" placeholder="현재 비밀번호*"/>
                </div>
                <div class="input-container">
                    <label for="newpwd" class="input-label">
                        새 비밀번호*
                    </label>
                    <input class="input" name="newpwd" type="password" placeholder="새 비밀번호*" onkeyup="pwd_check()"/>
                </div>
                <div class="input-container">
                    <label for="newpwd-ok" class="input-label">
                        새 비밀번호 확인*
                    </label>
                    <input class="input" name="newpwd-ok" type="password" placeholder="새 비밀번호 확인*"
                           onkeyup="pwd_check()"/>
                </div>
                <br>
                <span id="pmsg" style="font-size:12px;"></span>
                <div id="submit">
                    <input id="pwd-chg-ok" type="submit" value="저장 " disabled>
                    <input id="pwd-chg-x" type="submit" value="취소">
                </div>
            </form>
        </div>
    </div>

    <form method="post" action="/users/delete">
        <input type="hidden" name="userid" value="${uvo1.id}">
        <div class="overlay2">
            <div class="overlay-dialog">
                <div>
                    <h2 class="overlay-title">계정을 삭제하시겠습니까?</h2>
                    <p class="overlay-message-1"> 계정 삭제 시 : </p>
                    <ul>
                        <li>더 이상 라이스 멤버 프로필에 액세스할 수 없습니다.</li>
                        <li>주문 관련 정보는 고객센터에 문의해 주시기 바랍니다.</li>
                        <li>요청을 제출하시면 계정을 삭제합니다.</li>
                    </ul>
                    <p class="overlay-message-2"> SNS나 라이스닷컴 이외의 플랫폼에 공유된 정보는 영향을 받지 않습니다. </p>
                </div>
                <div>
                    <div><input type="checkbox" id="agree-checkbox"> 예, 라이스 계정을 삭제하겠습니다. 이 작업을 취소할 수 없습니다.</div>
                    <br>
                    <div id="submit">
                        <input id="outok" type="submit" value="계정삭제" disabled>
                        <input id="outcancle" type="button" value="취소">
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
</body>
</html>

