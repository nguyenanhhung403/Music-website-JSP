<%-- 
    Document   : search
    Created on : Oct 27, 2024, 10:50:31 AM
    Author     : nguye
--%>

<%-- 
    Document   : search
    Created on : Oct 23, 2024, 9:48:35 PM
    Author     : Admin
--%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <title>Jing mp3 - Search</title>
</head>
<body>
    <form action="search" method="get" class="bg-[#212121] rounded-full mt-5 sticky top-5 left-5 z-50 py-4 px-8 flex items-center">
        <button type="submit" class="text-2xl text-white mr-4">
            <i class="fas fa-magnifying-glass"></i>
        </button>
        <input
            type="text"
            name="query"
            placeholder="Tìm kiếm bài hát, ca sĩ..."
            class="text-lg font-semibold text-white bg-transparent outline-none flex-1"
        />
    </form>
</body>
</html>
