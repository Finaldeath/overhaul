/* J'Nah's Cutscene:
 * 1. Get Jnah to run the Cutscene script
 */

//:://////////////////////////////////////////////
//:: Created By: Yaron
//:: Created On: 4/3/2003
//:://////////////////////////////////////////////


void main()
{
    // first, make sure the cutscene is run only once.
    if (GetLocalInt(OBJECT_SELF, "DO_CUTSCENE_ONCE") != 1)
    {
        object oPC = GetLastOpenedBy();
        //Check to see if this is a possessed familiar entering the trigger
        if (GetIsPossessedFamiliar(oPC) == TRUE)
        {
            object oMaster = GetMaster(oPC);
            UnpossessFamiliar(oPC);
            DelayCommand(1.5, FloatingTextStrRefOnCreature(40524, oMaster, FALSE));
            AssignCommand(OBJECT_SELF, ActionCloseDoor(OBJECT_SELF));
            return;
        }
        SetLocalInt(OBJECT_SELF, "DO_CUTSCENE_ONCE", 1);
        // player who opens the door is the main pc for this cutscene:


        SetLocalInt(oPC, "nCutsceneNumber", 31);
        SetLocalInt(oPC, "nCUT31MAINPC", 1);
        //SendMessageToPC(GetFirstPC(), "Door Openner name: " + GetName(oPC) + " CutMain: " + IntToString(GetLocalInt(oPC, "nCUT31MAINPC")));

        object oJnah = GetObjectByTag("Q3_JNAH");
        ExecuteScript("q3c_cut31start", oJnah);
    }
}


