class Admin::OrdersController < ApplicationController

    #管理者トップページ(注文履歴一覧)
    def index
    @orders = Order.all
    end

    #注文詳細画面(ステータス編集を兼ねる)
    def show
    end
    
    #注文ステータスの更新
    def update
    end
end
