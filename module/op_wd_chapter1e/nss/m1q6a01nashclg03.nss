// returns true if no player has spoken to Nasher (after the ritual)
// and The ritual has been performed
int StartingConditional()
{
    int bCondition = GetLocalInt(GetModule(),"NW_G_M1Q6A01NasherPostRitual") == FALSE &&
                     GetLocalInt(GetModule(),"NW_G_M1Q6A01RitualComplete");
    return bCondition;
}
