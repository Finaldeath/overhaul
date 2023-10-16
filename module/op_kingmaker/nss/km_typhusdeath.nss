//::///////////////////////////////////////////////
//:: Name x2_def_ondeath
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Default OnDeath script
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 11/03
//:://////////////////////////////////////////////

void main()
{
    object oThad = GetObjectByTag("q2_thaddeus");
    object oDeus = GetObjectByTag("q2_deus");
    object oMac = GetObjectByTag("q2_mac");
    object oPC = GetFirstPC();

    if(GetLocalInt(GetModule(), "OS_KILLTYPHUS")==10)
    {
        SetLocalInt(GetModule(), "OS_KILLTYPHUS",15);
        AssignCommand(oPC,ClearAllActions(TRUE));
        //AssignCommand(oThad,ActionStartConversation(oPC));
    }
    else
    {
        SetPlotFlag(oDeus,FALSE);
        SetPlotFlag(oMac,FALSE);
    }
    ExecuteScript("nw_c2_default7", OBJECT_SELF);
}
