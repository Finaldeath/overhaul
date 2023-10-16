int StartingConditional()
{
    int iResult;

    iResult = GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M2Q03ISTIRGEEAR")) ||
              GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M2Q05IZOREAR")) ||
              GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M2Q02IWYVERNEAR")) ||
              GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M2Q04IDELILAHEAR"));
    return iResult;
}
