FROM ruby:2.6.6

# 必要なパッケージのインストール
RUN apt-get update -qq && apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
# 作業ディレクトリの作成、設定
RUN mkdir /myapp_s
WORKDIR /myapp_s
# ローカルのGemfileとGemfile.lockをコピー
COPY Gemfile /myapp_s/Gemfile
COPY Gemfile.lock /myapp_s/Gemfile.lock
# Gemのインストール実行
RUN bundle install
COPY . /myapp_s