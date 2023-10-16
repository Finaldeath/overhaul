// Check if rat ate a gem.
int StartingConditional()
{
    int iAteGem = GetLocalInt(OBJECT_SELF, "HX_RAT_ATE_GEM");
    if(iAteGem == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
