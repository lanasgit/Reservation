<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Futsal</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<script type="text/javascript">
			window.onload = function(){
				document.getElementById('no').onclick = function(){
					alert('미구현');
				}
			}
		</script>
	</head>
	<body>
		<!-- Header -->
			<header id="header">
				<div class="inner">
					<a href="index.jsp" class="logo">Futsal</a>
					<nav id="nav">
						<a href="index.jsp">Home</a>
						<a href="list.do">문의 게시판</a>
						<a href="#" id="no">로그인</a>
					</nav>
					<a href="#navPanel" class="navPanelToggle"><span class="fa fa-bars"></span></a>
				</div>
			</header>

		<!-- Banner -->
			<section id="banner">
			</section>

		<!-- One -->
			<section id="one" class="wrapper">
				<div class="inner">
					<div class="flex flex-3">
						<article>
							<header>
								<h3>주간(07:00 ~ 18:00)<br /> 야간(18:00 ~ 24:00)</h3>
							</header>
							<p> [2시간 기준] 주간 80,000원 / 야간 100,000원</p>
							<footer>
								<a href="#" class="button special">예약(구현 예정)</a>
							</footer>
						</article>
						<article>
							<header>
								<h3>OO구장 오픈 예정<br /> 21.11.12</h3>
							</header>
							<p>OO구장이 21.11.12 오픈 예정입니다. 자세한 내용은 확인 부탁드립니다.</p>
							<footer>
								<a href="#" class="button special">더 보기(미구현)</a>
							</footer>
						</article>
						<article>
							<header>
								<h3>이용 후기를 남겨주세요!<br /> 매월 추첨 이벤트^^</h3>
							</header>
							<p>이용 후기를 남겨주시면 매월 3팀을 추첨하여 2시간 무료 이용권을 드리고 있습니다. 많은 참여 부탁드립니다.</p>
							<footer>
								<a href="#" class="button special">참여(미구현)</a>
							</footer>
						</article>
					</div>
				</div>
			</section>

		<!-- Two -->
			<section id="two" class="wrapper style1 special">
				<div class="inner">
					<header>
						<h2>구장 소개</h2>
					</header>
					<div class="flex flex-4">
						<div class="box person">
							<div class="image round">
								<img src="images/pic01.jpg" alt="Place 1" />
							</div>
							<h3>송파구장(본점)</h3>
							<p>02-123-1111</p>
						</div>
						<div class="box person">
							<div class="image round">
								<img src="images/pic02.jpg" alt="Place 2" />
							</div>
							<h3>OO구장</h3>
							<p>02-123-4567</p>
						</div>
						<div class="box person">
							<div class="image round">
								<img src="images/pic03.jpg" alt="Place 3" />
							</div>
							<h3>OO구장</h3>
							<p>02-123-1234</p>
						</div>
						<div class="box person">
							<div class="image round">
								<img src="images/pic04.jpg" alt="Place 4" />
							</div>
							<h3>OO구장</h3>
							<p>031-123-1234</p>
						</div>
					</div>
				</div>
			</section>
	</body>
</html>