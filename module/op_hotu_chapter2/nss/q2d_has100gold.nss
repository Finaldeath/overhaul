///checks if player has 100 gold

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    if (GetGold(oPC) >= 100)
        return TRUE;
    return FALSE;
}
