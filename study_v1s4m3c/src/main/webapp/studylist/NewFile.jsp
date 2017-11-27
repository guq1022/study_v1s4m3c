<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
  
<title></title>
<link href="../css/style.css" rel='Stylesheet' type='text/css'>
</head>
<body>
<DIV class='container'>
<DIV class='content'>

  부트스트랩 test
  <div class="row">
    <div class="col-sm-3"> 분야  안녕하세요</div>
    <div class="col-sm-5"> 안녕하세요</div>
    <div class="col-sm-2"> 2017.11.15</div>
    <div class="col-sm-2"> 15</div>
  </div>
  
  <p>분야  제목  </p>
  <ul class="list-inline">
    <li class="list-inline-item">Coffee</li>
    <li class="list-inline-item">Tea</li>
    <li class="list-inline-item">Milk</li>
  </ul>
  
    <div class="container-fluid">
    <div class="row">
      <div class="col-8 bg-warning">
        <div class="row">
          <div class="col-3 bg-light">.col-6</div>
          <div class="col-9 bg-secondary">.col-6</div>
        </div>
        <div class="row">
          <div class="col-3 bg-light">.col-6</div>
          <div class="col-2 bg-secondary">.col-6</div>
          <div class="col-2 bg-secondary">.col-6</div>
          <div class="col-2 bg-secondary">.col-6</div>
          <div class="col-1 bg-secondary">.col-6</div>
          <div class="col-1 bg-secondary">.col-6</div>
        </div>
      </div>
    
        <div class="row">
          <div class="col-4 bg-light">.col-6</div>
          <div class="col-4 bg-secondary">.col-6</div>
          <div class="col-4 bg-secondary">.col-6</div>
        </div>
     
   </div>
  </div>
  
  <br><br>
  
  <div class="container-fluid">
  <div class="row">
    <div class="col-8 bg-warning">
       [ ${StudyListVO.stdlist_topic} ]  ${StudyListVO.stdlist_title} 
      <div class="row">
        <div class="col-3 bg-light"> ${StudyListVO.stdlist_area}</div>
        <div class="col-3 bg-secondary"> ${StudyListVO.stdlist_dow}</div>
        <div class="col-3 bg-secondary">${StudyListVO.stdlist_time} </div>
        <div class="col-3 bg-secondary">[ ${StudyListVO.stdlist_tot_num} ] [ ${StudyListVO.stdlist_curr_num} ]  </div>
      </div>
    </div>
      <div class="col-4 bg-success">.col-4
        <div class="row">
          <div class="col-6 bg-light">.col-6</div>
          <div class="col-6 bg-secondary">[ ${StudyListVO.stdlist_cnt} ] </div>
        </div>
      </div>
  </div>
</div>

<br><br>

<table class="table">
    <thead>
      <tr>
        <th>Firstname</th>
        <th>Lastname</th>
        <th>Email</th>
        <th>Email</th>
        <th>Email</th>
        <th>Email</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>Default</td>
        <td>Defaultson</td>
        <td>def@somemail.com</td>
        <td>def@somemail.com</td>
        <td>def@somemail.com</td>
        <td>def@somemail.com</td>
      </tr>      
    </tbody>
 </table>
  
</DIV> <!-- content END -->
</DIV> <!-- container END -->
 
</body>
</html>