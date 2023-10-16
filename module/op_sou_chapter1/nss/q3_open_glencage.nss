//::///////////////////////////////////////////////
//:: Name q3_open_glencage
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On Open - have Glendir talk with the openner
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetLastOpenedBy();
    object oGlendir = GetObjectByTag("Q3_GLENDIL");
    AssignCommand(oGlendir, ActionStartConversation(oPC));
}
