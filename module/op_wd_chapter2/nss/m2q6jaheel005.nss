//::///////////////////////////////////////////////
//:: Conversation
//:: m2q6Jaheel005
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
#include "NW_I0_PLOT"

void main()
{
    SetLocalInt(OBJECT_SELF,"NW_L_Busy",10);
    RewardGP(100,GetPCSpeaker(),FALSE);
    SetLocalInt(GetModule(),"NW_G_M2Q6MainPlot",GetLocalInt(GetModule(),"NW_G_M2Q6MainPlot") + 1);
    CreateObject(OBJECT_TYPE_CREATURE,"M2Q6CJAHEEL2",GetLocation(GetObjectByTag("WP_JAHEEL")));
    CreateObject(OBJECT_TYPE_CREATURE,"M2Q6CTARRAN2",GetLocation(GetObjectByTag("WP_TARRAN")));
    CreateObject(OBJECT_TYPE_CREATURE,"M2Q6CNEVA",GetLocation(GetObjectByTag("WP_NEVA")));
    ActionMoveAwayFromObject(GetPCSpeaker());
    DelayCommand(5.0,DestroyObject(OBJECT_SELF));
    SetCommandable(FALSE);
}
