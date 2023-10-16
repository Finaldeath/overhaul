/////Check if Asheera has joined up with PC

int StartingConditional()
{
    int iResult;

    iResult = GetLocalObject(OBJECT_SELF,"NW_L_M4Q01PLOT_ALLY") == GetPCSpeaker();
    return iResult;
}
