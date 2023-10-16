//::///////////////////////////////////////////////
//:: Entered
//:: m2q5statuespeak
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The statue speaks a line when a PC enters the
    trigger.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: April 25, 2002
//:://////////////////////////////////////////////

void main()
{
    object oEntered = GetEnteringObject();
    object oStatue = GetObjectByTag("M2Q5STATUE");
    location lStatue = GetLocation(oStatue);

    if (GetIsPC(oEntered))
    {
        SetLocalInt(oStatue,"NW_L_Speak",1);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_PWSTUN),lStatue);
        AssignCommand(oStatue,SpeakOneLinerConversation());
    }
}
