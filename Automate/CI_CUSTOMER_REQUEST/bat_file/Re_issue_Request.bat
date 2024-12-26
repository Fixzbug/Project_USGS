@echo off
robot -T -d D:/CI_Robot/Repositories/CI_CUSTOMER_REQUEST/Testcase/E2E/ -i TC003 -L trace -d D:/CI_Robot/Repositories/CI_CUSTOMER_REQUEST/Results/TC_E2E_Re_issue_request/ D:/CI_Robot/Repositories/CI_CUSTOMER_REQUEST/Testcase/E2E/TC_E2E_Re_issue_request.robot
timeout /t 5 > nul
pause