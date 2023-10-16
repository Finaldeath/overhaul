int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"Adv_Given")==10;
    return iResult;
}
