int StartingConditional()
{
    int iResult;

    iResult =  GetLocalInt(GetPCSpeaker(),"TALKED_TO_ONCE" + GetTag(OBJECT_SELF)) == 1 &&
               GetLocalInt(OBJECT_SELF,"NW_L_Rescued") == 0;

    return iResult;
}
