int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"NW_G_M2Q3KharlatIn") == 10 &&
              GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M2Q03I"));
    return iResult;
}
