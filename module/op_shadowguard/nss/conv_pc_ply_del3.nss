int StartingConditional()
{
    int nRand;
    int nSum = GetLocalInt(GetPCSpeaker(), "N_BLCK_JCK_TOTAL");

    nRand = Random(13) + 1;

    nSum += nRand;

    SetCustomToken(7003, " " + IntToString(nRand));

    SetLocalInt(GetPCSpeaker(), "N_BLCK_JCK_TOTAL", nSum);

    SetCustomToken(7009, " " + IntToString(nSum));

    int n = GetLocalInt(GetPCSpeaker(), "N_NUMB_CARDS_IN_HAND");

    n++;

    SetLocalInt(GetPCSpeaker(), "N_NUMB_CARDS_IN_HAND", n);

    return TRUE;
}
