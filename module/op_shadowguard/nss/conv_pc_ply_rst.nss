int StartingConditional()
{
    object oPC = GetPCSpeaker();

    SetLocalInt(oPC, "N_PLAYING_CARDS", 0);

    SetLocalInt(OBJECT_SELF, "N_NUMB_OF_CARD_PLAYERS", 0);

    SetLocalInt(OBJECT_SELF, "N_BET_AMOUNT", 0);

    SetLocalInt(GetPCSpeaker(), "N_NUMB_CARDS_IN_HAND", 0);

    SetLocalInt(OBJECT_SELF, "N_NUMB_CARDS_IN_HAND", 0);

    SetLocalInt(GetPCSpeaker(), "N_BLCK_JCK_TOTAL", 0);

    SetLocalInt(OBJECT_SELF, "N_BLCK_JCK_TOTAL", 0);

    int i;

    for (i = 0; i < 5; i++)
    {
        SetCustomToken(7000 + i, "");
        SetCustomToken(7010 + i, "");
    }

    return FALSE;
}
