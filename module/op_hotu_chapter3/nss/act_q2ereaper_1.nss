//::///////////////////////////////////////////////
//:: Name: act_q2ereaper_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The Reaper will create a personalized death door
    for the PC speaker.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Jan 16/03
//:://////////////////////////////////////////////

void CreateDoor(object oPC);

void main()
{
    //ActionPauseConversation();
    AssignCommand(OBJECT_SELF, ActionCastFakeSpellAtLocation(SPELL_ISAACS_LESSER_MISSILE_STORM, GetLocation(GetWaypointByTag("wp_q2edeathdoor"))));
    object oPC = GetPCSpeaker();
    DelayCommand(3.0, CreateDoor(oPC));
    //DelayCommand(3.5, ActionResumeConversation());

}
void CreateDoor(object oPC)
{
    location lTarget = GetLocation(GetWaypointByTag("wp_q2edeathdoor"));
    //Apply a little effect for the door
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SOUND_BURST), lTarget);
    object oNewDoor = CreateObject(OBJECT_TYPE_PLACEABLE, "x2_deathdoor", lTarget, FALSE, "D" + GetName(oPC));
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_GHOSTLY_VISAGE), oNewDoor);
    SetLocalString(oNewDoor, "szOwner", GetName(oPC));
    DelayCommand(1.0, AssignCommand(oNewDoor, ActionStartConversation(oPC, "con_hod_ddoor")));
}
