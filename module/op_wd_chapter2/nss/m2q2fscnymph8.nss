int StartingConditional()
{
    int iResult;

    iResult =  GetLocalInt(GetPCSpeaker(),"M2Q2FNYMPH_TALK"+GetTag(OBJECT_SELF)) == 20;
    return iResult;
}
