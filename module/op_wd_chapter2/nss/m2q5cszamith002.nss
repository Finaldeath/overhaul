int StartingConditional()
{
    int iResult;

    iResult = (GetIsObjectValid(GetPCSpeaker()) &&
              GetLocalInt(GetPCSpeaker(),"NW_ELAITH_PLOT") < 2) ||
              GetLocalInt(OBJECT_SELF,"NW_L_Moving") == 10 ||
             (GetLocalInt(OBJECT_SELF,"NW_L_MutaminTalk") == 0 &&
              GetLocalInt(GetModule(),"NW_G_ZamithraRobbed") == 10);
    return iResult;
}
