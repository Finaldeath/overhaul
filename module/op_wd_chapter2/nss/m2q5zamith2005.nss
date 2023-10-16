int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"Generic_Surrender") == 0 &&
              GetLocalInt(GetModule(),"NW_G_ZamithraRobbed") == 10 &&
              !GetIsObjectValid(GetPCSpeaker());

    return iResult;
}
