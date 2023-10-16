//::///////////////////////////////////////////////
//:: Shadow Lich Cutscene (OnOpen)
//:: Op_ShadowLich.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Play a cutscene where the Shadow Lich
     captures the Dark Wind and escapes to the
     Plane of Shadows.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 17, 2003
//:://////////////////////////////////////////////

void main()
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
    if (GetIsPC(oPC) == TRUE)
    {
        //Launch cutscene

        // first, make sure the cutscene is run only once.
        if (GetLocalInt(OBJECT_SELF, "DO_CUTSCENE_ONCE") != 1)
        {
            SetLocalInt(OBJECT_SELF, "DO_CUTSCENE_ONCE", 1);
            // player who opens the door is the main pc for this cutscene:

            SetLocalInt(oPC, "nCutsceneNumber", 20);
            SetLocalInt(oPC, "bMainPC_Cut20", 1);

            object oLich = GetObjectByTag("cut20_shadowlich");
            ExecuteScript("w04_cut20start", oLich);
        }


        //Add journal entry.
        //DelayCommand(2.0, AddJournalQuestEntry("Journ_Wizard_50", 1, oPC, TRUE, TRUE));
    }
}
