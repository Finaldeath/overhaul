// the PC is not the party leader or a single player

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oLeader = GetFactionLeader(oPC);
    string sName1 = GetName(oPC);
    string sName2 = GetName(oLeader);
    if (sName1 != sName2)
    {
        object oArea1 = GetArea(oPC);
        object oArea2 = GetArea(oLeader);
        if (GetTag(oArea1) != GetTag(oArea2))
        {
            return TRUE;
        }
    }
    return FALSE;
}
