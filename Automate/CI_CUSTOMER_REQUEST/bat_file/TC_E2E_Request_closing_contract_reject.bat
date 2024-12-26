@echo off
robot -T -d D:/CI_Robot/Repositories/CI_CUSTOMER_REQUEST/Testcase/E2E/ -i TC001 -L trace -d D:/CI_Robot/Repositories/CI_CUSTOMER_REQUEST/Results/TC_E2E_Request_closing_contract_reject/ D:/CI_Robot/Repositories/CI_CUSTOMER_REQUEST/Testcase/E2E/TC_E2E_Request_closing_contract_reject.robot
timeout /t 5 > nul
pause