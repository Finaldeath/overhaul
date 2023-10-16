//::///////////////////////////////////////////////
//:: Name q1a3_ent_force
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When a PC attempts to enter the laboratory he/she
    will immediately be teleported back to the stairwell.
    Riisi will initiate conversation if he is still around.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 4/03
//:://////////////////////////////////////////////
void JumpPC(object oPC);
void main()
{
    object oTeleport = GetWaypointByTag("wp_lab_forcefield");
    object oPC = GetEnteringObject();
    //if you are not Riisi - you get bounced...(or a willowisp...)
    if (GetTag(oPC) != "Riisi" && GetTag(oPC) != "q1a3will1" && GetTag(oPC) != "q1a3will2")
    {
        //Clear the PC's actions
        AssignCommand(oPC, ClearAllActions());
        SignalEvent(OBJECT_SELF, EventUserDefined(1100));

        if (GetIsPC(oPC) == TRUE && IsInConversation(oPC) == FALSE)
        {
            object oRiisi = GetObjectByTag("Riisi");
            AssignCommand(oRiisi, SpeakStringByStrRef(40374));
            AssignCommand(oRiisi, ClearAllActions());
            DelayCommand(1.0, AssignCommand(oRiisi, ActionStartConversation(oPC)));
            SetLocalInt(oRiisi, "nWantTalkToPC", 1);
            SetLocalObject(oRiisi, "oPCToTalkTo", oPC);
        }


    }
}

void JumpPC(object oPC)
{
    object oDestination = GetWaypointByTag("wp_lab_forcefield");
    //SetCommandable(TRUE, oPC);
    AssignCommand(oPC, JumpToObject(oDestination));
    SetCommandable(FALSE, oPC);
}
