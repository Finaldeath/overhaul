int StartingConditional()
{
    int iResult;

    iResult = !GetIsObjectValid(GetItemPossessedBy(OBJECT_SELF,"M2Q1ITRING02")) &&
              GetLocalInt(GetModule(),"M2Q1BranCured") == 1;
    return iResult;
}
