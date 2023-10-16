// * Announce that this is a wizard's lab
void main()
{
    if (GetIsPC(GetEnteringObject()) == TRUE
    && GetLocalInt(OBJECT_SELF, "NW_L_DOONCE") == 0)
    {
        object oOb = GetNearestObjectByTag("M3Q3B09LABCHEST");
        AssignCommand(oOb, ActionStartConversation(oOb, "M3Q3D_WizLab"));
        SetLocalInt(OBJECT_SELF, "NW_L_DOONCE", 1);
    }
}
