# NVIDIA CUDA 12.6.2 및 cuDNN을 포함한 베이스 이미지 사용 (Ubuntu 20.04)
FROM nvidia/cuda:12.6.2-cudnn-devel-ubuntu20.04

# 패키지 설치 중 인터랙티브 프롬프트 방지를 위한 환경 변수 설정
ENV DEBIAN_FRONTEND=noninteractive

# 시스템 의존성 설치 및 deadsnakes PPA 추가
RUN apt-get update && apt-get install -y \
    software-properties-common \
    curl \
    && add-apt-repository ppa:deadsnakes/ppa -y \
    && apt-get update

# Python 3.11 및 관련 패키지 설치
RUN apt-get install -y \
    python3.11 \
    python3.11-dev \
    python3.11-venv \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Python 3.11용 pip 설치 (get-pip.py 사용)
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
    && python3.11 get-pip.py \
    && rm get-pip.py

# Python 3.11 pip 업그레이드
RUN python3.11 -m pip install --upgrade pip

# 작업 디렉토리 설정
WORKDIR /app

# requirements.txt를 컨테이너로 복사
COPY requirements.txt .

# Python 의존성 설치 (python3.11 pip 사용)
RUN python3.11 -m pip install --no-cache-dir -r requirements.txt

# (선택 사항) 추가 설정, 스크립트 또는 코드를 여기에 복사
# COPY . .

# 기본 명령어 정의 (예: 셸 시작)
CMD ["bash"]