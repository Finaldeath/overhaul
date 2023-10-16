int StartingConditional()
{
    //Player has tooth
    if (GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1Q3A00TOOTH")))
    {
        return TRUE;
    }
    //or player has key
    else if (GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1Q3A00MELDKEY")))
    {
        return TRUE;
    }
    //or Meldanen is dead
    else if (GetLocalInt(GetModule(),"NW_G_M1Q3MeldDead") == TRUE)
    {
        return TRUE;
    }
    else
    {
    return FALSE;
    }

}
