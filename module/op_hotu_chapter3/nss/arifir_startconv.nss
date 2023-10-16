//::///////////////////////////////////////////////
//:: Generic Start Conv (OnUse)
//:: Us_StartConv.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Generic conversation starter for placeables
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Edited By: Brad Prince
//:: Created On: July 15, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetLastUsedBy();
    int iThawed = GetLocalInt(GetModule(), "HX_ARIBETH_FIRE");

    AssignCommand(oPC, ClearAllActions(TRUE));

    if(iThawed == TRUE)
    {
        ActionStartConversation(oPC, "hx_fire_conv");
    }
    else
    {
        ActionStartConversation(oPC, "h2_ghost_aribeth");
    }
}
