// Sand Dungeon on-enter:
// if player is petrified and ending cutscene did not start then have heurodis init dialog again.
// if heurodis has taken the mythallar, then just start the cutscene

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;
    object oHeurodis = GetObjectByTag("Q4A_HOODED_FIGURE");
    if(oHeurodis == OBJECT_INVALID)
    {
        SignalEvent(OBJECT_SELF, EventUserDefined(101)); // focus and jump to next module
        return;
    }
    // Heurodis is still here - just init dialog again (if was speaking to that pc).
    if(GetLocalObject(oHeurodis, "ACTIVE_PC2") == oPC)
        AssignCommand(oHeurodis, ActionStartConversation(oPC));
}
