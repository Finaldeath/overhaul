//::///////////////////////////////////////////////
//:: Name hx_trig_outdevil
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Aug 25, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();
    object oDevil = GetObjectByTag("hx_out_devil");

    if (GetLocalInt(OBJECT_SELF, "nDoOnce") != 1 && GetIsPC(oPC))
    {
        SetLocalInt(OBJECT_SELF, "nDoOnce", 1);
        AssignCommand(oDevil, ClearAllActions(TRUE));
        AssignCommand(oDevil, SetFacingPoint(GetPosition(oPC)));
        DelayCommand(0.8, AssignCommand(oDevil, SpeakOneLinerConversation("")));
        //DelayCommand(1.0, AssignCommand(oDevil, PlayAnimation(ANIMATION_FIREFORGET_TAUNT)));
        DelayCommand(2.0, AssignCommand(oDevil, ActionAttack(oPC)));
    }
}
