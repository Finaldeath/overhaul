//::///////////////////////////////////////////////
//:: Drinking the Flaming Orc
//:: act_tha_flameorc
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC drinks the flaming orc
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

void main()
{
//PC should play drink animation,
//then make a medium con check to see if they pas out.
//If they do, break dialogue, play fall down animation,
//fade in and out and *no Longer* take 50 gold from pickpocket.
    object oPC = GetFirstPC();
    ActionPauseConversation();
    AssignCommand(oPC,ActionPlayAnimation(ANIMATION_FIREFORGET_DRINK));

    if(GetAbilityScore(oPC,ABILITY_CONSTITUTION)<=10)
    {
        AssignCommand(oPC,ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT, 1.0, 4.0));
        FadeToBlack(oPC);
        //TakeGoldFromCreature(50,oPC,TRUE);
        DelayCommand(2.0f, FadeFromBlack(oPC));
    }

    ActionResumeConversation();
}
