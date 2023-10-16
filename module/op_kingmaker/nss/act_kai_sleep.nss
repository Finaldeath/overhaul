//::///////////////////////////////////////////////
//:: act_kai_sleep
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Kaidala and the PC rest by the tree.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    location lMonster = GetLocation(GetObjectByTag("q1_way_firemonst"));
    effect eSleep = EffectSleep();
    ActionPauseConversation();
//    ActionPlayAnimation(ANIMATION_LOOPING_MEDITATE,1.0,2.0);
//    AssignCommand(oPC,ActionPlayAnimation(ANIMATION_LOOPING_MEDITATE,1.0,2.0));
//    ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eSleep,oPC,2.0);
//    ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eSleep,OBJECT_SELF,2.0);
//    ActionRest();   //this seems to crash the game
//    AssignCommand(oPC,ActionRest());
    FadeToBlack(oPC,FADE_SPEED_FAST);
    CreateObject(OBJECT_TYPE_CREATURE,"q1_firemonster",lMonster);
    FadeFromBlack(oPC,FADE_SPEED_SLOW);
    ActionResumeConversation();
}
