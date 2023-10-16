// check to see if there are any other PC's in the party that Tymofarrar can see

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oParty = GetFirstFactionMember(oPC, TRUE);
    while (GetIsObjectValid(oParty))
    {
        if ((oParty != oPC) && (GetObjectSeen(oParty)))
        {
            return TRUE;
        }
        oParty = GetNextFactionMember(oPC, TRUE);
    }
    return FALSE;
}
