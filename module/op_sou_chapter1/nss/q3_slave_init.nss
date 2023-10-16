// glendir inits conv

void main()
{
    object oPC = GetLastUsedBy();
    object oKey = GetItemPossessedBy(oPC, "Q3_CAGE_KEY");
    if(oKey == OBJECT_INVALID)
    {
        AssignCommand(oPC, PlaySound("as_dr_locked3"));
        FloatingTextStrRefOnCreature(40405, oPC);
        return;
    }
    else
    {
        AssignCommand(oPC, PlaySound("as_dr_metmedcl2"));
        DestroyObject(oKey);
        object oWall = GetObjectByTag("Q3_CAGE_WALL");
        DestroyObject(oWall);
        object oPos = GetObjectByTag("Q3_OPEN_CAGE_WALL");
        CreateObject(OBJECT_TYPE_PLACEABLE, "x0_cagewall", GetLocation(oPos));
        object oGlendir = GetNearestObjectByTag("Q3_GLENDIL");
        if(oGlendir != OBJECT_INVALID)
            AssignCommand(oGlendir, DelayCommand(2.0, ActionStartConversation(oPC)));
    }


}
