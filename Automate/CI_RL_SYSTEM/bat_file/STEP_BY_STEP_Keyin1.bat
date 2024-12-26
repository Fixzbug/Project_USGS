@echo off
robot -T -d D:/CI_Robot/Repositories/CI_RL_SYSTEM/Testcase/E2E/ -L trace -d D:/CI_Robot/Repositories/CI_RL_SYSTEM/Results/Step_by_Step/ --include STEP_KS1 D:/CI_Robot/Repositories/CI_RL_SYSTEM/Testcase/E2E/TC_RL_Matrix_step_by_step.robot
timeout /t 5 > nul
pause