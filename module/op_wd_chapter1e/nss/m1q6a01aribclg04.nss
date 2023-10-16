// returns true if a player has spoken to Aribeth
// and The ritual has been performed
int StartingConditional()
{
    int bCondition = GetLocalInt(GetModule(),"NW_G_M1Q6A01AribethPostRitual")&&
                     GetLocalInt(GetModule(),"NW_G_M1Q6A01RitualComplete");
    return bCondition;
}
