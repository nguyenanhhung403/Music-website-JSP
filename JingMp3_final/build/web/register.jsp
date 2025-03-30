<%-- 
    Document   : Register
    Created on : Oct 22, 2024, 10:22:06 PM
    Author     : nguye
--%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>   
    <title>Register</title>
    <style>
        .input-field {
            background-color: #333;
            color: #FFF;
            border: 1px solid #555;
            transition: all 0.3s ease;
        }
        .input-field:focus {
            border-color: #07A1C7;
            box-shadow: 0px 0px 8px rgba(7, 161, 199, 0.5);
        }
        .submit-button {
            background-color: #07A1C7;
            transition: background-color 0.3s ease;
        }
        .submit-button:hover {
            background-color: #0594b4;
        }
        .alert {
            padding: 10px;
            color: white;
            text-align: center;
            border-radius: 5px;
            margin-top: 15px;
        }
        .alert-success {
            color: #4CAF50;
        }
        .alert-error {
            color: #F44336;
        }
    </style>
</head>
<body class="bg-[#292929]">
    <div class="container mx-auto">
        <div class="flex items-start">
            <div class="w-[280px]">
                <%@include file="partials/sider.jsp"%>
            </div>
            <div class="ml-[20px] flex-1">
                <%@include file="partials/search.jsp"%> 
                
                <div class="mt-[60px] mx-auto w-[500px] bg-[#1F1F1F] p-[30px] rounded-lg shadow-lg">
                    <div class="text-[24px] font-[700] text-[#EFEEE0] mb-[20px] text-center">Đăng Ký Tài Khoản</div>

                    <!-- Success and Error Messages -->
                    

                    <!-- Registration Form -->
                    <form method="POST" action="register" onsubmit="return validatePasswords()">
                        <div class="mb-[15px]">
                            <label class="block mb-[5px] font-[600] text-[14px] text-[#EFEEE0]" for="username">
                                Tên đăng nhập <span class="text-red-500 ml-[5px]">*</span>
                            </label>
                            <input
                                type="text"
                                id="username"
                                name="username"
                                placeholder="Ví dụ: levana"
                                class="input-field h-[50px] w-full px-[16px] rounded-[6px] font-[600] text-[14px] outline-none"
                                required
                            />
                        </div>
                        
                        <div class="mb-[15px]">
                            <label class="block mb-[5px] font-[600] text-[14px] text-[#EFEEE0]" for="email">
                                Email <span class="text-red-500 ml-[5px]">*</span>
                            </label>
                            <input
                                type="email"
                                id="email"
                                name="email"
                                placeholder="Ví dụ: levana@gmail.com"
                                class="input-field h-[50px] w-full px-[16px] rounded-[6px] font-[600] text-[14px] outline-none"
                                required
                            />
                        </div>
                        
                        <div class="mb-[15px]">
                            <label class="block mb-[5px] font-[600] text-[14px] text-[#EFEEE0]" for="password">
                                Mật khẩu <span class="text-red-500 ml-[5px]">*</span>
                            </label>
                            <input
                                type="password"
                                id="password"
                                name="password"
                                class="input-field h-[50px] w-full px-[16px] rounded-[6px] font-[600] text-[14px] outline-none"
                                required
                            />
                        </div>
                        
                        <div class="mb-[15px]">
                            <label class="block mb-[5px] font-[600] text-[14px] text-[#EFEEE0]" for="confirm_password">
                                Xác nhận mật khẩu <span class="text-red-500 ml-[5px]">*</span>
                            </label>
                            <input
                                type="password"
                                id="confirm_password"
                                name="confirm_password"
                                class="input-field h-[50px] w-full px-[16px] rounded-[6px] font-[600] text-[14px] outline-none"
                                required
                            />
                        </div>

                        <button type="submit" class="submit-button h-[50px] w-full rounded-[6px] font-[700] text-[16px] text-white mt-4">
                            Đăng Ký
                        </button>
                    </form>

                    <!-- Error message if passwords don't match -->
                    <div id="passwordMismatchMessage" class="alert alert-error mt-4" style="display: none;">
                        Mật khẩu xác nhận không khớp.
                    </div>

                    <p class="mt-5 text-center text-[#9FCADB]">
                        Bạn đã có tài khoản? <a href="login.jsp" class="text-[#07A1C7] italic hover:underline">Đăng nhập tại đây</a>
                    </p>
                    <c:if test="${not empty successMessage}">
                        <div class="alert alert-success">
                            ${successMessage}
                        </div>
                    </c:if>
                    <c:if test="${not empty errorMessage}">
                        <div class="alert alert-error">
                            ${errorMessage}
                        </div>
                    </c:if>  
                </div>
            </div>
        </div>         
    </div>


</body> 
</html>
