//checks if player has 5000 gold

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    if (GetGold(oPC) >= 5000)
        return TRUE;
    return FALSE;
}
