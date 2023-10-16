//::///////////////////////////////////////////////
//:: Name hx_guard2_speak
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Guardian 2 speaks, then attacks.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 24, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();
    object oGuard = GetObjectByTag("hx_black_slaad");

    if(GetIsPC(oPC))
    {
        // Do once
        if (GetLocalInt(OBJECT_SELF, "nDoOnce") != 1)
        {
            SetLocalInt(OBJECT_SELF, "nDoOnce", 1);
            AssignCommand(oGuard, SpeakOneLinerConversation());
            DelayCommand(2.5, ChangeToStandardFaction(oGuard, STANDARD_FACTION_HOSTILE));
            DelayCommand(3.0, AssignCommand(oGuard, ActionAttack(oPC)));
        }
    }
}
