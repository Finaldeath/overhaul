//::///////////////////////////////////////////////
//:: Conversation
//:: m2q6Tarran001
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Jaheel and Tarran leave, and the MainPlot
    global in incremented.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: January 9, 2002
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(GetModule(),"NW_G_M2Q6MainPlot",GetLocalInt(GetModule(),"NW_G_M2Q6MainPlot") + 1);
    CreateObject(OBJECT_TYPE_CREATURE,"M2Q6CJAHEEL2",GetLocation(GetObjectByTag("WP_JAHEEL")));
    CreateObject(OBJECT_TYPE_CREATURE,"M2Q6CTARRAN2",GetLocation(GetObjectByTag("WP_TARRAN")));
    CreateObject(OBJECT_TYPE_CREATURE,"M2Q6CNEVA",GetLocation(GetObjectByTag("WP_NEVA")));
    ActionMoveAwayFromObject(GetPCSpeaker());
    DelayCommand(5.0,DestroyObject(OBJECT_SELF));
    SetCommandable(FALSE);
}
