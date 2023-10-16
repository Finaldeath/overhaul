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
//:: Created On: July 15, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetLastUsedBy();
    AssignCommand(oPC, ClearAllActions(TRUE));
    ActionStartConversation(oPC);
}
