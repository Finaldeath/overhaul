//checks if player has 3000 gold

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    if (GetGold(oPC) >= 3000)
        return TRUE;
    return FALSE;
}
