//::///////////////////////////////////////////////
//:: Name q2a_ent_mainflr
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When the Primary Hero PC crosses this trigger
    the first time, Jera, Durst, Tethlan and Brit
    will all turn to face him/her and speak some
    one liners.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Jan 7/03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();
    if (GetLocalInt(oPC, "nPCNumber") == 1 && GetLocalInt(OBJECT_SELF, "nTriggered") != 1)
    {
        SetLocalInt(OBJECT_SELF, "nTriggered", 1);
        DestroyObject(OBJECT_SELF, 5.0);
        object oTomi = GetNearestObjectByTag("pre_tomi");
        object oDaelan = GetNearestObjectByTag("pre_daelan");
        object oLinu = GetNearestObjectByTag("pre_linu");
        object oSharwyn = GetNearestObjectByTag("pre_sharwyn");

        if (IsInConversation(oTomi) == FALSE)
        {
            AssignCommand(oTomi, SetFacingPoint(GetPosition(oPC)));
            AssignCommand(oTomi, SpeakStringByStrRef(83990));
            DelayCommand(4.0, AssignCommand(oTomi, SetFacingPoint(GetPosition(oPC))));
        }
        if (IsInConversation(oDaelan) == FALSE)
        {
            AssignCommand(oDaelan, SetFacingPoint(GetPosition(oPC)));
            DelayCommand(1.0, AssignCommand(oDaelan, SpeakString(GetStringByStrRef(83991))));
            DelayCommand(3.5, AssignCommand(oDaelan, SetFacingPoint(GetPosition(oPC))));
        }
        if (IsInConversation(oLinu) == FALSE)
        {
            AssignCommand(oLinu, SetFacingPoint(GetPosition(oPC)));
            DelayCommand(1.5, AssignCommand(oLinu, SpeakStringByStrRef(83992)));
            DelayCommand(4.2, AssignCommand(oLinu, SetFacingPoint(GetPosition(oPC))));
        }
        if (IsInConversation(oSharwyn) == FALSE)
        {
            AssignCommand(oSharwyn, SetFacingPoint(GetPosition(oPC)));
            AssignCommand(oSharwyn, ActionPlayAnimation(ANIMATION_FIREFORGET_GREETING));
            DelayCommand(3.2, AssignCommand(oSharwyn, SetFacingPoint(GetPosition(oPC))));
        }
    }

}
