////Check if Player has written note in a previous life and has note on them

int StartingConditional()
{
    int iResult;

    iResult = GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"NW_M4Q01C08_SPYNOTE")) &&
              GetLocalInt(GetPCSpeaker(),"NW_L_TALKPAST") ==2;

    return iResult;
}

