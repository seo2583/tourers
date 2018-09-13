<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>여행가이드</title>
    <link rel="stylesheet" href="/tourers/css/style.css" />
    <link rel="stylesheet" href="/tourers/css/member.css" />
    <link rel="stylesheet" href="/tourers/css/aside.css" />
    <link rel="stylesheet" href="/tourers/css/nation.css" />
    <link rel="stylesheet" href="/tourers/css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<script src="//code.jquery.com/jquery.min.js"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
    <script src="/tourers/js/dropdown.js"></script>
    <script src="/tourers/js/autocomplete.js"></script>
    <script src="/tourers/js/search.js"></script>
  </head>
  <body>
  <div id="wrapper">
    <header>
        <div class="container">
          <a href="/tourers/" class="logo"><img src="/tourers/img/logo1.jpg" /></a>
          <form action="#" class="search">
            <input type="text" id="auto" name="search" placeholder="여행지 검색"/>
            <button type="submit"><i class="fa fa-search"></i></button>
          </form>
          <div class="menu">
            <ul class="menu_bar">
              <li><a href="#" class="drop">Asia</a>
                <ul>
                  <li><a href="#">East</a>
                    <ul>
                      <li><a href="/tourers/nation/nationInfo.do?nationName=대한민국">대한민국</a></li>
                      <li><a href="/tourers/nation/nationInfo.do?nationName=대만">대만</a></li>
                      <li><a href="/tourers/nation/nationInfo.do?nationName=일본">일본</a></li>
                      <li><a href="/tourers/nation/nationInfo.do?nationName=중국">중국</a></li>
                    </ul>
                  </li>
                  <li><a href="#">South-East</a>
                  	<ul>
                      <li><a href="/tourers/nation/nationInfo.do?nationName=라오스">라오스</a></li>	
                      <li><a href="/tourers/nation/nationInfo.do?nationName=베트남">베트남</a></li>
                      <li><a href="/tourers/nation/nationInfo.do?nationName=싱가포르">싱가포르</a></li>
                      <li><a href="/tourers/nation/nationInfo.do?nationName=태국">태국</a></li>
                      <li><a href="/tourers/nation/nationInfo.do?nationName=필리핀">필리핀</a></li>
                    </ul>
                  </li>
                  <li><a href="#">South</a>
                  	<ul>
                      <li><a href="/tourers/nation/nationInfo.do?nationName=인도">인도</a></li>	
                    </ul>
                  </li>
                  <li><a href="#">West</a>
                  	<ul>
                      <li><a href="/tourers/nation/nationInfo.do?nationName=터키">터키</a></li>	
                      <li><a href="/tourers/nation/nationInfo.do?nationName=카타르">카타르</a></li>	
                    </ul>
                  </li>
                  <li><a href="#">Central</a></li>
                </ul>
              </li>
              <li><a href="#" class="drop">Europe</a>
                <ul>
                  <li><a href="#">East</a>
                  	<ul>
                      <li><a href="/tourers/nation/nationInfo.do?nationName=러시아">러시아</a></li>
                      <li><a href="/tourers/nation/nationInfo.do?nationName=헝가리">헝가리</a></li>	
                    </ul>
                  </li>
                  <li><a href="#">South</a>
                    <ul>
                      <li><a href="/tourers/nation/nationInfo.do?nationName=스페인">스페인</a></li>	
                      <li><a href="/tourers/nation/nationInfo.do?nationName=이탈리아">이탈리아</a></li>	
                    </ul>
                  </li>
                  <li><a href="#">West</a>
                    <ul>
                      <li><a href="/tourers/nation/nationInfo.do?nationName=영국">영국</a></li>	
                      <li><a href="/tourers/nation/nationInfo.do?nationName=프랑스">프랑스</a></li>
                    </ul>
                  </li>
                  <li><a href="#">North</a></li>
                  <li><a href="#">Central</a>
                  	<ul>
                      <li><a href="/tourers/nation/nationInfo.do?nationName=독일">독일</a></li>	
                      <li><a href="/tourers/nation/nationInfo.do?nationName=스위스">스위스</a></li>	
                    </ul>
                  </li>
                </ul>
              </li>
              <li><a href="#" class="drop">America</a>
                <ul>
                  <li><a href="#">North</a>
                    <ul>
                      <li><a href="/tourers/nation/nationInfo.do?nationName=멕시코">멕시코</a></li>
                      <li><a href="/tourers/nation/nationInfo.do?nationName=미국">미국</a></li>
                      <li><a href="/tourers/nation/nationInfo.do?nationName=캐나다">캐나다</a></li>
                    </ul>
                  </li>
                  <li><a href="#">South</a>
                    <ul>
                 	  <li><a href="/tourers/nation/nationInfo.do?nationName=볼리비아">볼리비아</a></li>
                      <li><a href="/tourers/nation/nationInfo.do?nationName=브라질">브라질</a></li>
                      <li><a href="/tourers/nation/nationInfo.do?nationName=아르헨티나">아르헨티나</a></li>
                      <li><a href="/tourers/nation/nationInfo.do?nationName=페루">페루</a></li>
                    </ul>
                  </li>
                  <li><a href="#">Central</a></li>
                </ul>
              </li>
              <li><a href="#" class="drop">Africa</a>
                <ul>
                  <li><a href="#">East</a>
                  	<ul>
                      <li><a href="/tourers/nation/nationInfo.do?nationName=케냐">케냐</a></li>
                      <li><a href="/tourers/nation/nationInfo.do?nationName=탄자니아">탄자니아</a></li>
                    </ul>
                  </li>
                  <li><a href="#">South</a>
                  	<ul>
                      <li><a href="/tourers/nation/nationInfo.do?nationName=남아프리카공화국">남아프리카공화국</a></li>
                    </ul>
                  </li>
                  <li><a href="#">West</a></li>
                  <li><a href="#">North</a>
                  	<ul>
                      <li><a href="/tourers/nation/nationInfo.do?nationName=모로코">모로코</a></li>
                      <li><a href="/tourers/nation/nationInfo.do?nationName=이집트">이집트</a></li>
                    </ul>
                  </li>
                  <li><a href="#">Central</a></li>
                </ul>
              </li>
              <li><a href="#" class="drop">Oceania</a>
                <ul>
                  <li><a href="/tourers/nation/nationInfo.do?nationName=호주">호주</a></li>
                  <li><a href="/tourers/nation/nationInfo.do?nationName=뉴질랜드">뉴질랜드</a></li>
                  <li><a href="#">기타</a>
                    <ul>
                      <li><a href="/tourers/nation/nationInfo.do?nationName=미크로네시아">미크로네시아</a></li>
                      <li><a href="/tourers/nation/nationInfo.do?nationName=피지">피지</a></li>
                    </ul>
                  </li>
                </ul>
              </li>
              <li>
             	<a href="#"><i class="fa fa-users fa-lg"></i></a>
              	<ul>
                  <li><a href="/tourers/board/commu.do?cat=info&pg=1">정보 공유</a></li>
                  <li><a href="/tourers/board/commu.do?cat=pic&pg=1">사진 공유</a></li>
                  <li><a href="/tourers/board/commu.do?cat=together&pg=1">여행 동행</a></li>
                  <li><a href="/tourers/board/commu.do?cat=freetalk&pg=1">자유게시판</a></li>
                  <li><a href="/tourers/board/commu.do?cat=qna&pg=1">Q & A</a></li>
                </ul>
              </li>
              <li>
                <a href="#"><i class="fa fa-user fa-lg"></i></a>
                <c:if test="${ empty user }">
                <ul>
                  <li><a href="/tourers/member/login.do">로그인</a></li>
                  <li><a href="/tourers/member/terms.do">회원가입</a></li>
                </ul>
                </c:if>
                <c:if test="${ !empty user }">
                <ul>
                  <li><a href="/tourers/member/logout.do">로그아웃</a></li>
                  <li><a href="#">회원정보 변경</a></li>
                  <li><a href="#">나의 여행</a></li>
                </ul>
                </c:if>
              </li>
            </ul>
          </div>
        </div>
    </header>
