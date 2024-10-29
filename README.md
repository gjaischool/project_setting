# 프로젝트 설정 (project_setting)

## 소개
이 프로젝트는 Python 개발 환경을 Docker 컨테이너로 설정하기 위한 것입니다. Docker를 사용하여 팀원들이 동일한 개발 환경에서 작업할 수 있도록 도와줍니다.

## 파일 구조
project_setting/  
├── Dockerfile  
├── requirements.txt  
├── .gitignore  
└── README.md


## 설치 및 실행

### 1. 리포지토리 클론
GitHub 리포지토리를 클론합니다:
```bash
git clone https://github.com/gjaischool/project_setting.git
cd project_setting

### 2. Docker 이미지 빌드
docker build -t my-python-env:latest .

### 3. Docker 컨테이너 실행
GPU 지원이 필요한 경우:
docker run --gpus all -it -v C:/Users/user/Desktop/project_setting:/app my-python-env:latest
GPU 지원이 필요 없는 경우:
docker run -it -v C:/Users/user/Desktop/project_setting:/app my-python-env:latest
