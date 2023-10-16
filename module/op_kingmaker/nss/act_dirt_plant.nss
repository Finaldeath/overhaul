//::///////////////////////////////////////////////
//:: act_dirt_plant
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC plants the seed
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    object oDirt = GetObjectByTag("q1e_kai_dirt");
    object oSeed = GetItemPossessedBy(oPC,"q1_kaidala_seed");
    object oKai = GetObjectByTag("os_hen_kai");

    SetLocalInt(GetFirstPC(), "OS_KAI_PLANT",20);
    ActionPauseConversation();

    DelayCommand(0.5f, AssignCommand(oKai, ClearAllActions(TRUE)));
    DelayCommand(0.5f, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW, 1.0, 2.0)));

    DelayCommand(1.9f, AssignCommand(oKai, ActionCastFakeSpellAtLocation(SPELL_HEALING_CIRCLE, GetLocation(oDirt))));

    DelayCommand(3.0f, ActionResumeConversation());
    DestroyObject(oSeed);
}
