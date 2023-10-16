// returns true if no player has spoken to Aribeth (after the ritual)
// and The ritual has been performed
int StartingConditional()
{
    int bCondition = GetLocalInt(GetModule(),"NW_G_M1Q6A01AribethPostRitual") == FALSE &&
                     GetLocalInt(GetModule(),"NW_G_M1Q6A01RitualComplete");
    return bCondition;
}
