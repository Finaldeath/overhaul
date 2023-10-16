//::///////////////////////////////////////////////
//:: Name hx_demonfly_in
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     The demon flies in.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 25, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    location lLoc = GetLocation(oPC);

    MusicBattlePlay(GetArea(oPC));
    ActionPauseConversation();
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SCREEN_SHAKE), lLoc);
    CreateObject(OBJECT_TYPE_CREATURE, "hx_hand_demon", lLoc);
    DelayCommand(2.0, ActionResumeConversation());
}
