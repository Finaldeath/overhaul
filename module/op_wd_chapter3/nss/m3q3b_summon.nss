//* trigger gives player a hint; used for summoning room and wizard lab
void main()
{
    if (GetIsPC(GetEnteringObject()) == TRUE
    && GetLocalInt(OBJECT_SELF, "NW_L_DOONCE") == 0)
    {
        SetLocalInt(OBJECT_SELF, "NW_L_DOONCE",1);
        object oPC = GetNearestObjectByTag("M3Q3BSUMMO");
        AssignCommand(oPC, ActionStartConversation(oPC, "M3Q3B_SUMMON"));
    }
}
