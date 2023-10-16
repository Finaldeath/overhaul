#include "help_general"
#include "help_hench"

void DoOkarAssassination(object oPC)
{
    object oWP;
    location lWP;
    string sPCGender;

    object oDoor = GetNearestObjectByTag("DOOR_014_0_0", oPC);

    DelayCommand(5.0, SetLocked(oDoor, FALSE));

    DelayCommand(5.1, AssignCommand(oDoor, ActionOpenDoor(oDoor)));
}

void main()
{
    if (GetIsPC(GetEnteringObject()))
        ExploreAreaForPlayer(OBJECT_SELF, GetEnteringObject());

    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
/*DEBUG*///FloatingTextStringOnCreature("DEBUG: Entering the area", oPC);


        // STAGE 0
        if (GetLocalInt(GetModule(), "N_MODULE_STAGE") == 0)
        {
/*DEBUG*///FloatingTextStringOnCreature("DEBUG: N_MODULE_STAGE == 0", oPC);
            // IF MARKIUS IS HENCHMAN, REMOVE
            object oHench = GetHenchman(oPC);

            if (GetTag(oHench) == "HENCH_MARK")
            {
                RemoveHenchman(oPC, oHench);

                SceneSpeak(oHench, GetName(oPC) + ", I shall take my leave, and allow you to speak to your father in private...  If you need me once more, seek me out in the Market District...");

                HenchmanReturn(oHench);
            }

            if (GetLocalInt(OBJECT_SELF, "N_DO_OKAR_CREATE") == 0)
            {
                DoOkarAssassination(oPC);

                SetLocalInt(OBJECT_SELF, "N_DO_OKAR_CREATE", 1);
            }
        } // END STAGE 0


        // STAGE 1
        else if (GetLocalInt(GetModule(), "N_MODULE_STAGE") == 1)
        {
/*DEBUG*///FloatingTextStringOnCreature("DEBUG: N_MODULE_STAGE == 1", oPC);
            if (GetLocalInt(OBJECT_SELF, "N_ENTER_ONCE") == 0)
            {
/*DEBUG*///FloatingTextStringOnCreature("DEBUG: N_ENTER_ONCE == 0", oPC);
                DoSinglePlayerAutoSave();
                RemoveAllEffects(oPC);

/*DEBUG*///DelayCommand(3.0, FloatingTextStringOnCreature("DEBUG: Attempting to Start Cutscene", oPC));
                DelayCommand(3.1, BeginCutscene(oPC, "sc_st_1_open"));

                SetLocalInt(OBJECT_SELF, "N_ENTER_ONCE", 1);
            }
            else
            {
/*DEBUG*///FloatingTextStringOnCreature("DEBUG: N_ENTER_ONCE != 1", oPC);
            }
        } // END STAGE 1
        else
        {
/*DEBUG*///FloatingTextStringOnCreature("DEBUG: N_MODULE_STAGE != 0 or 1", oPC);
        }
    }
}
