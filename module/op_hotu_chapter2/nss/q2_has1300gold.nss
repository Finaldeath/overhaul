//checks if player has 1300 gold

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    if (GetGold(oPC) >= 1300)
        return TRUE;
    return FALSE;
}
