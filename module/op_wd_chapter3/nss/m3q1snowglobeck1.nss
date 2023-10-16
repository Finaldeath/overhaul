// * snowglobe is not on the pedestal
int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"NW_G_M3Q01PLOTGLOBEONPEDESTAL") ==0;
    return iResult;
}
