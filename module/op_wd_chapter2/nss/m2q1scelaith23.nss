int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"Num_Gems_Returned") < 3;
    return iResult;
}
