//::///////////////////////////////////////////////
//:: Portable Door (Action - Enter)
//:: A_PortDoor_Enter.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Jump the player to the Lair of the Shadow
     Lich.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 27, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    object oShadowLich = GetObjectByTag("ShadowLich");
    object oLair = GetObjectByTag("Wizard_05");
    int bSpawnOnce = GetLocalInt(oLair, "bSpawnOnce");

    if (oShadowLich == OBJECT_INVALID &&
        bSpawnOnce == FALSE)
    {
        //Flag the DoOnce
        SetLocalInt(oLair, "bSpawnOnce", TRUE);

        //Spawn the servant.
        object oServantSpawn = GetObjectByTag("ServantSpawn");
        location lServantSpawn = GetLocation(oServantSpawn);
        CreateObject(OBJECT_TYPE_CREATURE, "shadowservant", lServantSpawn);

        //Destroy any remaining hostile Shadovar
        int iNth = 1;
        object oArcher = GetNearestObjectByTag("TowerShadArcher", oServantSpawn, iNth);
        object oCleric = GetNearestObjectByTag("TowerShadCleric", oServantSpawn, iNth);
        object oWizard = GetNearestObjectByTag("TowerShadWizard", oServantSpawn, iNth);
        object oWarrior = GetNearestObjectByTag("TowerShadWarrior", oServantSpawn, iNth);
        while (oArcher != OBJECT_INVALID ||
               oCleric != OBJECT_INVALID ||
               oWizard != OBJECT_INVALID ||
               oWarrior != OBJECT_INVALID)
        {
            DestroyObject(oArcher);
            DestroyObject(oCleric);
            DestroyObject(oWizard);
            DestroyObject(oWarrior);

            //Update the loop variables.
            iNth++;
            oArcher = GetNearestObjectByTag("TowerShadArcher", oServantSpawn, iNth);
            oCleric = GetNearestObjectByTag("TowerShadCleric", oServantSpawn, iNth);
            oWizard = GetNearestObjectByTag("TowerShadWizard", oServantSpawn, iNth);
            oWarrior = GetNearestObjectByTag("TowerShadWarrior", oServantSpawn, iNth);
        }
    }

    //Jump them to the Lair
    object oTarget = GetObjectByTag("PortableDoorTarget");
    AssignCommand(oPC, JumpToObject(oTarget));
    DelayCommand(2.0, PlayAnimation(ANIMATION_PLACEABLE_CLOSE));

    //Give the player XP if they haven't already received it.
    int bXP = GetLocalInt(oPC, "XP_Wizard_06");
    if (bXP == FALSE)
    {
        SetLocalInt(oPC, "XP_Wizard_06", TRUE);
        int iXP = FloatToInt(GetJournalQuestExperience("Journ_Wizard_End") * 0.10);
        GiveXPToCreature(oPC, iXP);
    }
}
