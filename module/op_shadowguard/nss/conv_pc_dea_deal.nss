int StartingConditional()
{
    int nRand;
    int nSum = GetLocalInt(OBJECT_SELF, "N_BLCK_JCK_TOTAL");

    nRand = Random(13) + 1;

    nSum += nRand;

    SetCustomToken(7010, " " + IntToString(nRand));

    nRand = Random(13) + 1;

    //Prevent Tarin from going over right off the top.
    if (nSum + nRand > 21)
    {
        nRand = Random(8) + 1;
    }

    nSum += nRand;

    SetCustomToken(7011, " " + IntToString(nRand));

    SetLocalInt(OBJECT_SELF, "N_BLCK_JCK_TOTAL", nSum);

    SetCustomToken(7019, " " + IntToString(nSum));

    SetLocalInt(OBJECT_SELF, "N_NUMB_CARDS_IN_HAND", 2);

    return TRUE;
}
