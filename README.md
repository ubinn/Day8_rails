## Day8_180618

https://www.slideshare.net/JunghyunPark39/ruby-on-rails-view-helper-top4 뷰헬퍼

1. model 생성

   `rails g model coard contents ip_address`	: default 는 string

   `rails d model board` : 삭제 시 ~> g의 반대

   `rails g model board contents:text` 라고 타입 지정해주면 그렇게 db가 만들어져욤

   `rails g model board contents:text index:integer` :뒤에 type명시하면 해당 type에 맞는 col생성

2. controller 생성

   `rails g controller tweet index show new create` : 뒤에 액션명까지 쓰면 해당 액션에 맞는 view까지 완성되고 route에도 생성된다.

3. routes.rb

```ruby
root 'tweet#index'

get '/tweets' =>'tweet#index'
get '/tweet/:id' => 'tweet#show'
get '/tweet/new' => 'tweet#new'
post '/tweet/create' => 'tweet#create'
get '/tweet/:id/edit' =>'tweet#edit'
post '/tweet/:id/update' => 'tweet#update'
get '/tweet/:id/destroy' => 'tweet#destroy'
```

`$ rake routes` : routes에 정상적으로 등록되어있는지 확인가능.

1. new.html.erb

   http://guides.rubyonrails.org/form_helpers.html

```html
    <%= form_tag('/tweet/create') do%>
    <% end %>
        == 
<form action="/tweet/create" method="POST">
<input type="hidden" name="authenticity_token" value="<%=form_authenticity_token%>">
  
```

- form helper

웹 애플리케이션에서의 폼(Form)은 유저 입력을 받기 위해서는 필수인 인터페이스입니다. 하지만 폼의 각 요소들의 명명법과 수많은 속성들 탓에 폼의 마크업은 쉽게 복잡해지고, 관리하기 어려워집니다. 그래서 Rails에서는 폼 마크업을 생성하기 위한 **뷰 헬퍼를 제공**하고, 이런 번잡한 작업을 할 필요를 없앴습니다. 하지만 현실에서의 사용 예제는 무척 다양하기 때문에, 개발자는 이것들을 실제로 사용하기 전에 헬퍼 메서드 간에 어떤 차이가 있는지 파악해야할 필요가 있습니다. 

-  <%= text_area_tag :contents, nil, class: "form-control", placeholder:"내용을 입력하세요."%>
- <%= submit_tag "등록", class: "btn btn-primary" %>





- view helper
  - <a> 대신 <%= link_to '텍스트' , 'URL' class:"" %>

![](https://image.slidesharecdn.com/top4-171106073909/95/ruby-on-rails-view-helper-top4-6-638.jpg?cb=1509954283)



- flash 

https://agilewarrior.wordpress.com/2014/04/26/how-to-add-a-flash-message-to-your-rails-page/



- cookie

  결국 서버는 현재 로그인한 유저가 누군지 몰라

  브라우저가 쿠키정보로 로그인 정보를 들고있다가 요청을 할때 이 쿠키정보를 보내주는거래.

  HTTP 쿠키(웹 쿠키, 브라우저 쿠키)는 서버가 사용자의 웹 브라우저에 전송하는 작은 데이터 조각입니다. 브라우저는 그 데이터 조각들을 저장할 수 있고 동일한 서버로 다음 요청 시 함께 전송할 것입니다.   쿠키는 상태가 없는([stateless](https://developer.mozilla.org/en-US/docs/Web/HTTP/Overview#HTTP_is_stateless_but_not_sessionless)) HTTP 프로토콜에서 상태 기반 정보를 기억합니다. 

  쿠키는 주로 세 가지 목적을 위해 사용됩니다:

  - 세션 관리(Session management)

    Logins, shopping carts, game scores, or anything else the server should remember

  - 개인화(Personalization)

    User preferences, themes, and other settings

  - 트래킹(Tracking)

    Recording and analyzing user behavior

  (예) google analytics

  https://www.inflearn.com/

  https://www.udacity.com/courses/school-of-data-science

- toastr

  https://github.com/d4be4st/toastr_rails

  gem file 에 저장해서 application.js 랑 application.scss 고치고, 

  ```ruby
  <% flash.each do |k,v| %>
      <!-- <div class="alert alert-<%= k %>"><%= v %></div> -->
         <script>
            toastr.<%= k %>("<%= v %>");
         </script>
  <% end %>
  ```

  <div class="alert alert-<%= k %>"><%= v %></div> 기존의 이 코드를 반짝이는 toastr 코드로 고친거.

  