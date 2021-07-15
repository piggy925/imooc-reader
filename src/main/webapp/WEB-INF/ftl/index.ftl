<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>慕课书评网</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1.0,user-scalable=no">
    <link rel="stylesheet" href="./resources/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="./resources/raty/lib/jquery.raty.css">
    <script src="./resources/jquery.3.3.1.min.js"></script>
    <script src="./resources/bootstrap/bootstrap.min.js"></script>
    <script src="./resources/art-template.js"></script>

    <style>
        .highlight {
            color: red !important;
        }

        a:active {
            text-decoration: none !important;
        }
    </style>


    <style>
        .container {
            padding: 0px;
            margin: 0px;
        }

        .row {
            padding: 0px;
            margin: 0px;
        }

        .col- * {
            padding: 0px;
        }
    </style>

</head>
<body>
<div class="container">
    <nav class="navbar navbar-light bg-white shadow mr-auto">
        <ul class="nav">
            <li class="nav-item">
                <a href="/">
                    <img src="https://m.imooc.com/static/wap/static/common/img/logo2.png" class="mt-1"
                         style="width: 100px">
                </a>
            </li>

        </ul>
        <a href="/login.html" class="btn btn-light btn-sm">
            <img style="width: 2rem;margin-top: -5px" class="mr-1" src="./images/user_icon.png">登录
        </a>
    </nav>
    <div class="row mt-2">


        <div class="col-8 mt-2">
            <h4>热评好书推荐</h4>
        </div>

        <div class="col-8 mt-2">
            <span data-category="-1" style="cursor: pointer" class="highlight  font-weight-bold category">全部</span>
            |
            <#list categoryList as category>
                <a style="cursor: pointer" data-category="${category.categoryId}"
                   class="text-black-50 font-weight-bold category">${category.categoryName}</a>
                <#if category_has_next>
                    |
                </#if>
            </#list>

        </div>

        <div class="col-8 mt-2">
            <span data-order="quantity" style="cursor: pointer"
                  class="order highlight  font-weight-bold mr-3">按热度</span>

            <span data-order="score" style="cursor: pointer"
                  class="order text-black-50 mr-3 font-weight-bold">按评分</span>
        </div>
    </div>
    <div class="d-none">
        <input type="hidden" id="nextPage" value="2">
        <input type="hidden" id="categoryId" value="-1">
        <input type="hidden" id="order" value="quantity">
    </div>

    <div id="bookList">

        <a href="/book/5" style="color: inherit">
            <div class="row mt-2 book">
                <div class="col-4 mb-2 pr-2">
                    <img class="img-fluid" src="https://img4.mukewang.com/5ce256ea00014bc903600480.jpg">
                </div>
                <div class="col-8  mb-2 pl-0">
                    <h5 class="text-truncate">从 0 开始学爬虫</h5>

                    <div class="mb-2 bg-light small  p-2 w-100 text-truncate">梁睿坤 · 19年资深架构师</div>


                    <div class="mb-2 w-100">零基础开始到大规模爬虫实战</div>

                    <p>
                        <span class="stars" data-score="4.9" title="gorgeous"><img alt="1"
                                                                                   src="./resources/raty/lib/images/star-on.png"
                                                                                   title="gorgeous">&nbsp;<img alt="2"
                                                                                                               src="./resources/raty/lib/images/star-on.png"
                                                                                                               title="gorgeous">&nbsp;<img
                                    alt="3" src="./resources/raty/lib/images/star-on.png" title="gorgeous">&nbsp;<img
                                    alt="4" src="./resources/raty/lib/images/star-on.png" title="gorgeous">&nbsp;<img
                                    alt="5" src="./resources/raty/lib/images/star-on.png" title="gorgeous"><input
                                    name="score" type="hidden" value="4.9" readonly=""></span>
                        <span class="mt-2 ml-2">4.9</span>
                        <span class="mt-2 ml-2">15人已评</span>
                    </p>
                </div>
            </div>
        </a>

        <hr>

        <a href="/book/25" style="color: inherit">
            <div class="row mt-2 book">
                <div class="col-4 mb-2 pr-2">
                    <img class="img-fluid" src="https://img1.mukewang.com/5da923d60001a92f05400720.jpg">
                </div>
                <div class="col-8  mb-2 pl-0">
                    <h5 class="text-truncate">网络协议那些事儿</h5>

                    <div class="mb-2 bg-light small  p-2 w-100 text-truncate">Oscar · 一线大厂高级软件工程师</div>


                    <div class="mb-2 w-100">前后端通用系列课</div>

                    <p>
                        <span class="stars" data-score="4.9" title="gorgeous"><img alt="1"
                                                                                   src="./resources/raty/lib/images/star-on.png"
                                                                                   title="gorgeous">&nbsp;<img alt="2"
                                                                                                               src="./resources/raty/lib/images/star-on.png"
                                                                                                               title="gorgeous">&nbsp;<img
                                    alt="3" src="./resources/raty/lib/images/star-on.png" title="gorgeous">&nbsp;<img
                                    alt="4" src="./resources/raty/lib/images/star-on.png" title="gorgeous">&nbsp;<img
                                    alt="5" src="./resources/raty/lib/images/star-on.png" title="gorgeous"><input
                                    name="score" type="hidden" value="4.9" readonly=""></span>
                        <span class="mt-2 ml-2">4.9</span>
                        <span class="mt-2 ml-2">15人已评</span>
                    </p>
                </div>
            </div>
        </a>

        <hr>

        <a href="/book/32" style="color: inherit">
            <div class="row mt-2 book">
                <div class="col-4 mb-2 pr-2">
                    <img class="img-fluid" src="https://img.mukewang.com/5dff8f33000138fa05400720.jpg">
                </div>
                <div class="col-8  mb-2 pl-0">
                    <h5 class="text-truncate">给程序员的职场情商课</h5>

                    <div class="mb-2 bg-light small  p-2 w-100 text-truncate">风落几番 · 蚂蚁金服测试专家</div>


                    <div class="mb-2 w-100">懂技术，更要懂说话的艺术</div>

                    <p>
                        <span class="stars" data-score="4.7" title="gorgeous"><img alt="1"
                                                                                   src="./resources/raty/lib/images/star-on.png"
                                                                                   title="gorgeous">&nbsp;<img alt="2"
                                                                                                               src="./resources/raty/lib/images/star-on.png"
                                                                                                               title="gorgeous">&nbsp;<img
                                    alt="3" src="./resources/raty/lib/images/star-on.png" title="gorgeous">&nbsp;<img
                                    alt="4" src="./resources/raty/lib/images/star-on.png" title="gorgeous">&nbsp;<img
                                    alt="5" src="./resources/raty/lib/images/star-half.png" title="gorgeous"><input
                                    name="score" type="hidden" value="4.7" readonly=""></span>
                        <span class="mt-2 ml-2">4.7</span>
                        <span class="mt-2 ml-2">15人已评</span>
                    </p>
                </div>
            </div>
        </a>

        <hr>

        <a href="/book/1" style="color: inherit">
            <div class="row mt-2 book">
                <div class="col-4 mb-2 pr-2">
                    <img class="img-fluid" src="https://img2.mukewang.com/5c247b0b0001a0a903600480.jpg">
                </div>
                <div class="col-8  mb-2 pl-0">
                    <h5 class="text-truncate">教你用 Python 进阶量化交易</h5>

                    <div class="mb-2 bg-light small  p-2 w-100 text-truncate">袁霄 · 全栈工程师</div>


                    <div class="mb-2 w-100">你的量化交易开发第一课</div>

                    <p>
                        <span class="stars" data-score="4.9" title="gorgeous"><img alt="1"
                                                                                   src="./resources/raty/lib/images/star-on.png"
                                                                                   title="gorgeous">&nbsp;<img alt="2"
                                                                                                               src="./resources/raty/lib/images/star-on.png"
                                                                                                               title="gorgeous">&nbsp;<img
                                    alt="3" src="./resources/raty/lib/images/star-on.png" title="gorgeous">&nbsp;<img
                                    alt="4" src="./resources/raty/lib/images/star-on.png" title="gorgeous">&nbsp;<img
                                    alt="5" src="./resources/raty/lib/images/star-on.png" title="gorgeous"><input
                                    name="score" type="hidden" value="4.9" readonly=""></span>
                        <span class="mt-2 ml-2">4.9</span>
                        <span class="mt-2 ml-2">14人已评</span>
                    </p>
                </div>
            </div>
        </a>

        <hr>

        <a href="/book/7" style="color: inherit">
            <div class="row mt-2 book">
                <div class="col-4 mb-2 pr-2">
                    <img class="img-fluid" src="https://img2.mukewang.com/5cfdcd1e00015cf203600480.jpg">
                </div>
                <div class="col-8  mb-2 pl-0">
                    <h5 class="text-truncate">手把手带你打造自己的UI样式库</h5>

                    <div class="mb-2 bg-light small  p-2 w-100 text-truncate">Rosen · 一线互联网架构设计师</div>


                    <div class="mb-2 w-100">前端开发进阶必学</div>

                    <p>
                        <span class="stars" data-score="4.9" title="gorgeous"><img alt="1"
                                                                                   src="./resources/raty/lib/images/star-on.png"
                                                                                   title="gorgeous">&nbsp;<img alt="2"
                                                                                                               src="./resources/raty/lib/images/star-on.png"
                                                                                                               title="gorgeous">&nbsp;<img
                                    alt="3" src="./resources/raty/lib/images/star-on.png" title="gorgeous">&nbsp;<img
                                    alt="4" src="./resources/raty/lib/images/star-on.png" title="gorgeous">&nbsp;<img
                                    alt="5" src="./resources/raty/lib/images/star-on.png" title="gorgeous"><input
                                    name="score" type="hidden" value="4.9" readonly=""></span>
                        <span class="mt-2 ml-2">4.9</span>
                        <span class="mt-2 ml-2">14人已评</span>
                    </p>
                </div>
            </div>
        </a>

        <hr>

        <a href="/book/6" style="color: inherit">
            <div class="row mt-2 book">
                <div class="col-4 mb-2 pr-2">
                    <img class="img-fluid" src="https://img3.mukewang.com/5cf47cb800010dde03600480.jpg">
                </div>
                <div class="col-8  mb-2 pl-0">
                    <h5 class="text-truncate">零基础学透 TypeScript</h5>

                    <div class="mb-2 bg-light small  p-2 w-100 text-truncate">Lison · 前端高级工程师</div>


                    <div class="mb-2 w-100">关于TS的前世今生一篇打尽</div>

                    <p>
                        <span class="stars" data-score="4.6" title="gorgeous"><img alt="1"
                                                                                   src="./resources/raty/lib/images/star-on.png"
                                                                                   title="gorgeous">&nbsp;<img alt="2"
                                                                                                               src="./resources/raty/lib/images/star-on.png"
                                                                                                               title="gorgeous">&nbsp;<img
                                    alt="3" src="./resources/raty/lib/images/star-on.png" title="gorgeous">&nbsp;<img
                                    alt="4" src="./resources/raty/lib/images/star-on.png" title="gorgeous">&nbsp;<img
                                    alt="5" src="./resources/raty/lib/images/star-half.png" title="gorgeous"><input
                                    name="score" type="hidden" value="4.6" readonly=""></span>
                        <span class="mt-2 ml-2">4.6</span>
                        <span class="mt-2 ml-2">13人已评</span>
                    </p>
                </div>
            </div>
        </a>

        <hr>

        <a href="/book/31" style="color: inherit">
            <div class="row mt-2 book">
                <div class="col-4 mb-2 pr-2">
                    <img class="img-fluid" src="https://img4.mukewang.com/5df760170001512305400720.jpg">
                </div>
                <div class="col-8  mb-2 pl-0">
                    <h5 class="text-truncate">Python 数据分析通关攻略</h5>

                    <div class="mb-2 bg-light small  p-2 w-100 text-truncate">Lemeng_study · 8年经验资深数据挖掘专家</div>


                    <div class="mb-2 w-100">编程技术提升职场竞争力系列</div>

                    <p>
                        <span class="stars" data-score="4.8" title="gorgeous"><img alt="1"
                                                                                   src="./resources/raty/lib/images/star-on.png"
                                                                                   title="gorgeous">&nbsp;<img alt="2"
                                                                                                               src="./resources/raty/lib/images/star-on.png"
                                                                                                               title="gorgeous">&nbsp;<img
                                    alt="3" src="./resources/raty/lib/images/star-on.png" title="gorgeous">&nbsp;<img
                                    alt="4" src="./resources/raty/lib/images/star-on.png" title="gorgeous">&nbsp;<img
                                    alt="5" src="./resources/raty/lib/images/star-on.png" title="gorgeous"><input
                                    name="score" type="hidden" value="4.8" readonly=""></span>
                        <span class="mt-2 ml-2">4.8</span>
                        <span class="mt-2 ml-2">13人已评</span>
                    </p>
                </div>
            </div>
        </a>

        <hr>

        <a href="/book/34" style="color: inherit">
            <div class="row mt-2 book">
                <div class="col-4 mb-2 pr-2">
                    <img class="img-fluid" src="https://img3.mukewang.com/5e16e9730001d85605400720.jpg">
                </div>
                <div class="col-8  mb-2 pl-0">
                    <h5 class="text-truncate">智能时代：写给想学习大数据的你</h5>

                    <div class="mb-2 bg-light small  p-2 w-100 text-truncate">RangeYan · 一线互联网公司数据研发专家</div>


                    <div class="mb-2 w-100">驾驭未来工作的利器</div>

                    <p>
                        <span class="stars" data-score="4.7" title="gorgeous"><img alt="1"
                                                                                   src="./resources/raty/lib/images/star-on.png"
                                                                                   title="gorgeous">&nbsp;<img alt="2"
                                                                                                               src="./resources/raty/lib/images/star-on.png"
                                                                                                               title="gorgeous">&nbsp;<img
                                    alt="3" src="./resources/raty/lib/images/star-on.png" title="gorgeous">&nbsp;<img
                                    alt="4" src="./resources/raty/lib/images/star-on.png" title="gorgeous">&nbsp;<img
                                    alt="5" src="./resources/raty/lib/images/star-half.png" title="gorgeous"><input
                                    name="score" type="hidden" value="4.7" readonly=""></span>
                        <span class="mt-2 ml-2">4.7</span>
                        <span class="mt-2 ml-2">13人已评</span>
                    </p>
                </div>
            </div>
        </a>

        <hr>

        <a href="/book/33" style="color: inherit">
            <div class="row mt-2 book">
                <div class="col-4 mb-2 pr-2">
                    <img class="img-fluid" src="https://img1.mukewang.com/5e0deb5c0001282f05400720.jpg">
                </div>
                <div class="col-8  mb-2 pl-0">
                    <h5 class="text-truncate">分布式技术面试大厂真题30讲</h5>

                    <div class="mb-2 bg-light small  p-2 w-100 text-truncate">王炸 · 8年经验一线大厂架构师</div>


                    <div class="mb-2 w-100">让你在寒冬求职季脱颖而出</div>

                    <p>
                        <span class="stars" data-score="4.9" title="gorgeous"><img alt="1"
                                                                                   src="./resources/raty/lib/images/star-on.png"
                                                                                   title="gorgeous">&nbsp;<img alt="2"
                                                                                                               src="./resources/raty/lib/images/star-on.png"
                                                                                                               title="gorgeous">&nbsp;<img
                                    alt="3" src="./resources/raty/lib/images/star-on.png" title="gorgeous">&nbsp;<img
                                    alt="4" src="./resources/raty/lib/images/star-on.png" title="gorgeous">&nbsp;<img
                                    alt="5" src="./resources/raty/lib/images/star-on.png" title="gorgeous"><input
                                    name="score" type="hidden" value="4.9" readonly=""></span>
                        <span class="mt-2 ml-2">4.9</span>
                        <span class="mt-2 ml-2">12人已评</span>
                    </p>
                </div>
            </div>
        </a>

        <hr>

        <a href="/book/17" style="color: inherit">
            <div class="row mt-2 book">
                <div class="col-4 mb-2 pr-2">
                    <img class="img-fluid" src="https://img4.mukewang.com/5d5510fa00011fa605400720.jpg">
                </div>
                <div class="col-8  mb-2 pl-0">
                    <h5 class="text-truncate">你的第一本Python基础入门书</h5>

                    <div class="mb-2 bg-light small  p-2 w-100 text-truncate">黄浮云 · 资深云计算工程师</div>


                    <div class="mb-2 w-100">人人受益的Python开学第一课</div>

                    <p>
                        <span class="stars" data-score="4.7" title="gorgeous"><img alt="1"
                                                                                   src="./resources/raty/lib/images/star-on.png"
                                                                                   title="gorgeous">&nbsp;<img alt="2"
                                                                                                               src="./resources/raty/lib/images/star-on.png"
                                                                                                               title="gorgeous">&nbsp;<img
                                    alt="3" src="./resources/raty/lib/images/star-on.png" title="gorgeous">&nbsp;<img
                                    alt="4" src="./resources/raty/lib/images/star-on.png" title="gorgeous">&nbsp;<img
                                    alt="5" src="./resources/raty/lib/images/star-half.png" title="gorgeous"><input
                                    name="score" type="hidden" value="4.7" readonly=""></span>
                        <span class="mt-2 ml-2">4.7</span>
                        <span class="mt-2 ml-2">11人已评</span>
                    </p>
                </div>
            </div>
        </a>

        <hr>
    </div>
    <button type="button" id="btnMore" data-next-page="1" class="mb-5 btn btn-outline-primary btn-lg btn-block">
        点击加载更多...
    </button>
    <div id="divNoMore" class="text-center text-black-50 mb-5" style="display: none;">没有其他数据了</div>
</div>

</body>
</html>