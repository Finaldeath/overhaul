int StartingConditional()
{
    int iResult;

    iResult =  GetLocalInt(GetPCSpeaker(),"DRUID_CHAL"+GetTag(OBJECT_SELF)) == 99;
    return iResult;
}
