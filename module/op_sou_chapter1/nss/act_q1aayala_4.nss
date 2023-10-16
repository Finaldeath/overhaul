//::///////////////////////////////////////////////
//:: Name act_q1aayala_4
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Drogan will collapse at the end of the conversation
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 4/03
//:://////////////////////////////////////////////

void main()
{
    object oDrogan = GetObjectByTag("Drogan");

    SetPlotFlag(oDrogan, FALSE);
    SetCommandable(TRUE, oDrogan);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectKnockdown(), oDrogan);
    DelayCommand(1.0, AssignCommand(oDrogan, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT, 1.0, 9999.0)));

    SetPlotFlag(oDrogan, TRUE);
    DelayCommand(2.0, SetCommandable(FALSE, oDrogan));

    SetLocalInt(oDrogan, "nPoisoned", 1);
    SetLocalInt(OBJECT_SELF, "nTalkedOnce", 1);
}
