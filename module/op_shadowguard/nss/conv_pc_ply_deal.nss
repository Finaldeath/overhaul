int StartingConditional()
{
    int nRand;
    int nSum = GetLocalInt(GetPCSpeaker(), "N_BLCK_JCK_TOTAL");

    nRand = Random(13) + 1;

    nSum += nRand;

    SetCustomToken(7000, " " + IntToString(nRand));

    nRand = Random(13) + 1;

    nSum += nRand;

    SetCustomToken(7001, " " + IntToString(nRand));

    SetLocalInt(GetPCSpeaker(), "N_BLCK_JCK_TOTAL", nSum);

    SetCustomToken(7009, " " + IntToString(nSum));

    SetLocalInt(GetPCSpeaker(), "N_NUMB_CARDS_IN_HAND", 2);

    return TRUE;
}
