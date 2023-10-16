//::///////////////////////////////////////////////
//:: Name q1h_endcon_kob
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Move Kobold back to near the cradle and then face
    the door
    Reactivate the trigger for the next time the PC
    enters.

*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 12/03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    object oCradle = GetObjectByTag("q1hcradle");
    object oTrigger = GetObjectByTag("q1h_k_trig");

    SetLocalInt(oTrigger, "nTriggered", 2);
    SetLocalInt(OBJECT_SELF, "nTalkedOnce", 1);
    ActionMoveToObject(oCradle);
    DelayCommand(5.0, SetFacingPoint(GetPosition(oPC)));

}
