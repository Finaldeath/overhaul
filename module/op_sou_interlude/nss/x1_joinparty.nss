// Using this portal would jump the player to the current start point
// or the rest of the party

void main()
{
    object oWP = GetLocalObject(GetModule(), "X1_CURRENT_START");
    object oOtherPC;
    object oPC = GetFirstPC();
    // trying to find another member of the party which is not in this area (sealed).
    while(oPC != OBJECT_INVALID)
    {
        if(oPC != GetLastUsedBy() && GetArea(oPC) != GetArea(GetLastUsedBy()))
        {
            oOtherPC = oPC; // found another pc
            break;
        }
        oPC = GetNextPC();
    }

    if(oOtherPC != OBJECT_INVALID)
        AssignCommand(GetLastUsedBy(), JumpToObject(oOtherPC));
    else
        AssignCommand(GetLastUsedBy(), JumpToObject(oWP));
}
