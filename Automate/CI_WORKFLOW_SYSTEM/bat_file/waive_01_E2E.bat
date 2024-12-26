@echo off
robot -T -d D:/CI_Robot/Repositories/CI_WORKFLOW_SYSTEM/Testcase/E2E/ -L trace -d D:/CI_Robot/Repositories/CI_WORKFLOW_SYSTEM/Results/TC_Request_waive/ D:/CI_Robot/Repositories/CI_WORKFLOW_SYSTEM/Testcase/E2E/TC_Request_waive_01.robot
timeout /t 5 > nul
pause