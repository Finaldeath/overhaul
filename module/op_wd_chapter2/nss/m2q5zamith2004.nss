int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"NW_L_Moved") == 10 &&
              GetLocalInt(GetModule(),"NW_L_ZamithraTakePC") == 10 &&
              GetLocalInt(GetModule(),"NW_G_ZamithraRobbed") == 0 &&
              GetIsObjectValid(GetPCSpeaker());
    return iResult;
}
