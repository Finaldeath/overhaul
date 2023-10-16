int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"Num_Ears_Collected") == 1;
    return iResult;
}
