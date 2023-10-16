int StartingConditional()
{
    int nRand;
    int nSum = GetLocalInt(OBJECT_SELF, "N_BLCK_JCK_TOTAL");

    if (nSum < 10)
    {
        nRand = Random(13) + 1;

        //Prevent Tarin from going over.
        if (nSum + nRand > 21)
        {
            nRand = Random(12) + 1;
        }

        nSum += nRand;

        SetCustomToken(7013, " " + IntToString(nRand));

        SetLocalInt(OBJECT_SELF, "N_BLCK_JCK_TOTAL", nSum);

        SetCustomToken(7019, " " + IntToString(nSum));

        SetLocalInt(OBJECT_SELF, "N_NUMB_CARDS_IN_HAND", 4);
        return TRUE;
    }

    return FALSE;
}
