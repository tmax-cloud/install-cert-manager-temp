# Cert Manager 임시 설치 가이드

## 폐쇄망 설치 가이드
* 외부 네트워크 통신이 가능한 환경에서 0.preset-cn.sh를 이용하여 이미지 및 패키지 다운로드하여 옮겨준 뒤, 폐쇄망 환경에서 1.2.install-cert-cn.sh 스크립트를 실행
    * 외부 네트워크 환경 스크립트 실행순서
        ```bash
        $ cd manifest
        $ chmod +x *.sh
        $ source version.conf
        $ bash 0.preset-cn.sh
        ```

    * 폐쇄망 설치 스크립트 실행순서
        * 외부 네트워크 환경에서 받은 파일들을 manifest경로 아래 위치시켜야 함
            * img/
            * cert-manager-v1.1.0.yaml
            
        * Cert Manager 설치
        ```bash
        $ cd manifest
        $ chmod +x *.sh
        $ source version.conf
        $ export REGISTRY={registryIP:PORT}
        $ bash 1.2.install-cert-cn.sh
        ```

## Install Steps(Open Network)
* Cert Manager 설치
    ```bash
    $ cd manifest
    $ chmod +x *.sh
    $ source version.conf
    $ bash 1.1.install-capi-on.sh
    ```

## Uninstall Steps
* Cert-manager 삭제
    ```bash
    $ cd manifest
    $ source version.conf
    $ bash 2.delete.sh
    ```