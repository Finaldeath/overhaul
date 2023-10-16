void main()
{
    int n = 6;

    int nCombMult = GetLocalInt(OBJECT_SELF, "N_CURR_COMB_MULT");

    int nMyCombination = GetLocalInt(OBJECT_SELF, "N_COMBINATION");

    int nLastComb = GetLocalInt(OBJECT_SELF, "N_LAST_COMB_" + IntToString(nCombMult));

    // Subtract off last combination on this multiplier
    nMyCombination -= (nCombMult * nLastComb);

    // Set this one now as the last combination on this multiplier
    SetLocalInt(OBJECT_SELF, "N_LAST_COMB_" + IntToString(nCombMult), n);

    nMyCombination += (nCombMult * n);

    SetLocalInt(OBJECT_SELF, "N_COMBINATION", nMyCombination);
}
