//Dying Man conversation the first time a PC enters the area
#include "nw_i0_plot"

void CreateBlood(object oMan);
void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPlayerCharacter(oPC) == TRUE)
    {
        if (GetLocalInt(oPC, "X1_" + GetTag(OBJECT_SELF) + "AUTOSAVE") != 1)
        {
            SetLocalInt(oPC, "X1_" + GetTag(OBJECT_SELF) + "AUTOSAVE", 1);
            //DoSinglePlayerAutoSave();
        }
        if (GetLocalInt(OBJECT_SELF, "nTalkedToMan") != 1)
        {
            SetLocalInt(OBJECT_SELF, "nTalkedToMan", 1);
            object oDialog = GetObjectByTag("q6mandialog");
            DelayCommand(2.0, AssignCommand(oDialog, ActionStartConversation(oPC)));
            object oMan = GetObjectByTag("dyingman");
            AssignCommand(oMan, ActionMoveToObject(oPC));

            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(4), oMan);
            DelayCommand(2.5, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectSleep(), oMan));
            DelayCommand(2.5, SetCommandable(FALSE, oMan));
            DelayCommand(2.5, CreateBlood(oMan));
        }
    }


}

void CreateBlood(object oMan)
{
    CreateObject(OBJECT_TYPE_PLACEABLE, "plc_bloodstain", GetLocation(oMan));
}
