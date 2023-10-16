//::///////////////////////////////////////////////
//:: Scrivener, Include (Include Script)
//:: Inc_Scrivener.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Handle any shared behavior required by the
     Scrivener.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 3, 2003
//:://////////////////////////////////////////////

void ActionStartScrivenerConv(object oPC)
{
    //Teleport the Scrivener to oPC
    effect eTeleport = EffectVisualEffect(VFX_IMP_SUPER_HEROISM);
    object oScrivener = GetObjectByTag("H2_Scrivener");
    location lScrivener = GetLocation(oScrivener);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eTeleport, lScrivener);
    DelayCommand(0.2, AssignCommand(oScrivener, ClearAllActions()));
    DelayCommand(0.4, AssignCommand(oScrivener, ActionJumpToObject(oPC)));
    location lPC = GetLocation(oPC);
    DelayCommand(0.4, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eTeleport, lPC));

    //Clear the PC's & Scrivener's actions
    DelayCommand(0.5, AssignCommand(oPC, ClearAllActions(TRUE)));
    DelayCommand(0.5, AssignCommand(oScrivener, ClearAllActions(TRUE)));

    //Launch the conversation.
    //AssignCommand(oScrivener, ActionStartConversation(oPC));
}
