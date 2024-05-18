# Powershell
#------------------------------------------------
# ���������Ľ����ն�
# bin\terminal.ps1
#------------------------------------------------


# ��ӡ�����б��������������ϱ��

Write-Host "Select a container to enter:"
$CONTAINER_LIST = docker ps --format "{{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}"
$CONTAINER_LIST | ForEach-Object { $_ -replace "`t", " " } | ForEach-Object { $i=0 } { ++$i; "$i. $_" }


# ��ȡ�û�ѡ����������

$NUMBER = Read-Host "Enter a number (0 for exit):"
if ($NUMBER -gt 0) {
    $CONTAINER_ID = ($CONTAINER_LIST | Select-Object)[$NUMBER-1].Substring(0, 12)
    docker exec -it $CONTAINER_ID /bin/bash

} else {
    Write-Host "Invalid container number."
}