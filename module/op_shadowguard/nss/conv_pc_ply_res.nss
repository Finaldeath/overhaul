int StartingConditional()
{
    int nPC = GetLocalInt(GetPCSpeaker(), "N_BLCK_JCK_TOTAL");
    int nPCNumbCards = GetLocalInt(GetPCSpeaker(), "N_NUMB_CARDS_IN_HAND");

    int nDealer = GetLocalInt(OBJECT_SELF, "N_BLCK_JCK_TOTAL");
    int nDealerNumbCards = GetLocalInt(OBJECT_SELF, "N_NUMB_CARDS_IN_HAND");

    if (nPC > nDealer && nPC <= 21)
        return TRUE;

    else if (nPC == nDealer && nPCNumbCards >= nDealerNumbCards)
        return TRUE;

    else
        return FALSE;
}
