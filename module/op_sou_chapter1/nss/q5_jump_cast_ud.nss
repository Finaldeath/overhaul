//::///////////////////////////////////////////////
//:: Invisible object (jumping caster) user defined event
//:: q5_jump_cast_ud
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This invisible object is responsible for casting the "jumping kobold" spell
*/
//:://////////////////////////////////////////////
//:: Created By: Yaron
//:: Created On: 18/2/2003
//:://////////////////////////////////////////////


void main()
{
    int nEvent = GetUserDefinedEventNumber();
    object oTarget = GetNearestObjectByTag("Q5A_PLATFORM");
    ActionCastSpellAtObject(511, oTarget, METAMAGIC_ANY, TRUE);
    DelayCommand(0.5, SignalEvent(GetArea(OBJECT_SELF), EventUserDefined(101)));
}
